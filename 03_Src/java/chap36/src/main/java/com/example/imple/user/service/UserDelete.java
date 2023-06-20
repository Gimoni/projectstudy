package com.example.imple.user.service;

import com.example.standard.model.Modelable;

import jakarta.validation.constraints.NotBlank;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@Data
@NoArgsConstructor
public class UserDelete {

	@NotBlank(message = "Insert UserID")
	private String id;
	
	@NotBlank(message = "Insert Password")
	private String password;
	
	@NotBlank(message = "Insert Name")
	private String name;
	
	@NotBlank(message = "Insert Mobile")
	private String mobile;

	
}
