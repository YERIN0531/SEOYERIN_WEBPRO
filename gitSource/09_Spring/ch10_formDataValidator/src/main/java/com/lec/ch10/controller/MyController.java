package com.lec.ch10.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.lec.ch10.vo.Student;
import com.lec.ch10.vo.Student2;
import com.lec.ch10.vo.StudentValidator;
import com.lec.ch10.vo.StudentValidator2;

@Controller
public class MyController {

	@RequestMapping(value="inputForm.do", method=RequestMethod.GET)
	public String inputForm() {
		return "ex/inputForm";
	}
	
	@RequestMapping(value="input.do", method=RequestMethod.GET)
	public String input(Student student, Errors errors, Model model) {
		//검증 객체를 이용해서 검증 method 호출 
		/*검증 객체를 이용해서 에러를 잡았으면 {
			viewPage = "inputForm.do"
		    에러난 곳 점검 메세지 model에 add
		*/
		StudentValidator validator = new StudentValidator();
		validator.validate(student, errors);
		if(errors.hasErrors()) { //에러가 있으면
			if(errors.getFieldError("name")!=null) {
				model.addAttribute("nameError","name은 반드시 필수 입력 사항");
			}
			if(errors.getFieldError("id")!=null) {
				model.addAttribute("idError","id는 자연수 입니다");
			}
			return "ex/inputForm";
		}
		return "ex/inputResult";
	}

	@ModelAttribute("cnt")
	public int cnt() {
		return 4;
	}
	@RequestMapping(value="quizInput.do", method=RequestMethod.GET)
	public String quizInput() {
		return "quiz/quizInput";
	}
	@RequestMapping(value="quizInput.do", method=RequestMethod.POST)
	public String result(Student2 student2, Errors errors, ModelAndView mav) {
		StudentValidator2 validator2 = new StudentValidator2();
		validator2.validate(student2, errors);
		if(errors.hasErrors()) {
			if(errors.getFieldError("name")!=null) {
				mav.addObject("nameError", "이름에 한글자 이상 오고");
			}
			if(errors.getFieldError("kor")!=null) {
				mav.addObject("scoreError","점수는 0~100점사이");
			}
			if(errors.getFieldError("eng")!=null) {
				mav.addObject("scoreError","점수는 0~100점사이");
			}
			if(errors.getFieldError("mat")!=null) {
				mav.addObject("scoreError","점수는 0~100점사이");
			}
			return "quiz/quizInput";
		}
		return "quiz/quizResult";
	}
	
	
	
}
