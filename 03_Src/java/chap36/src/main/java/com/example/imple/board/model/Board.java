package com.example.imple.board.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor(staticName = "of")
@NoArgsConstructor
public class Board {
	long id;
	String title;
	String content;
	Date day;
	Integer reply;
	String writer;
}
