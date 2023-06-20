package com.example.imple.board.model;

import java.sql.Date;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.Range;

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
    
    private Board board;

    public Board getBoard() {
        return board;
    }

    public void setBoard(Board board) {
        this.board = board;
    }
	
	@NotNull
	long id;
	
	@NotNull
	@NotBlank
	@Length(min=1, max=100)
	String title;
	
	@Length(min=0, max = 4000)
	String content;
	
	Date day;
	
	@Length(max=20)
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