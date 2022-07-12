package com.lec.ch02.ex3_student;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class StudentTestMain {
	public static void main(String[] args) {
		String configLocation = "classpath:applicationCTX3.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(configLocation);
		StudentInfo studentinfo = ctx.getBean("studentInfo", StudentInfo.class);
		studentinfo.getInfo();
		
		Student student1 = ctx.getBean("student1",Student.class);
		if(student1.equals(studentinfo.getStudent())) {
			System.out.println("두 객체는 같다");
		}
		Student student2 = ctx.getBean("student2", Student.class);
		studentinfo.setStudent(student2);
		studentinfo.getInfo();
		ctx.close();
	} //main
}
