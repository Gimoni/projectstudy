package com.example.imple.language.mapper;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.fasterxml.jackson.databind.ObjectMapper;

@SpringBootTest
public class LanguageMapperTest {
	
	@Autowired
	LanguageMapper mapper;
	
	@Autowired
	ObjectMapper objectMapper;
	
	@Test 
	void countAll() {
		
	}
	 
	@Test
	void selectAll() {
		
	}
	
	@Test
	void selectPage() {
		
	}
	
	
	
	
	
	
	

}
