package com.example;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import jakarta.servlet.DispatcherType;

//@Configuration
public class SecurityConfig5 {

	@Autowired
	UserDetailsService userDetailsService;
	
	@Bean
	PasswordEncoder encoder() {
		return new BCryptPasswordEncoder();
	}
	
	
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception  {
		http.csrf(csrf -> {
			csrf.disable();
		});
		
		http.cors(cors -> {
			cors.disable();
		});
		
		http.authorizeHttpRequests(request -> {
			request.dispatcherTypeMatchers(DispatcherType.FORWARD).permitAll();
			request.requestMatchers("/").permitAll();
			
			request.anyRequest().authenticated();
//			request.anyRequest().permitAll();
		});
		
		http.formLogin(login -> {
			login.loginPage("/user/login");
			
			login.permitAll();
		});
		
		http.logout(logout -> {
			logout.logoutUrl("/user/logout");
		});
		
		// remember 
		http.rememberMe(remember-> {
			remember.alwaysRemember(true);
			remember.tokenValiditySeconds(60*60*24);
			remember.userDetailsService(userDetailsService);
		});
		
		return http.build();
	}
	
}
