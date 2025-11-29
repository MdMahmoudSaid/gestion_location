package com.example.test.tp1.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.ProviderManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import com.example.test.tp1.login.UsersDetailsservice;

@Configuration
@EnableWebSecurity
public class Configwebsecurity{

    @Autowired
    private UsersDetailsservice userDetailsservice;
    @Autowired
    private BCryptPasswordEncoder passwordencoder;
   
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
          http
          .csrf((crtf)->crtf.disable())
          .authorizeHttpRequests((auth)->auth.
          requestMatchers("/**").permitAll().
          anyRequest().authenticated()).formLogin((login)->login.disable());
           return http.build();

    }

    @Bean
    public DaoAuthenticationProvider daoAuthenticationProvider(){
        DaoAuthenticationProvider authprovider= new DaoAuthenticationProvider();
        authprovider.setUserDetailsService(userDetailsservice);
        authprovider.setPasswordEncoder(passwordencoder);
        return authprovider;
    }

    @Bean
    public AuthenticationManager authenticationManager() throws Exception{
        return new ProviderManager(daoAuthenticationProvider());
    }

} 