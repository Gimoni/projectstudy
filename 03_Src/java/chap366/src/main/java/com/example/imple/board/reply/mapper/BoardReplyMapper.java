package com.example.imple.board.reply.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.imple.board.model.Board;
import com.example.imple.board.reply.model.BoardReply;

@Mapper
public interface BoardReplyMapper {
    
	@Select("""
			select * 
			from board_reply 
			where id = #{id} order by day asc
			""")
    List<BoardReply> selectAll(@Param("id") long id);
    
    @Select("""
    		select count(*) 
    		from freeboard_reply 
    		where id = #{id}
    		""")
    int countById(@Param("id") long id);
    
    int insertReply(@Param("r") BoardReply reply);

    @Delete ( """
    		delete from Board_reply 
    		where reply_id = #{replyId}
    		""")
    int deletePost(@Param("replyId") long replyId);
    
    @Update("""
    		update freeboard_post
    		set content = #{p.content, jdbcType=VARCHAR}
    		where reply_id = #{replyId}
    		""")
    long updatePostById(@Param("p") Board post, @Param("replyId") long replyId);
}
