package com.example.imple.board.model;

import java.sql.Date;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.Range;
import org.springframework.beans.factory.annotation.Autowired;

import com.example.imple.board.mapper.BoardMapper;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor(staticName = "of")
@NoArgsConstructor
public class BoardDTO  {
    
	@Autowired
	BoardMapper mapper;
	
    private Board board;

    public Board getBoard() {
        return board;
    }

    public void setBoard(Board board) {
        this.board = board;
    }
	
	@NotNull
	@Range(min=1, max=9999999999L)
	Long id;
	
	@NotNull
	@NotBlank
	@Length(min=1, max=100)
	String title;
	
	@Length(min=0, max = 4000)
	String content;
	
	Date day;
	
	@Length(min=0, max=20)
	String writer;


	public Board getModel(String writer, Date day) {

		return Board.builder()
						.id(id)
						.title(title)
						.content(content)
						.day(new java.sql.Date(day.getTime()))
						.writer(writer)
						.build();
	}

	
	
}