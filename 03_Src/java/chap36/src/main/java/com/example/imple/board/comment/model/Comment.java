package com.example.imple.board.comment.model;

import java.time.LocalDate;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor(staticName="of")
@NoArgsConstructor
@Builder
public class Comment {
	long id;
	String content;
	Date day;
	String writer;
	long commentId;
}
