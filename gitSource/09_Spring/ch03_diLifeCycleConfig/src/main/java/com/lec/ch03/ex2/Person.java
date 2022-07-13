package com.lec.ch03.ex2;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.context.EnvironmentAware;
import org.springframework.core.env.Environment;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Person implements InitializingBean , DisposableBean, EnvironmentAware{
	private String name;
	private String tel;
	@Override
	public void setEnvironment(Environment environment) {
		System.out.println("Person 형 빈 객체 생성하자마자 실행 1 : setEnvironment()호출");
	}
	@Override
	public void afterPropertiesSet() throws Exception {
		System.out.println("Person 형 빈 객체 생성하자마자 실행 2 : afterPropertiesSet()");
	}
	@Override
	public void destroy() throws Exception {
		System.out.println("Person 형 빈 객체 소멸되기 직전 실행 : destroy 호출");
	}
}
