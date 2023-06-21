package com.example.imple.board.mapper;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.Date;
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
	void countAll() {
		var cnt = mapper.countAll();
		System.out.println(cnt);
	}
	
	@Test 
	void selectAll() {
		var list = mapper.selectAll();
		System.out.println(list);
	}
	
	@Test
	void insertBoard() {
		var day = new Date(); 
		int maxId = mapper.getMaxBoardId();
        int newId = maxId + 1;
		var boardadd = Board.builder()
							.id(newId)
							.title("감자월드")
							.content("감자로 시작해서 감자로 끝나는 세상")
							.day(day)
							.writer("감자돌이")
							.build();
		mapper.insertBoard(boardadd);
		System.out.println(boardadd);
	}
	
	@Test
	@Transactional
	void updateBoardById() {
		
	}
   

    @Test
    void UpdateBoard() {
      
    }

    @Test
    void DeleteBoard() {
       
    }
	

}
