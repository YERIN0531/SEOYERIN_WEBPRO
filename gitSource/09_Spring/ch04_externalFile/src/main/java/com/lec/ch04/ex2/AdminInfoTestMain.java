package com.lec.ch04.ex2;

import org.springframework.context.support.GenericXmlApplicationContext;

public class AdminInfoTestMain {
	public static void main(String[] args) {
		String location = "classpath:META-INF/ex2/applicationCTX.xml";
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext(location);
		
		Admininfo info = ctx.getBean("adminInfo", Admininfo.class);
		System.out.println(info);
	}
}
