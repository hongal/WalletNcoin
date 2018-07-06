package com.geopia.wallet_ncoin;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

@SpringBootApplication
@EnableAutoConfiguration
@ComponentScan
public class WalletNcoinApplication extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(WalletNcoinApplication.class, args);
    }
    
    @Bean
    public SqlSessionFactory sqlSessionFactory(DataSource dataSource)throws Exception{
        SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
        sessionFactory.setDataSource(dataSource);    
        Resource[] res = new PathMatchingResourcePatternResolver().getResources("classpath:mappers/*Mapper.xml");
        
        sessionFactory.setMapperLocations(res);
        return sessionFactory.getObject();
    }

    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder)
    {
        return builder.sources(WalletNcoinApplication.class);
    }


}
