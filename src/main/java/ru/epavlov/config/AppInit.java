package ru.epavlov.config;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;
import org.telegram.telegrambots.ApiContextInitializer;

public class AppInit extends AbstractAnnotationConfigDispatcherServletInitializer {
    static {
        ApiContextInitializer.init();
    }


    @Override
    protected Class<?>[] getRootConfigClasses() {
        return new Class<?>[]{WebConfig.class};
    }

    @Override
    protected Class<?>[] getServletConfigClasses() {
        return new Class<?>[]{};
    }

    @Override
    protected String[] getServletMappings() {
        return new String[]{"/"};
    }

}