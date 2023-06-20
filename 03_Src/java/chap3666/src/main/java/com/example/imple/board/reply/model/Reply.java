package com.example.imple.board.reply.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor(staticName = "of")
@NoArgsConstructor
public class Reply {
    long id;
    String content;
    Date day;
    String writer;
    long replyId;
}