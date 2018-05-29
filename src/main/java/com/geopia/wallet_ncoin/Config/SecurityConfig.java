package com.geopia.wallet_ncoin.Config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;

import com.geopia.wallet_ncoin.service.UserDetailServiceImpl;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	
	@Autowired
	DataSource dataSource;
	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;
	
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        super.configure(http);
        
        
        
        http.authorizeRequests()
                .anyRequest()
                .permitAll()
                .and()
       .formLogin()
       			.loginPage("/login").defaultSuccessUrl("/").
       	usernameParameter("username").passwordParameter("password")
       			.permitAll().and()
                
                .csrf().disable();
    }
    
    
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
      auth.userDetailsService(new UserDetailServiceImpl())
      
      ;
    }
   
    @Autowired
    public void configAuthentication(AuthenticationManagerBuilder auth) throws Exception {
     System.out.println("test");
	auth.jdbcAuthentication().dataSource(dataSource)
     .usersByUsernameQuery(
      "select id,password, enabled from ncoin_customer where id=?")
     .authoritiesByUsernameQuery(
      "select customer_id, role_name from ncoin_customer_role where customer_id=?")
     .passwordEncoder(bCryptPasswordEncoder);
    	
    } 


}
