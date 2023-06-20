package com.example.imple.user.mapper;

import static org.assertj.core.api.Assertions.*;

import java.io.IOException;

import org.junit.jupiter.api.Test;
import org.mybatis.spring.MyBatisSystemException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.example.imple.user.model.User;
import com.example.imple.user.model.UserDTO;
import com.fasterxml.jackson.databind.ObjectMapper;

@SpringBootTest
public class UserMapperTest {

	@Autowired
	UserMapper usermapper;
	
	@Autowired
	ObjectMapper objectmapper;
	
	@Test
	void countAll() {
		var all = usermapper.countAll();
		System.out.println(all);
	}
	
	@Test
	void selectAll() throws IOException {
		var list = usermapper.selectAll();
		System.out.println(list);
		
		objectmapper.createGenerator(System.out)
					.useDefaultPrettyPrinter()
					.writeObject(list);
	}
	
	@Test
	void selectById() {
		var user = usermapper.selectById("python");
		System.out.println(user);
		assertThat(user).isNotNull();
		assertThat(user.getId()).isEqualTo("python");
		
		user = usermapper.selectById("xxx");
		System.out.println(user);
		assertThat(user).isNull();
	}
	
	@Test
	void selectByRole() {
		var role = usermapper.selectByRole("ADMIN");
		System.out.println(role);
		assertThat(role).isNotNull();
		
		role = usermapper.selectByRole("USER");
		System.out.println(role);
	}
	
	@Test
	void selectByPassword() {
		var password = usermapper.selectByPassword("$2a$10$ayg93l/BuyOQ0b/1huGiJuBXm71M9fELCMt4OZ0da1bEX2mweIbcm");
		System.out.println(password);
		assertThat(password).isNotNull();
	}
	
	@Test
	void selectByName() {
		var name = usermapper.selectByName("java");
		System.out.println(name);
		assertThat(name).isNotNull();
	}
	
	@Test
	void selectByMobile() {
		var mobile = usermapper.selectByMobile("+821012345679");
		System.out.println(mobile);
		assertThat(mobile).isNotNull();
	}
	
	@Test
	public void insertUser() {
		
	}
	
	@Test
	public void updateUser() {
		
	}
	
	@Test
	void deleteUserbyid() {
		var list = usermapper.selectAll();
		System.out.println(list);
		String id = usermapper.deleteUserbyId("gimon");
		var list2= usermapper.selectAll();
		System.out.println(list2);
	}
	

}
