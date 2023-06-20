package com.example.imple.board.controller;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.imple.board.comment.mapper.CommentMapper;
import com.example.imple.board.mapper.BoardMapper;
import com.example.imple.board.model.BoardDTO;
import com.example.standard.controller.UpdateController;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/board")
@Slf4j
public class BoardUpdateController implements UpdateController<BoardDTO> {
	
	@Autowired
	BoardMapper mapper;
	
	@Autowired
	ObjectMapper omapper;
	
	@Override
	public void update(Model model, HttpServletRequest request) {
		log.info("GET update()...");
		
		var session = request.getSession();
		var currentWriter = (String) session.getAttribute("writer");
		
		var error = request.getParameter("error");
		if (Objects.isNull(error)) {
			session.removeAttribute("board");
			session.removeAttribute("binding");
		} // board를 받아야함. 
		
		var id = request.getParameter("id");
		if (Objects.nonNull(id)) {
			var key = Integer.parseInt(id);
//			var writer = (String)session.getAttribute("name");
			var board = mapper.selectBoardById(key);
	
			model.addAttribute("board", board);
		}
		
	}
	
	

	@Override
	@Transactional
	public String update(@Valid BoardDTO dto, BindingResult binding, Model model, HttpServletRequest request,
			RedirectAttributes attr) {
		
		log.info("board update()...");
		var session = request.getSession();
		session.setAttribute("board", dto);
		session.setAttribute("binding", binding);
		
		var writer = dto.getWriter();
		var day = new Date();
		
		
		if (binding.hasErrors())
		    return "redirect:/board/update?error";
		var board = dto.getModel(writer, new java.sql.Date(day.getTime()));

		String idParam = request.getParameter("id");
		int id = idParam != null ? Integer.parseInt(idParam) : -1; // 기본값을 -1로 설정하거나 다른 값으로 지정
		int key;
		var page = request.getParameter("page");
		int pageNum;
		try {
		    if (id == -1) {
		        throw new NumberFormatException("id parameter is missing or invalid");
		    }
		    key = id;
		    pageNum = Integer.parseInt(page);
		    mapper.updateBoardById(board, key);
		} catch (NumberFormatException e) {
		    // Handle the case where id or page parameter is not a valid integer
		    // Log or handle the exception as per your requirement
		    binding.rejectValue("board", "9997", "NumberFormatException..");
		    e.printStackTrace();
		    return "redirect:/board/update?error";
		} catch (DataIntegrityViolationException e) {
		    binding.rejectValue("board", "9999", "DataIntegrityViolationException..");
		    return "redirect:/board/update?error";
		}

		mapper.updateBoardById(board, pageNum);

		return "redirect:/board/detail/" + key + "?page=" + pageNum;
	}


}
