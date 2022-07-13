package com.lec.ch04.ex1;

import java.io.IOException;

import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.core.env.ConfigurableEnvironment;
import org.springframework.core.env.MutablePropertySources;
import org.springframework.core.io.support.ResourcePropertySource;

public class AdminTestMain {
	public static void main(String[] args) {
		//1) environment 객체를 가져와서 담을 컨테이너 생성해주기 
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext();
		//2) 컨테이너의 환경변수 가져오는 아이(ConfigurableEnvironment) environment 가져오기  
		ConfigurableEnvironment env = ctx.getEnvironment();
		//3) env의 속성과 속성값 set 
		MutablePropertySources propertySources = env.getPropertySources();
		try {
		//4) environment에 속성 list 만들 것, 외부 설정 파일을 env 안의 propertySources에 추가 
			propertySources.addLast(new ResourcePropertySource("classpath:META-INF/ex1/admin.properties"));
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
		///5) 외부파일의 properties 내용들을 가지고 오기 
		System.out.println("admin.id=" + env.getProperty("admin.id"));
		System.out.println("admin.pw=" + env.getProperty("admin.pw"));
		
		//env에 외부 설정파일 속서들을 추가한 후 빈생성 
		ctx.load("classpath:META-INF/ex1/CTX.xml"); //파싱
		ctx.refresh();
		//admin 객체 만들기
		Admin admin = ctx.getBean("admin", Admin.class);
		System.out.println(admin);
		System.out.println("adminId : " + admin.getAdminId());
		System.out.println("adminPw : " + admin.getAdminPw());
		ctx.close();
	}
}
