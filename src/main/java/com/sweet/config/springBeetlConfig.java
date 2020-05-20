package com.sweet.config;import com.sweet.core.properties.SystemProperties;import com.sweet.core.util.TemplateUtil;import org.beetl.core.GroupTemplate;import org.beetl.core.resource.ClasspathResourceLoader;import org.beetl.ext.spring.BeetlGroupUtilConfiguration;import org.beetl.ext.spring.BeetlSpringViewResolver;import org.springframework.beans.factory.annotation.Autowired;import org.springframework.beans.factory.annotation.Qualifier;import org.springframework.beans.factory.annotation.Value;import org.springframework.context.annotation.Bean;import org.springframework.context.annotation.Configuration;import org.springframework.core.io.Resource;import org.springframework.core.io.support.PathMatchingResourcePatternResolver;import org.springframework.core.io.support.ResourcePatternResolver;import java.util.HashMap;import java.util.Map;/** * beetl配置类 */@Configurationpublic class springBeetlConfig {    @Autowired    private SystemProperties systemProperties;    @Bean(name = "beetlConfig")    public BeetlGroupUtilConfiguration getBeetlGroupUtilConfiguration() {        BeetlGroupUtilConfiguration beetlGroupUtilConfiguration = new BeetlGroupUtilConfiguration();        ClasspathResourceLoader classpathResourceLoader = new ClasspathResourceLoader();        ResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();        Resource beetlResource = resolver.getResource("classpath:/beetl.properties");        beetlGroupUtilConfiguration.setConfigFileResource(beetlResource);        beetlGroupUtilConfiguration.setResourceLoader(classpathResourceLoader);        beetlGroupUtilConfiguration.init();        return beetlGroupUtilConfiguration;    }    @Bean(name = "beetlViewResolver")    public BeetlSpringViewResolver getBeetlSpringViewResolver(@Qualifier("beetlConfig") BeetlGroupUtilConfiguration beetlGroupUtilConfiguration) {        BeetlSpringViewResolver beetlSpringViewResolver = new BeetlSpringViewResolver();        beetlSpringViewResolver.setSuffix(".html");        beetlSpringViewResolver.setContentType("text/html;charset=UTF-8");        beetlSpringViewResolver.setOrder(0);        beetlSpringViewResolver.setConfig(beetlGroupUtilConfiguration);        return beetlSpringViewResolver;    }    @Bean    public GroupTemplate getGroupTemplate(BeetlGroupUtilConfiguration beetlGroupUtilConfiguration) {        GroupTemplate gt = beetlGroupUtilConfiguration.getGroupTemplate();        gt.registerFunctionPackage("tool", new TemplateUtil());        Map<String,Object> shared = new HashMap<>();        //配置shiro全局变量        shared.put("hello","beetl");        shared.put("sysName",systemProperties.getName());        shared.put("version",systemProperties.getVersion());        shared.put("logo",systemProperties.getLogo());        gt.setSharedVars(shared);        return gt;    }}