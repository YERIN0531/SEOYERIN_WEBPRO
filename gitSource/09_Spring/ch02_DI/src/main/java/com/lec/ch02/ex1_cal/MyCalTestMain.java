package com.lec.ch02.ex1_cal;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class MyCalTestMain {
	public static void main(String[] args) {
		// --1)
		String resourceLocation = "classpath:applicationCTX1.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(resourceLocation);
		// --2)
		MyCalculator myCalculator = ctx.getBean("myCal", MyCalculator.class);
		// --3)
		myCalculator.add();
		myCalculator.sub();
		myCalculator.mul();
		myCalculator.div();
		// --4)
		ctx.close();
	}
}
