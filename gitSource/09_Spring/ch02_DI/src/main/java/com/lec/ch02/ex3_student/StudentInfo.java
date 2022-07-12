package com.lec.ch02.ex3_student;
import lombok.AllArgsConstructor;
import lombok.Data;
@AllArgsConstructor
@Data
public class StudentInfo {
	private Student student;
	public void getInfo() {
		if(student!=null) { //주입을 받았을때만
			System.out.println("이름 : " + student.getName());
			System.out.println("나이 : " + student.getAge());
			System.out.println("학년 : " + student.getGradeNum());
			System.out.println("반 : " + student.getClassNum());
			System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		}else {
			System.out.println("의존하는 Student형 객체가 없습니다");
		}
	}
}
