package com.example.imple.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.imple.board.mapper.BoardMapper;
import com.example.imple.board.reply.mapper.BoardReplyMapper;
import com.example.standard.controller.DetailController;

import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/board")
@Slf4j
public class BoardDetailController implements DetailController<Integer> {

	@Autowired
	BoardMapper mapper;
	
//	@Autowired
//	BoardReplyMapper replyMapper;
	
	@Override
	public String detail(Integer key, Model model, HttpServletRequest request) {
		log.debug("key : {},", key);
		var post = mapper.selectPostById(key);
		model.addAttribute("post", post);
//		var reply = replyMapper.selectAll(post.getId());
//		model.addAttribute("reply", reply);
		
		return "board/detail";
	}

}