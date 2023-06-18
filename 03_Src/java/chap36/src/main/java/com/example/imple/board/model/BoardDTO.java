package com.example.imple.board.model;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.sql.Date;
import java.time.LocalDateTime;

import org.hibernate.validator.constraints.Length;
import org.springframework.boot.autoconfigure.batch.BatchDataSource;
import org.springframework.format.annotation.DateTimeFormat;

import com.example.standard.model.Modelable;

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
public class BoardDTO {
	@NotNull
	long id;
	
	@NotBlank
	@Length(min=1, max=100)
	String title;
	
	@Length(min=0, max = 4000)
	String content;
	
	@DateTimeFormat()
	@BatchDataSource
	Date day;
	
	@Length(max=20)
	Integer reply;
	
	String writer;


	public Board getModel(String writer, Date day) {
		return Board.builder()
						.id(id)
						.title(title)
						.content(content)
						.day(day)
						.reply(reply)
						.writer(writer)
						.build();
	}
	
}