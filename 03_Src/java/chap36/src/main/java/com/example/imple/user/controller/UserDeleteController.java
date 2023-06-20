package com.example.imple.user.controller;

import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.imple.user.mapper.UserMapper;
import com.example.imple.user.model.User;
import com.example.imple.user.model.UserDTO;
import com.example.imple.user.service.UserDelete;
import com.example.standard.controller.DeleteController;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import lombok.Data;

@Controller
@RequestMapping("/user")
public class UserDeleteController implements DeleteController<UserDTO>{
	
	@Autowired
	UserMapper mapper;
	
	@Autowired
	private PasswordEncoder passwordEncoder;

	@Override
	public void delete(Model model, HttpServletRequest request) {
		var error = request.getParameter("error");
		if (Objects.isNull(error)) {
			var session = request.getSession();
			session.removeAttribute("user");
			session.removeAttribute("binding");
		}
		
		
	}

	@Override
	public String delete(@Valid UserDTO dto, BindingResult binding, Model model, HttpServletRequest request,
			RedirectAttributes attr) {
	       if (binding.hasErrors()) {
	            return "redirect:/user/delete?error";
	        }

	        // 유저 정보 가져오기
	        User user = mapper.selectById(dto.getId());
	        if (user == null) {
	            // 해당 ID의 유저가 존재하지 않을 경우 처리
	            attr.addFlashAttribute("errorMessage", "해당 ID의 유저가 존재하지 않습니다.");
	            return "redirect:/user/delete";
	        }

	        // 비밀번호 확인
	        if (!passwordEncoder.matches(dto.getPassword(), user.getPassword())) {
	            // 비밀번호가 일치하지 않을 경우 처리
	            attr.addFlashAttribute("errorMessage", "비밀번호가 일치하지 않습니다.");
	            return "redirect:/user/delete";
	        }

	        // 유저 삭제
	        mapper.deleteUserbyId(dto.getId());

	        attr.addFlashAttribute("message", "유저가 삭제되었습니다.");
	        return "redirect:/user/success";
	    }
	}
	
	

