package com.example.imple.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.imple.board.mapper.BoardMapper;
import com.example.standard.controller.ListController;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import jakarta.servlet.http.HttpServletRequest;
@Controller
@RequestMapping("/board")
public class BoardListController implements ListController{

	@Autowired
	BoardMapper mapper;
	
	@Autowired
	ObjectMapper json;
	
	
	@Override
	public void list(Model model, HttpServletRequest request) {
		var list = mapper.selectAll();
		model.addAttribute("list", list);
	}


	public String page(int pageNum, int pageSize, Model model, HttpServletRequest request) {

		String getDeleteId = request.getParameter("deleteId");
		if (getDeleteId != null && !getDeleteId.isEmpty()) {
			int deleteId = Integer.parseInt(getDeleteId);
			mapper.deletePost(deleteId);
			return "redirect:/freeboard/page/{pageNum}/10";
		}
		
		PageHelper.startPage(pageNum, pageSize);
		var list = mapper.selectAllWithReplyCount();
		var paging = PageInfo.of(list, 10);
		var postCount = mapper.countAll();
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("postCount", postCount);
		
		try {
			paging.setList(null);
			var str = json.writeValueAsString(paging);
			model.addAttribute("json", str);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		return "board/page";
	}


}
