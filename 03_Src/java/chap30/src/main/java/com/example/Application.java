package com.example;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.example.dept.Dept;

@SpringBootApplication
public class Application {

	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
		
		Dept dept = new Dept();
		
		dept.setDeptno(70);
		dept.setDname("영업부");
		dept.setLoc("인천");
		
		System.out.println(dept);
	}

}
