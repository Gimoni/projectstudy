package com.example.imple.user.controller;

import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.imple.user.mapper.UserMapper;
import com.example.imple.user.model.UserDTO;
import com.example.standard.controller.CreateController;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/user")
@Slf4j	
public class UserCreateController implements CreateController<UserDTO> {
	
//	@Autowired
//	UserCreateService userCreateService;
	
	@Autowired
	UserMapper mapper;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	
	@Override
	public void create(Model model, HttpServletRequest request) {
		var error = request.getParameter("error");
		if (Objects.isNull(error)) {
			var session = request.getSession();
			session.getAttribute("user");
			session.getAttribute("binding");
		}
		
	}

	@Override
	@Transactional
	public String create(@Valid UserDTO dto, BindingResult binding, Model model, HttpServletRequest request,
			RedirectAttributes attr) {
		log.info("login create()...");
		System.out.println(dto);
		
		var session = request.getSession();
		session.setAttribute("user", dto);
		session.setAttribute("binding", binding);
		
		if (binding.hasErrors()) {
			return "redirect:/user/create?error";
		}
		
		var user = dto.getModel();

	    // 비밀번호 인코딩
	    String encodedPassword = passwordEncoder.encode(user.getPassword());
	    user.setPassword(encodedPassword);

		
		mapper.insertUser(user);
		
		return "redirect:/user/success?create";
	}

}
