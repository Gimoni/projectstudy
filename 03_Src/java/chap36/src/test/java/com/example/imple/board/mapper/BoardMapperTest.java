package com.example.imple.board.mapper;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.example.imple.board.model.Board;
import com.fasterxml.jackson.databind.ObjectMapper;

@SpringBootTest
public class BoardMapperTest {

	@Autowired
	BoardMapper mapper;

	@Autowired
	ObjectMapper objectMapper;

	@Test
	void selectAll() {
		
	}
	
	@Test
	void insertBoard() {
	
	}
	
	@Test
	@Transactional
	void updateBoardById() {
		
	}
    @Test
    void InsertBoard() {
        
    }

    @Test
    void UpdateBoard() {
      
    }

    @Test
    void DeleteBoard() {
       
    }
	

}
