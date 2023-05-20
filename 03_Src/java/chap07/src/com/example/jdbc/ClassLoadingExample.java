package com.example.jdbc;

public class ClassLoadingExample {

	public static void main(String[] args) throws ClassNotFoundException {
		Class.forName("com.example.jdbc.MyDriver");
	}

}
