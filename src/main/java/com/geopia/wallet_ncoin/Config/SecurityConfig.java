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
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;

import com.geopia.wallet_ncoin.service.UserDetailServiceImpl;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import java.util.Set;

@EnableWebSecurity
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
    AuthProvider authProvider;

	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;

	@Autowired
    CustomAuthSuccessHandler customAuthSuccessHandler;

    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/resources/**");
        //web.ignoring().antMatchers("/res/**");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {

        http.authorizeRequests()
                .antMatchers("/api/**").permitAll()
                .antMatchers("/login").permitAll()
                .antMatchers("/signin").permitAll()
/*                .antMatchers("/login_otp").access("hasRole('ROLE_TEMPORARY')")*/
                .antMatchers("/**").access(
                        "hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')");


        http.csrf().disable();

        http.formLogin().successHandler(customAuthSuccessHandler)
                .loginPage("/login")
                .loginProcessingUrl("/login")
                .defaultSuccessUrl("/")
                .failureUrl("/error")
                .usernameParameter("username").passwordParameter("password").permitAll();

        http.logout()
                .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
                .logoutSuccessUrl("/")
                .invalidateHttpSession(true);

        http.exceptionHandling().accessDeniedPage("/login");

/*
                http.formLogin()
       			.loginPage("/login")
                .defaultSuccessUrl("/")
                .failureUrl("/error").
       	usernameParameter("username").passwordParameter("password")
       			.permitAll().and()
                .logout()
                .logoutSuccessUrl("/")
                .permitAll()
                .and()
                .csrf().disable()
        .exceptionHandling().accessDeniedPage("/login");
*/

        http.authenticationProvider(authProvider);
    }


    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {

    }
}
