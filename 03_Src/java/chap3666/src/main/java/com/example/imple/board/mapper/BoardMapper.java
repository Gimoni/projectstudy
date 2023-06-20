package com.example.imple.board.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.imple.board.model.Board;

@Mapper
public interface BoardMapper {

    @Select("select * from board order by id desc")
    List<Board> selectAll();
    
    @Select("""
    		SELECT p.*, COUNT(r.reply) AS reply
			FROM board p
			LEFT JOIN board r ON p.id = r.id
			GROUP BY p.id, p.title, p.content, p.day, p.reply, p.writer
			ORDER BY p.id DESC
    		""")
    List<Board> selectAllWithReplyCount();
    
    @Select("select count(*) from board")
    int countAll();

    @Select("select * from board where writer=#{writer}")
    Board selectPostByWriter(String writer);
    
    @Select("select * from board where title LIKE '%#{title}'")
    Board selectPostByTitle(String title);
    
    @Select("select * from board where id = #{id}")
    Board selectPostById(int id);
    
    @Select("select id from board where writer = #{writer} and day = #{day}")
    Integer selectIdByWriterAndDay(@Param("writer") String writer, @Param("day") Date day);
    
    @Select("""
    		SELECT id
			FROM (
			  SELECT id
			  FROM board_post
			  WHERE writer = #{writer}
			  ORDER BY id DESC
			) WHERE ROWNUM = 1
    		""")
    Integer selectIdByWriter(@Param("writer") String writer);
    
    @Select("""
    		select * from board
    		where title like '%' || #{keyword} || '%' or writer like '%' || #{keyword} || '%' 
    		""")
    List<Board> selectByKeyword(@Param("keyword") String keyword);
    
    @Select("""
    		select count(*) from board
    		where title like '%' || #{keyword} || '%' or writer like '%' || #{keyword} || '%' 
    		""")
    int selectCountByKeyword(@Param("keyword") String keyword);
    

  

    @Insert("""
    		insert into board (id, title, content, day, reply, writer)
    		values ( #{p.id}, #{p.title}, 
    								   #{p.content}, #{p.day}, 
    			   					   #{p.reply}, #{p.writer})
    		""")
    int insertPost(@Param("p") Board post);
    
    @Delete("delete board where id = #{id}")
    int deletePost(int id);
    
    @Update("""
    		update board
    		set title = #{p.title, jdbcType = VARCHAR},
    			content = #{p.content, jdbcType = VARCHAR}
    		where id = #{id}
    		""")
    int updatePostById(@Param("p") Board post, @Param("id") int id);
}