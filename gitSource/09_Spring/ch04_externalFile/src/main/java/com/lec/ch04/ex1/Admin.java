package com.lec.ch04.ex1;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.context.EnvironmentAware;
import org.springframework.core.env.Environment;
import lombok.Data;
@Data
public class Admin implements EnvironmentAware, InitializingBean{

	private String adminId;
	private String adminPw;
	private Environment env;
	@Override
	public void setEnvironment(Environment environment) {
		env = environment; //bean 생성하자마자 실행 1 	
	}
	@Override
	public void afterPropertiesSet() throws Exception {
		adminId = env.getProperty("admin.id"); //bean 생성하자마자 실행 2
		adminPw = env.getProperty("admin.pw");
	}
	
}
