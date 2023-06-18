package com.example.imple.user.model;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.Range;

import com.example.standard.model.Modelable;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@Data
@AllArgsConstructor(staticName = "of")
@NoArgsConstructor
@Builder
public class UserDTO implements Modelable<User>{
	@NonNull 
	@Length(max=20)
	String id;
	
	@NonNull 
	@Range(min=1, max=99999999999999999L)
	String password;
	
	@NonNull 
	@Length(min=1, max=20)
	String name;
	
	@NonNull 
	@Length(max=15)
	@Range(min=1, max=999999999999999L)
	String mobile;
	
	
	@Override
	public User getModel() {
		return User.builder()
				      .id(id)
				      .password(password)
				      .name(name)
				      .mobile(mobile)
				      .role("USER")
				      .build();
	}
}
