package com.example.imple.language.mapper;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class LanguageMapperTest {

	@Autowired
	LanguageMapper languageMapper;
	
	@Test
	void countAll() {
		int cnt = languageMapper.countAll();
		System.out.println("cnt = " + cnt);
		assertThat(cnt).isEqualTo(984);
		
	}
	
	@Test
	void selectAll() {
		var list = languageMapper.selectAll();
		
	}
	
	
	
}