package com.geopia.wallet_ncoin.Config;
import java.util.ArrayList;
import java.util.List;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.MediaType;
import org.springframework.web.accept.ContentNegotiationManager;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.ContentNegotiationConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.ContentNegotiatingViewResolver;

import com.geopia.wallet_ncoin.Config.viewresolver.JsonViewResolver;

@Configuration
@EnableWebMvc
@EnableAutoConfiguration
@ComponentScan
public class MvcConfig extends WebMvcConfigurerAdapter {
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry
		.addResourceHandler("/resources/**")
		.addResourceLocations("/resources/");
	}
	
    @Bean 
    public ViewResolver viewResolver(ContentNegotiationManager cnm) { 
    	List<ViewResolver> resolvers = new ArrayList<ViewResolver>();
    	JsonViewResolver r1 = new JsonViewResolver();
    	resolvers.add(r1);
    	
    	ContentNegotiatingViewResolver cnvr = new ContentNegotiatingViewResolver();
        cnvr.setViewResolvers(resolvers);
    	cnvr.setContentNegotiationManager(cnm);
        return cnvr;
    }

    @Override
    public void configureContentNegotiation(ContentNegotiationConfigurer configurer) {
    	configurer.favorPathExtension(true).
		ignoreAcceptHeader(true).
		useJaf(false).
		defaultContentType(MediaType.TEXT_HTML).
		mediaType("html", MediaType.TEXT_HTML).
		mediaType("xml", MediaType.APPLICATION_XML).
		mediaType("json", MediaType.APPLICATION_JSON);
    }

}
