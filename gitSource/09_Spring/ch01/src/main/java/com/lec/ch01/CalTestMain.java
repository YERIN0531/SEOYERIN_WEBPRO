package com.lec.ch01;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class CalTestMain {

	public static void main(String[] args) {
//		// 1. calculation 객체생성
//		Calculation cal = new Calculation();
//		// 2. num1과 num2에 값 세팅해주기
//		cal.setNum1(50);
//		cal.setNum2(10);
//		
		/*AbstractAppkication 은 추상클래스이기 때문에 객체를 못만들기 때문에 
		 GenericXmlAppkicationContext 형태로 만들어주기 
		*/
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:applicationCTX.xml");
		//파싱 : 해석하는 것 스프링 컨테이너에 파싱된 빈이 만들어져 있는 것 . 
		
		Calculation cal = ctx.getBean("calculation", Calculation.class); //컨테이너에 만들어져 있는 객체 이름을 괄호안에 써주기
		//calculation이름을 가진 빈을 가지고, 외부에서 주입하겠다는 뜻 
		// 3. 메소드 호출하기 
		cal.add();
		cal.sub();
		cal.mul();
		cal.div();
		System.out.println(cal);
		//파싱되서 객체가 만들어진 아이가 더이상 필요가 없으면 close 해주면 됨
		ctx.close();
	}
}
