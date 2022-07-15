package com.lec.ch05.ex1;

import org.aspectj.lang.ProceedingJoinPoint;

public class ProxyClass {

	// around Advice - 앞뒤로 하고 싶다
	public Object aroundAdvice(ProceedingJoinPoint joinPoint) throws Throwable {
		System.out.println("★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		String signatureName = joinPoint.getSignature().toString(); // 핵심기능 메소드명 
		System.out.println(signatureName + "가 시작되었습니다");
		long startTime = System.currentTimeMillis(); // 시작시점
		try {
			Object obj = joinPoint.proceed();//proceed는 joinPoint를 수행하라 라는 뜻, return 타입이 있을수도 있으니 object로 받는 것
			return obj;
		} finally {
			long endTime = System.currentTimeMillis(); //끝나는 시간 
			System.out.println(signatureName+"가 수행되는 경과 시간 : " + (endTime-startTime));
			
		}
		
	}
	// before Advice
	public void beforeAdvice() {
		System.out.println("핵심기능 수행하기 전 알아서 beforeAdvice(공통기능) 수행");
	}
	// after Advice
	public void afterAdvice() {
		System.out.println("핵심기능 수행하고 알아서 afterAdvice(공통기능) 수행");
	}
	// after-returning Advice
	public void afterReturningAdvice() {
		System.out.println("정상적으로(예외발생되지 않고) 핵심기능이 수행된 후 이 afterReturningAdvice 수행");
	}
	// after-thrwing Advice
	public void afterThrowingAdvice() {
		System.out.println("예외가 발생된 후 핵심기능이 수행된 후 이 afterThrowingAdvice 수행");
	}
}
