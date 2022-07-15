package com.lec.ch07.controller;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
//member?method=join, member?method=login, member?method=logout, member?method=infoModify
@Controller
@RequestMapping("member")
public class MemberController {
	@RequestMapping(params="method=join", method=RequestMethod.GET)
	public String join(Model model) {
		model.addAttribute("kind","회원");
		return "member/join";
	}
	
	@RequestMapping(params="method=login")
	public String login(Model model) {
		model.addAttribute("result","login"); //전달받은 파라미터를 로그인 
		return "member/result";
	}
	@RequestMapping(params="method=logout")
	public String logout(Model model) {
		model.addAttribute("result","logout"); //전달받은 파라미터를 로그아웃
		return "member/result";
	}
	@RequestMapping(params="method=infoModify")
	public String infoModify(Model model) {
		model.addAttribute("result", "infoModify");
		return "member/result";
	}
	
}
