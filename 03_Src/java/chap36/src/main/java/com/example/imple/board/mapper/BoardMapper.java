package com.example.imple.board.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.type.JdbcType;

import com.example.imple.board.model.Board;

@Mapper
public interface BoardMapper {

    @Select("select * from board order by id desc")
    List<Board> selectAll();
    
    @Select("""
    		SELECT p.*, COUNT(c.id) AS comment
			FROM board b
			LEFT JOIN board c ON b.id = c.id
			GROUP BY b.id, b.title, b.content, b.day, b.writer
			ORDER BY b.id DESC
    		""")
    List<Board> selectAllWithCommentCount();
    
    @Select("select count(*) from board")
    int countAll();

    @Result(property = "writer", column = "writer", jdbcType = JdbcType.VARCHAR)
    @Select("select * from board where writer=#{writer}")
    Board selectBoardByWriter(String writer);
    
    @Result(property = "writer", column = "writer", jdbcType = JdbcType.VARCHAR)
    @Select("select * from board where title LIKE '%${title}'")
    Board selectBoardByTitle(String title);
    
    @Result(property = "writer", column = "writer", jdbcType = JdbcType.VARCHAR)
    @Select("select * from board where id = #{id}")
    Board selectBoardById(int id);
    
    @Result(property = "writer", column = "writer", jdbcType = JdbcType.VARCHAR)
    @Select("select id from board where writer = #{writer} and day = #{day}")
    Board selectIdByWriterAndDay(@Param("writer") String writer, @Param("day") Date day);
    
    @Result(property = "writer", column = "writer", jdbcType = JdbcType.VARCHAR)
    @Select("""
    		SELECT id
			FROM (
			  SELECT id
			  FROM board
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
    
    @Result(property = "writer", column = "writer", jdbcType = JdbcType.VARCHAR)
    @Select("""
    		select count(*) from board
    		where title like '%' || #{keyword} || '%' or writer like '%' || #{keyword} || '%' 
    		""")
    int selectCountByKeyword(@Param("keyword") String keyword);
    

  

	/*
	 * @Insert(""" insert into board (id, title, content, day, writer) values (
	 * #{b.id}, #{b.title, jdbcType=VARCHAR}, #{b.content, jdbcType=VARCHAR},
	 * #{b.day, jdbcType=VARCHAR}, #{b.writer, jdbcType=VARCHAR}) """)
	 */
    int insertBoard(@Param("b") Board board);
    
    @Result(property = "writer", column = "writer", jdbcType = JdbcType.VARCHAR)
    @Delete("delete board where id = #{id}")
    int deleteBoard(int id);
    
    @Result(property = "writer", column = "writer", jdbcType = JdbcType.VARCHAR)
    @Update("""
    		update board
    		set title = #{b.title, jdbcType = VARCHAR},
    			content = #{b.content, jdbcType = VARCHAR},
    			writer = #{b.writer, jdbcType=VARCHAR}
    		where id = #{id}
    		""")
    int updateBoardById(@Param("b") Board board, @Param("id") int id);

    @Result(property = "writer", column = "writer", jdbcType = JdbcType.VARCHAR)
    @Insert("""
    	        insert into board (id, title, content, day, writer)
    			values (board_seq.nextval, #{b.title, jdbcType=VARCHAR},
            #{b.content, jdbcType=VARCHAR}, #{b.day, jdbcType=VARCHAR},
            #{b.writer, jdbcType=VARCHAR})
    	    """)
    	int insertBoardByAutoId(@Param("b") Board board);

	
    @Select("""
    		select max(id) from board
    		""")
    int getMaxBoardId();


}