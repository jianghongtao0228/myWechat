package com.jht.wechat.platform.config;

import java.util.Properties;
import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;

/**
 * 替代spring的处理，即可多文件，又可加解密 PropertyPlaceholderConfigurerEx
 */
public class PropertyPlaceholderConfigurerEx extends PropertyPlaceholderConfigurer {
    @Override
    protected String resolvePlaceholder(String placeholder, Properties props) {
        String value = PropertiesConfigProvider.getInstance().getProperty(placeholder);
        return value;
    }
}
