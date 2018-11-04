package com.jht.wechat.platform.config;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * 配置工具类
 */
public class PropertiesConfigUtils {
    private static final Log LOG = LogFactory.getLog(PropertiesConfigUtils.class);
    public static final String getProperty(String key) {
        return PropertiesConfigProvider.getInstance().getProperty(key);
    }

    public static final String getProperty(String key, String defaultValue) {
        String value = PropertiesConfigProvider.getInstance().getProperty(key);
        if (value == null) {
            value = defaultValue;
        }
        return value;
    }

    public static final int getIntProperty(String key, int defaultValue) {
        int intValue = defaultValue;
        String value = PropertiesConfigProvider.getInstance().getProperty(key);
        if (StringUtils.isNotBlank(value)) {
            try {
                intValue = Integer.parseInt(value);
            } catch (Exception e) {
                LOG.error(e.getMessage(), e);
            }
        }
        return intValue;
    }

    public static final boolean getBooleanProperty(String key,
            boolean defaultValue) {
        boolean booleanValue = defaultValue;
        String value = PropertiesConfigProvider.getInstance().getProperty(key);
        if (StringUtils.isNotBlank(value)) {
            try {
                booleanValue = Boolean.parseBoolean(value);
            } catch (Exception e) {
                LOG.error(e.getMessage(), e);
            }
        }
        return booleanValue;
    }

}
