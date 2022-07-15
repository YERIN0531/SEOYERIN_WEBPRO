package com.lec.ch09.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyController {
	// .do 붙여도 되고 안붙여도 됨 
	
	@RequestMapping(value="main", method=RequestMethod.GET)
	public String main() {
		return "main";
	}
	
	@RequestMapping(value="student", method= RequestMethod.GET)
	public String student(String id, Model model) {
//		String method = request.getMethod(); // get방식으로 왔는지, post방식으로 왔는지 뿌리기 위해 씀
		model.addAttribute("method", "GET");
		model.addAttribute("id",id);
		return "student";
	}
	@RequestMapping(value="student", method= RequestMethod.POST)
	public ModelAndView student(String id, ModelAndView mav) {
//		String method = request.getMethod(); // get방식으로 왔는지, post방식으로 왔는지 뿌리기 위해 씀
		mav.addObject("method", "post");
		mav.addObject("id",id);
		mav.setViewName("student");
		return mav;
	}
	@RequestMapping(value="idConfirm", method=RequestMethod.GET)
	public String idConfirm(String id,Model model ) {
		model.addAttribute("id",id);
		if(id.equals("aaa")) {
//			return "redirect:studentOk.do";
			return "forward:studentOk.do";
		}
		return "redirect:studentNg.do"; 
	}
	@RequestMapping(value="studentOk",method=RequestMethod.GET)
	public String studentOk() {
		return "studentOk";
	}
	@RequestMapping(value="studentNg",method=RequestMethod.GET)
	public String studentNg() {
		return "studentNg";
	}
	
	@RequestMapping(value="fullpath", method= RequestMethod.GET)
	public String fullpath() {
		return "redirect:http://www.naver.com";
	}
}












