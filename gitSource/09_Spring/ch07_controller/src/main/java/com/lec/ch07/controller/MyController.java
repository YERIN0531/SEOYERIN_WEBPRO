package com.lec.ch07.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class MyController {
 //http://localhost:8090/ch07/요청처리
	//'/'요청이 들어왔을때 다음과 같은 함수를 수행하여라 
	@RequestMapping("/")
	// 매개변수에 있는 뭔가를 넘겨주고 싶으면 Model형의 변수를 써줘야함
	public String home(Model model) {
		//슬래시 요청을 받으면 home이라는 함수를 실행하는 것 
		model.addAttribute("greeting","안녕하세요, 스프링");
		return "main"; //view : /WEB-INF/views/main.jsp ---- servlet-context.xml 안에 빈 안에 있음 
	}
}
