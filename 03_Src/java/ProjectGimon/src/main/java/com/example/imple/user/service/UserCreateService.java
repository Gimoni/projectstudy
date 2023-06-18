package com.example.imple.user.service;

import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.imple.user.mapper.UserMapper;
import com.example.imple.user.model.User;
import com.example.imple.user.model.UserDTO;

//@Service
public class UserCreateService  {

	@Autowired
	UserMapper mapper;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	
	public void UserCreate (UserDTO userDTO) {
		String encodedpassword = passwordEncoder.encode(userDTO.getPassword());
		    userDTO.setPassword(encodedpassword);
		

		
		User users =  User.builder()
						  .id(userDTO.getId())
						  .password(encodedpassword)
						  .name(userDTO.getName())
						  .mobile(userDTO.getMobile())
						  .build();
		
		mapper.insertUser(users);
		
	}

	

}