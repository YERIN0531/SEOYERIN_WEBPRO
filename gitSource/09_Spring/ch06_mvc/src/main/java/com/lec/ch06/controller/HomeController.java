package com.lec.ch06.controller;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		//콘솔창에 뿌려주는 애 
		logger.info("Welcome home! The client locale is {}.", locale);
		
		//현재 시점을 date 변수에 넣고, Dateformat 통해서 현재시점의 날짜의 포맷을 정해준다
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		// 매개변수에 model이 있으면 요청사항이 들어오면 controller로 가서 model.addAtribute 해줌(jsp에서는 request.setATtribute) 
		// 새 요청이 들어오기 전까진 model이 유효함 
		// 모델에다가 날짜 포멧 넣어주기 (simpledateformat 같은거) 
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("greeting","Hello, Spring");
		// 컨트롤러에서 model 이랑 view를 가져와야하는 home은 view 이름 
		return "home";
	}
	
}
