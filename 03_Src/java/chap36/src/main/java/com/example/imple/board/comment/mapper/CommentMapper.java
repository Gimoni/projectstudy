package com.example.imple.board.comment.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.imple.board.model.Board;
import com.example.imple.board.comment.model.Comment;

@Mapper
public interface CommentMapper {
	
	@Select("""
			select * from comments
			""")
	List<Comment> selectAll(@Param("id") long id);
	
	@Select("""
			select count(*) from comments
			where id = #{id}
			""")
	int countByid(@Param("id") long id);
	
	@Select("""
		   select * from comments where id = #{id}
			""")
	Comment selectByid(@Param("id") long id); 
	
	@Insert ("""
			insert into comments (id, content, day, writer, comment)
			values (#{id}, #{content}, #{day}, #{writer}, #{comment})
			""")
	void insertComment(Comment comment);
	
	@Update("""
			update comments 
			set content  = #{content}, 
					   day = #{day}, 
					writer = #{writer},
		     commentId  = #{commentId}
		     where id = #{id}
			""")
	void updateComment(Comment comment);
	
	@Delete ("""
			delete from comments where id = #{commentId}
			""")
    int deleteCommentbyId(@Param("id") long commentId);

	@Delete ("""
			delete from comments where id = #{id}
			""")
	int deleteCommentbyBoardId(@Param("id") long id);
	
	@Update("""
			update board
			     set content = #{b.content, jdbcType=VARCHAR}
			          where commentId = #{commentId}
			""")
	long updateBoardById(@Param("d") Board board, @Param("commentId") long commentId);
	
}
