package com.jht.wechat.platform.config;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLDecoder;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * ProperitesConfigProvider 目前的实现是取property-list.txt中的配置项，如果有，读取里面的配置路径，进行加载
 * 否则默认读取local
 * @author jht
 */
final class PropertiesConfigProvider {

    private Properties props;

    /** config配置文件是否在property-list中配置好了，避免重复 */
    private boolean configFoundInPropertyList = false;

    /** user-config配置文件是否在property-list中配置好了，避免重复 */
    private boolean userConfigFoundInPropertyList = false;

    protected Log logger = LogFactory.getLog(this.getClass());

    private static final String PROPERTY_LIST_FILE_PATH = "/property-list.txt";

    private static final String DEFAULT_CONFIG_FILE_PATH = "/config.properties";

    private static final String LOCAL_CONFIG_FILE_PATH = "/local.properties";

    private static final String USER_CONFIG_FILE_PATH = "/user.properties";

    private static final PropertiesConfigProvider INSTANCE = new PropertiesConfigProvider();

    public static PropertiesConfigProvider getInstance() {
        return INSTANCE;
    }

    private PropertiesConfigProvider() {
        init();
    }

    /**
     * 初始化properties
     * @author jht
     */
    private void init() {
        initProperties();
    }

    /**
     * 加载配置文件
     * 不单独处理user-config.properties
     * @author jht
     */
    private void initProperties() {
        props = new Properties();
        File properteisListFile = getPropertiesListFile();
        Properties properties;
        // local.properties超脱于property-list.txt的管理，它老牛B了，优先级最高
        properties = getProperties(LOCAL_CONFIG_FILE_PATH);
        applyIf(properties);
        if (null != properteisListFile && properteisListFile.exists()) {

            List<String> lines = getFileLineList(properteisListFile, "utf-8");
            // 下面行的优先级比上面行的优先级高
            for (int i = lines.size() - 1; i > -1; i--) {
                String line = lines.get(i);
                line = line.trim();
                if (line.length() == 0 || line.startsWith("#")) {
                    continue;
                }
                properties = parseLine(line, "props.");
                if (properties == null) {
                    properties = parseLine(line, "");
                }
                if (properties != null) {
                    applyIf(properties);
                } else {
                    logger.debug("配置文件" + line + "不存在！");
                }
            }
        }
        if (!userConfigFoundInPropertyList) {
            properties = getProperties(USER_CONFIG_FILE_PATH);
            applyIf(properties);
        }
        if (!configFoundInPropertyList) {
            properties = getProperties(DEFAULT_CONFIG_FILE_PATH);
            applyIf(properties);
        }
    }

    /**
     * 获得property-list.txt文件,如果取不到就是null
     * @return
     * @author jht
     */
    private File getPropertiesListFile() {
        File file = null;
        // 处理property-list.txt
        URL url = getResource(PROPERTY_LIST_FILE_PATH);
        String listPath = null;
        if (url != null) {
            listPath = url.getPath();
            try {
                listPath = URLDecoder.decode(listPath, "utf-8");
            } catch (UnsupportedEncodingException e) {
                logger.warn("解析失败", e);
            }
        }
        if (StringUtils.isNotBlank(listPath)) {
            file = new File(listPath);
        }
        return file;
    }

    private URL getResource(String resourceName) {
        URL url = Thread.currentThread().getContextClassLoader()
                .getResource(resourceName);
        if(null == url){
            url = this.getClass().getResource(resourceName);
        }
        return url;
    }

    private InputStream getInputStream(String name) {
        InputStream input = Thread.currentThread().getContextClassLoader()
                .getResourceAsStream(name);
        if(null == input){
            input = this.getClass().getResourceAsStream(name);
        }
        return input;
    }

    private List<String> getFileLineList(File file, String encoding) {
        List<String> lines = Collections.emptyList();
        try {
            lines = FileUtils.readLines(file, encoding);
        } catch (IOException e) {
            logger.error("读取property-list.txt失败", e);
        }
        return lines;
    }

    /**
     * 解析property-list.txt,获取行所代表的资源文件的properties
     * @param line
     * @param prefix
     * @return
     * @author jht
     */
    private Properties parseLine(String line, String prefix) {
        Properties properties = null;
        String propertyFile = null;
        if (line.startsWith("/")) {
            propertyFile = line.substring(1).replaceAll("/", ".");
        } else {
            propertyFile = prefix + line;
        }
        if (propertyFile.equals("config")) {
            configFoundInPropertyList = true;
        }
        if (propertyFile.equals("user-config")) {
            userConfigFoundInPropertyList = true;
        }
        try {
            propertyFile = propertyFile.replace(".", "/");
            if (!propertyFile.startsWith("/")) {
                propertyFile = "/" + propertyFile;
            }
            propertyFile += ".properties";
            properties = getProperties(propertyFile);
        } catch (Exception e) {
            logger.warn("读取配置文件失败", e);
        }
        return properties;
    }

    /**
     * applyIf 如果props中没有的配置,就加进来,有就不加
     * @param properties
     */
    private void applyIf(Properties properties) {
        if (null != properties && !properties.isEmpty()) {
            Iterator<Map.Entry<Object, Object>> ite = properties.entrySet()
                    .iterator();
            while (ite.hasNext()) {
                Map.Entry<Object, Object> entry = ite.next();
                if (!props.containsKey(entry.getKey())) {
                    props.put(entry.getKey(), entry.getValue());
                }
            }
        }
    }

    private Properties getProperties(String propertyFile) {
        Properties properties = null;
        InputStream input = getInputStream(propertyFile);
        if (null != input) {
            try {
                properties = new Properties();
                properties.load(input);
            } catch (Exception e) {
                logger.warn("读取配置文件失败", e);
            } finally {
                IOUtils.closeQuietly(input);
            }
        }
        return properties;
    }

	public String getProperty(String key) {
		String value = props.getProperty(key);
		return value;
	}
}
