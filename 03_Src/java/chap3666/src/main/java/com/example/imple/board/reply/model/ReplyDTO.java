package com.example.imple.board.reply.model;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor(staticName = "of")
@NoArgsConstructor
@Builder
public class ReplyDTO {
	
@NotNull
long id;

@NotBlank
@Length(min = 1, max = 2000)
String content;

Date day;

@NotBlank
@Length(min=1, max=20)
String writer;

@NotNull
long replyId;

public Reply getModel(Integer id, String writer, Date day) {
	
	return Reply.builder()
			  .id(id)
			  .content(content)
			  .day(day)
			  .writer(writer)
			  .replyId(replyId)
			  .build();
}
}