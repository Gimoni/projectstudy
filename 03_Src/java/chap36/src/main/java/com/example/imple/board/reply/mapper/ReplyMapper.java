package com.example.imple.board.reply.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.imple.board.model.Board;
import com.example.imple.board.reply.model.Reply;

@Mapper
public interface ReplyMapper {
    
	@Select("""
			select * 
			from boardreply 
			where id = #{id} order by day asc
			""")
    List<Reply> selectAll(@Param("id") long id);
    
    @Select("""
    		select count(*) 
    		from boardreply 
    		where id = #{id}
    		""")
    int countById(@Param("id") long id);
    
    @Insert("""
    		insert into
    		boardreply values ( #{id},
    							#{content},
    							#{day},
    							#{writer},
    							#{replyId})
    		""")
    int insertReply(Reply reply);

    @Delete ( """
    		delete from boardreply 
    		where id = #{replyId}
    		""")
    int deletePost(@Param("replyId") long replyId);
    
    @Update("""
    		update boardreply
    		set content = #{p.content, jdbcType=VARCHAR}
    		where replyId = #{replyId}
    		""")
    long updatePostById(@Param("p") Board post, @Param("replyId") long replyId);

    @Delete("""
    		delete from boardreply 
    		where id = #{replyId}
    		"""
    		)
	int deleteReplyId(@Param("replyId") int replyId);
}
