package com.example.imple.user.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

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

//	int insertUser(@Param("id") String id,
//				   @Param("password") String password,
//				   @Param("name") String name,
//				   @Param("mobile") String mobile,
//				   @Param("role") String role);

	
//	public void insertUser (User user);
	
//	@Update("""
//			update users
//			   set password	 = #{password, jdbcType=VARCHAR2},
//			       name		 = #{name, jdbcType=VARCHAR2},
//			       mobile	 = #{mobile, jdbcType=VARCHAR2},
//			       role      = #{role, jdbcType=VARCHAR2},
//			 where id        = #{id, jdbcType=VARCHAR2}
//			""")
//	public void updateUser(User user);

	
	
}
