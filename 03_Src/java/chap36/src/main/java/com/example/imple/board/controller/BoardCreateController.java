package com.example.imple.board.controller;

import java.util.Date;
import java.util.Objects;

import org.apache.ibatis.annotations.Options;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.imple.board.mapper.BoardMapper;
import com.example.imple.board.model.Board;
import com.example.imple.board.model.BoardDTO;
import com.example.standard.controller.CreateController;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/board")
public class BoardCreateController implements CreateController<BoardDTO> {

    @Autowired
    BoardMapper mapper;

    @Override
    public void create(Model model, HttpServletRequest request) {
        var error = request.getParameter("error");
        if (Objects.isNull(error)) {
            var session = request.getSession();
            session.removeAttribute("board");
            session.removeAttribute("binding");
        }
    }

    @Override
    @Options(useGeneratedKeys = true, keyProperty = "id")
    @Transactional
    public String create(@Valid BoardDTO dto, BindingResult binding, Model model, HttpServletRequest request,
            RedirectAttributes attr) {
        var session = request.getSession();
        session.setAttribute("board", dto);
        session.setAttribute("binding", binding);
        int maxId = mapper.getMaxBoardId();
        

        var writer = (String) session.getAttribute("writer");
        long id = maxId;
        var day = new Date();

        if (binding.hasErrors()) {
            return "redirect:/board/create?error";
        }

        var board = dto.getModel( writer, new java.sql.Date(day.getTime()));

        try {
            mapper.insertBoard(board);
        } catch (DuplicateKeyException e) {
            binding.reject("duplicate key", "글 번호가 중복됩니다.");
            return "redirect:/board/create?error";
        }

       
		return "redirect:/board/detail/" + id + "?page=1";
    }

}
