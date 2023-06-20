package com.example.imple.user.controller;

import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.imple.user.mapper.UserMapper;
import com.example.imple.user.model.UserDTO;
import com.example.standard.controller.DeleteController;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import lombok.Data;

@Data
@Controller
@RequestMapping("/user")
public class UserDelectController implements DeleteController<UserDTO>{
	
	@Autowired
	UserMapper mapper;
	
	@Override
	public void delete(Model model, HttpServletRequest request) {
		
		var error = request.getParameter("error");
		if (Objects.isNull(error)) {
			var session = request.getSession();
			session.removeAttribute("dept");
			session.removeAttribute("binding");
		}
		
		var id = request.getParameter("id");
		if(Objects.nonNull(id)) {
			var key = Integer.parseInt(id);
			var dept = mapper.selectById(id);
			model.addAttribute("user", id);
		}
	}

	@Override
	public String delete(@Valid UserDTO dto, BindingResult binding, Model model, HttpServletRequest request,
			RedirectAttributes attr) {
		
		var session = request.getSession();
		session.setAttribute("user", dto);
		session.setAttribute("binding", binding);
		
		if(binding.hasErrors())
			return "redirect:/user/delete?error";
		
		//db 연동
		var user = dto.getModel();
		
		
		return "redirect:/user/success?delete";
	}

	
	
}
