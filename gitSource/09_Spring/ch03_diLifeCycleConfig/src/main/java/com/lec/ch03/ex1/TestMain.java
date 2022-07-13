package com.lec.ch03.ex1;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class TestMain {
	public static void main(String[] args) {
		String resourceLocation1 = "classpath:META-INF/ex1/applicationCTX1.xml";
		String resourceLocation2 = "classpath:META-INF/ex1/applicationCTX2.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(resourceLocation1,
											 resourceLocation2);
		Student student = ctx.getBean("student", Student.class);
		System.out.println("student : " + student);
		Studentinfo studentinfo = ctx.getBean("studentInfo", Studentinfo.class);
		System.out.println("studentInfo의 student : " + studentinfo.getStudent());
		if(student.equals(studentinfo.getStudent())) {
			System.out.println("두 객체는 같은 객체");
		}
		
		Family family = ctx.getBean("family", Family.class);
		System.out.println("family : " + family);
		
		ctx.close();
	}
}
