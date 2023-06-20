package com.example.imple.reply;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.List;

import org.assertj.core.api.Assertions.*;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.example.imple.board.mapper.BoardMapper;
import com.example.imple.board.model.Board;
import com.example.imple.board.reply.mapper.ReplyMapper;
import com.example.imple.board.reply.model.Reply;
import com.fasterxml.jackson.databind.ObjectMapper;

@SpringBootTest
public class ReplyMapperTest {
	
	@Autowired
	ReplyMapper mapper;
	
	@Autowired
	BoardMapper boardmapper;
	
	@Autowired
	ObjectMapper objectMapper;
	
    @Test
    public void selectAll() {
        long Id = 1; // Board ID

        List<Reply> replies = mapper.selectAll(Id);
        
        System.out.println(replies);
        // Assertions
        assertThat(replies).isNotNull();
        assertThat(replies).isNotEmpty();
        
        // Add more assertions based on your requirements
    }

    @Test
    public void CountById() {
        long boardId = 1; // Board ID

        int count = mapper.countById(boardId);

        // Assertions
        assertThat(count).isEqualTo(1);
    }

    @Test
    public void InsertReply() {
        Reply reply = new Reply();
        // Set reply properties

        int result = mapper.insertReply(reply);

        // Assertions
        assertThat(1).isEqualTo(result);
        // Add more assertions based on your requirements
    }

    @Test
    public void testDeletePost() {
        long replyId = 1L; // Reply ID

        int result = mapper.deletePost(replyId);

        // Assertions
        assertThat(2).isEqualTo(result);
    }

    @Test
    public void UpdatePostById() {
        Reply reply = new Reply();
        // Set reply properties

        long replyId = 1L; // Reply ID

      //  long result = mapper.updatePostById(reply, result);

        // Assertions
        assertThat(1).isNotEqualTo(replyId);
        // Add more assertions based on your requirements
    }

    @Test
    public void DeleteReplyId() {
        int replyId = 1; // Reply ID

        int result = mapper.deleteReplyId(replyId);

    }

}
