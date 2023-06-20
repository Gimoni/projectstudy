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
		var select = mapper.selectAll();
		System.out.println("selectAll = " + select);
		List<Board> boards = mapper.selectAll();
		System.out.println(boards);
		
//		assertThat(boards).isNotNull();
//		assertThat(boards).isNotSameAs(null);
	}
	
	@Test
	void countAll() {
		var cnt = mapper.countAll();
		System.out.println("countAll from board = " + cnt);
	}

	
	@Test
	void insertPost() {
	    var post = Board.builder()
	                    .id(5)
	                    .title("하이")
	                    .content("하이")
	                    .reply(4)
	                    .writer("hihi")
	                    .build();
	    var count = mapper.insertPost(post);
	    System.out.println(count);
	}
	
	@Test
	@Transactional
	void updatPostById() {
		var post = Board.builder()
								.title("반갑습니다")
								.content("안녕")
								.writer("somebody")
								.build();
		var update = mapper.updatePostById(post, 4);
		System.out.println(update);
		
	}
	
	@Test
	void selectAllWithReplyCount() {
		var count = mapper.selectAllWithReplyCount();
		System.out.println("replycount= "+ count);
	}

}
