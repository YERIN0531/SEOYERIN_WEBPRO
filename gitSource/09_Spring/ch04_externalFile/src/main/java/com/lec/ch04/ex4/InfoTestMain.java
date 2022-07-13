package com.lec.ch04.ex4;

import java.util.Scanner;

import org.springframework.context.support.GenericXmlApplicationContext;


public class InfoTestMain {
 public static void main(String[] args) {
	
	//1) 어떤 아이를 ACTIVE 할지 물어봐야해
			String config = null; // 초기화하지 않으면 에러날 수도 있어서 초기화함 
			Scanner sc = new Scanner(System.in);
			System.out.println("dev?run?");
			String answer = sc.next(); //결과값 담기 
			if(answer.equalsIgnoreCase("dev")) {
				config = "dev";
			}else if(answer.equalsIgnoreCase("run")) {
				config = "run";
			}else {
				System.out.println("제대로 된 환경이 입력되지 않았습니다.");
				System.exit(0); //프로그램 끝내기 
			}
			sc.close();
			
			//2) div나 run 을 액티브 해라 
			GenericXmlApplicationContext ctx = new GenericXmlApplicationContext();
			ctx.getEnvironment().setActiveProfiles(config);
			
			//3) 로드 시키고, 로드 안에 CTX 넣어주기 
			ctx.load("classpath:META-INF/ex4/CTX_dev.xml","classpath:META-INF/ex4/CTX_run.xml");
			ctx.refresh();
			Info info = ctx.getBean("Info", Info.class);
			System.out.println("ipNum = " + info.getIpNum());
			System.out.println("portNum = " + info.getPortNum());
			System.out.println("userId = " + info.getUserId());
			System.out.println("pw=" + info.getUserPw());
		}
}
