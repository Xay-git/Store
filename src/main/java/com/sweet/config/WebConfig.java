package com.sweet.config;

import com.sweet.core.exception.ErrorView;
import com.sweet.core.properties.SystemProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;

import java.util.List;

@Configuration
public class WebConfig extends WebMvcConfigurationSupport {



    @Override
    protected void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
        converters.add(new MvcJsonConverter());
    }
    @Autowired
    SystemProperties systemProperties;

    /**
     * 配置servlet处理
     */
    @Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
        configurer.enable();
    }
    /**
     * 跨域
     */
    @Override
    public void addCorsMappings(CorsRegistry registry) {



        registry.addMapping("/**")
                .allowedOrigins("*")
                .allowedMethods("GET","POST");
    }
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {

        registry.addResourceHandler("/**")
                .addResourceLocations("classpath:/resources/")
                .addResourceLocations("classpath:/static/")
                .addResourceLocations("classpath:/public/");
        super.addResourceHandlers(registry);


        registry.addResourceHandler("/upload/**")
                // /upload/**表示在磁盘upload目录下的所有资源会被解析为以下的路径
                .addResourceLocations("file:"+systemProperties.getUploadPath()) //媒体资源
                .addResourceLocations("classpath:/META-INF/resources/");

    }

    /**
     * 默认错误页面，返回json
     */
    @Bean("error")
    public ErrorView error() {
        return new ErrorView();
    }

}
