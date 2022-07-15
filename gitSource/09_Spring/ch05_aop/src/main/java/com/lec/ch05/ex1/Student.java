package com.lec.ch05.ex1;
import lombok.Data;
@Data
public class Student {
	private String 	name;
	private int 	age;
	private int 	gradeNum;
	private int 	classNum;
	//a기능 b기능 만들 메소드 생성 
	public void getStudentInfo() { //메인함수에서 호출될 핵심기능(티켓메소드 = 비즈니스로직)
		System.out.println("이름 : " + name);
		System.out.println("나이 : " + age);
		System.out.println("학년 : " + gradeNum);
		System.out.println("반 : " + classNum);
	}
}
