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

@Configuration
public class SecurityConfig {

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
		
		// 접근제한 설정
		http.authorizeHttpRequests(request -> {
			request.dispatcherTypeMatchers(DispatcherType.FORWARD).permitAll();
			request.requestMatchers("/", "/error").permitAll();
			request.requestMatchers("/webjars/**").permitAll();
			request.requestMatchers("/img/**").permitAll();
			request.requestMatchers("/css/**").permitAll();
//			
			request.requestMatchers("/dept/list", 	  "/dept/detail/{key}").permitAll();
			request.requestMatchers("/emp/list", 	  "/emp/detail/{key}").permitAll();
			request.requestMatchers("/salgrade/list", "/salgrade/detail/{key}").permitAll();
			request.requestMatchers("/city/list", "/city/detail/{key}").permitAll();
			request.requestMatchers("/country/list", "/country/detail/{key}").permitAll();
			request.requestMatchers("/language/list", "/language/detail/{key}").permitAll();
			request.requestMatchers("/country/page/1/10", "/country/page/{key1}/{key2}").permitAll();
			request.requestMatchers("/language/page/1/10", "/language/page/{key1}/{key2}").permitAll();
			request.requestMatchers("/user/create").permitAll();
			request.requestMatchers("/board/create").permitAll();
			request.requestMatchers("/board/list", "/board/detail/{key}").permitAll();
			request.requestMatchers("/board/update").permitAll();
			request.requestMatchers("/board/delete").permitAll();
//			
			request.requestMatchers("/dept/create", 
									"/dept/update",
									"/dept/delete").hasAnyRole("ADMIN");
			
			
			request.anyRequest().authenticated();
//			request.anyRequest().permitAll();
		});
		
		http.formLogin(login -> {
			login.loginPage("/user/login");
			login.defaultSuccessUrl("/", true);
			login.failureHandler((request, response, e) -> {
				request.setAttribute("exception", e);
				request.getRequestDispatcher("/user/login-fail").forward(request, response);
			});
			
			login.permitAll();
		});
		
		http.logout(logout -> {
			logout.logoutUrl("/user/logout");
			logout.permitAll();
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
