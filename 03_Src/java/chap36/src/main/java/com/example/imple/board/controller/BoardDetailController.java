package com.example.imple.board.controller;

import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.imple.board.comment.mapper.CommentMapper;
import com.example.imple.board.mapper.BoardMapper;
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
	CommentMapper comapper;

	@Override
	@Transactional
	public String detail(Integer key, Model model, HttpServletRequest request) {
		var board = mapper.selectBoardById(key);
		model.addAttribute("board", board);
		var comment = comapper.selectAll(board.getId());
		model.addAttribute("comment", comment);
		var session = request.getSession();
		
		var error = request.getParameter("error");
		if (Objects.isNull(error)) {
			session.removeAttribute("board");
			session.removeAttribute("comment");
		}
		String getDeleteId = request.getParameter("deleteId");
		if (getDeleteId != null && !getDeleteId.isEmpty()) {
			int deleteId = Integer.parseInt(getDeleteId);
			comapper.deleteCommentbyId(deleteId);
			int commentss =comapper.countByid(deleteId);
			System.out.println(commentss);
			if (commentss==0) {
				mapper.deleteBoard(deleteId);
			}
			return "redirect:/board/page/1/10";
		}
		String getDeleteCommentId = request.getParameter("deleteCommentId");
		String pageNum = request.getParameter("page");
		if (getDeleteCommentId != null && !getDeleteCommentId.isEmpty()) {
			int deleteCommentId = Integer.parseInt(getDeleteCommentId);
			comapper.deleteCommentbyBoardId(deleteCommentId);
			return "redirect:/board/detail/{key}?page=" + pageNum;
		}
		return "board/detail";
	}

}