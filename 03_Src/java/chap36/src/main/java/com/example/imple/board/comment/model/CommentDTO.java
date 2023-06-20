package com.example.imple.board.comment.model;

import java.time.LocalDate;
import java.util.Date;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.Range;
import org.springframework.format.annotation.DateTimeFormat;

import com.example.standard.model.Modelable;

import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor(staticName="of")
@NoArgsConstructor
@Builder
public class CommentDTO {
	@NotNull
	@Range
	long id;
	
	@NotNull
	@Length(min=1, max=200)
	String content;
	
	Date day;
	
	@NotNull
	@Length(min=1, max=20)
	String writer;
	
	@NotNull
	@Range
	long commentId;
	
	public Comment getModel(Date day) {
		return Comment.builder()
				             .id(id)
				             .content(content)
				             .day(new java.sql.Date(day.getTime()))
				             .commentId(commentId)
				             .build();
	}
}
