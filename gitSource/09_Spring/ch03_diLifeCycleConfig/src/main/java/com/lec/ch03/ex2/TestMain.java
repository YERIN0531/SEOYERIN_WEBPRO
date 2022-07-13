package com.lec.ch03.ex2;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class TestMain {

	public static void main(String[] args) {
//		AbstractApplicationContext 안 쓰는 이유는 나중에 load 변수를 쓰기 위해..args 
// 		컨테이너 생성(환경설정)과 빈객체를 따로 분리 하기 위해서 GenericXml로 컨테이너 불러오기 
		//IOC 컨테이너 생성(환경설정)
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext();
		//파싱
		ctx.load("classpath:META-INF/ex2/applicationCTX.xml");
		//빈생성
		ctx.refresh();
		System.out.println("------------------------------------------");
		Person person = ctx.getBean("person", Person.class);
		System.out.println(person);
		OtherPerson otherPerson = ctx.getBean("otherPerson", OtherPerson.class);
//		OtherPerson otherPerson = (OtherPerson)ctx.getBean("otherPerson");
		System.out.println(otherPerson);
		System.out.println("-------------------------------------------");
		ctx.close();
		System.out.println("빈소멸");
		
		
	}
}
