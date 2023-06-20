package com.example.imple.board.controller;

import java.util.Date;
import java.util.Objects;

import org.apache.ibatis.annotations.Options;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.imple.board.mapper.BoardMapper;
import com.example.imple.board.reply.mapper.ReplyMapper;
import com.example.imple.board.reply.model.ReplyDTO;
import com.example.standard.controller.DetailController;

import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/board")
@Slf4j
public class BoardDetailController implements DetailController<Integer> {

	@Autowired
	BoardMapper mapper;
	
	@Autowired
	ReplyMapper replymapper;
	
	
	@Override
	@Transactional
	public String detail(Integer key, Model model, HttpServletRequest request) {
		log.debug("key : {},", key);
		var post = mapper.selectPostById(key);
		model.addAttribute("post", post);
		var reply = replymapper.selectAll(post.getId());
		model.addAttribute("reply", reply);
		var session = request.getSession();

		var error = request.getParameter("error");
		if (Objects.isNull(error)) {
			session.removeAttribute("post");
			session.removeAttribute("binding");
		}
		String getDeleteId = request.getParameter("deleteId");
		if (getDeleteId != null && !getDeleteId.isEmpty()) {
			int deleteId = Integer.parseInt(getDeleteId);
			replymapper.deletePost(deleteId);
			int replies = replymapper.countById(deleteId);
			System.out.println(replies);
			if (replies==0) {
				mapper.deletePost(deleteId);
			}
			return "redirect:/freeboard/page/1/10";
		}
		String getDeleteReplyId = request.getParameter("deleteReplyId");
		String pageNum = request.getParameter("page");
		if (getDeleteReplyId != null && !getDeleteReplyId.isEmpty()) {
			int deleteReplyId = Integer.parseInt(getDeleteReplyId);
			replymapper.deleteReplyId(deleteReplyId);
			return "redirect:/freeboard/detail/{key}?page=" + pageNum;
		}
		
		return "board/detail";
	}
	
	@GetMapping("/detail/{id}/{page}/{createReply}")
	@Options(useGeneratedKeys = true, keyProperty = "id")
	@Transactional
	public String detail(@PathVariable Integer id, @PathVariable Integer page, @PathVariable String createReply, ReplyDTO dto, BindingResult binding, Model model, HttpServletRequest request) {
		var post = mapper.selectPostById(id);
		model.addAttribute("post", post);
		var reply = replymapper.selectAll(post.getId());
		model.addAttribute("reply", reply);
		var session = request.getSession();
		
		session.setAttribute("newReply", dto);
		session.setAttribute("binding", binding);
		var writer = (String)session.getAttribute("name");
		var day = new Date();
		
		var newReply = dto.getModel(id, writer, day);
		
		String content = newReply.getContent().trim();
		session.setAttribute("content", content);
		if (binding.hasErrors()) {
			return "redirect:/board/detail/{id}?page={page}&?error";
		} else if (content.isEmpty()) {
			return "redirect:/board/detail/{id}?page={page}&?error";
		}
		
		replymapper.insertReply(newReply);
		
		return "redirect:/board/detail/"+id+"?page="+page;
	
	}

}