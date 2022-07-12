package com.lec.ch02.ex4_vehicle;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class VehicleTestMain {

	public static void main(String[] args) {
		String location = "classpath:applicationCTX4.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(location);
		//객체 이름은 vh 임. 빈 이름이 vh니까
		Vehicle vh = ctx.getBean("vh",Vehicle.class);
		vh.ride("홍길동");
		ctx.close();
	}
}
