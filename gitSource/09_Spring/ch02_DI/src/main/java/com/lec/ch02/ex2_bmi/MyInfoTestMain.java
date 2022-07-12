package com.lec.ch02.ex2_bmi;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class MyInfoTestMain {
	public static void main(String[] args) {
		String resourceLocation = "classpath:applicationCTX2.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(resourceLocation);
		MyInfro myInfo = ctx.getBean("myinfo", MyInfro.class);
		//Myinfo myInfo = (MyInfo)ctx.getBean("myInfo")로 써도 됨
		myInfo.getInfo();
		ctx.close();
		
	}
}
