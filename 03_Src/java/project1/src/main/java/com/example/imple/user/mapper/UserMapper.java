package com.example.imple.user.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.imple.user.model.User;

@Mapper
public interface UserMapper {
	
	@Select ("""
			select count(*) 
			  from users
			""")
	int countAll();
	
	@Select ("""
			select * 
			  from users
			 order by id
			""")
	List<User> selectAll();
			
	@Select("""
			select * 
			  from users
			 where id = #{id}
			""")
	User selectById(String id);

	@Select("""
			select * 
			  from users
			 where role = #{role}
			""")
	User selectByRole(String role);
	
	@Select("""
			select *
			  from users
			 where password = #{password}
			""")
	User selectByPassword(String password);
	
	@Select("""
			select * 
			  from users
			 where name = #{name}
			""")
	User selectByName(String name);
	
	@Select("""
			select * 
			  from users 
			 where mobile= #{mobile}
			""")
	User selectByMobile(String mobile);
	
	@Insert("""
			insert into 
			 users values ( #{id}, 
			 				#{password}, 
			 				#{name}, 
			 				#{mobile}, 
			 				#{role}) 
			""")
	public void insertUser(User user);

	
	
}
