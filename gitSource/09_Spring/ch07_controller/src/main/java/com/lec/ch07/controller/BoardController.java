package com.lec.ch07.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.lec.ch07.dto.Member;
@Controller
//board/write, board/content, board/list, board/reply
@RequestMapping("board") //공통요청경로 
public class BoardController {

	@RequestMapping(value="write") // 조합된 요청경로 : board/write
	public String write() {
		return "board/write"; //뷰 : /WEB-INF/views/board/write.jsp
	}
	@RequestMapping(value="content", method=RequestMethod.GET)  
	public String content(Model model/*, HttpServletRequest request*/) {
//		request.setAttribute("id","aaa"); jsp에서 쓰는 방식은 다 먹히지만 우린 model을 활용할것
		model.addAttribute("id","aaa");
		model.addAttribute("pw","111");
		//기본타입 뿐 아니라 객체도 model에 추가 가능함
		Member member = new Member("bbb","222");
		model.addAttribute("member",member);
		return "board/content";
	}
	@RequestMapping(value="list", method=RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView();
		Member member = new Member("ccc","111");
		ArrayList<Member> list = new ArrayList<Member>();
		list.add(member);
		mav.addObject("list",list); //model.addAttribute("list",list); 
		mav.setViewName("board/list"); //뷰 이름을 셋팅해준것 
		return mav;
	}
	@RequestMapping(value="/reply", method=RequestMethod.GET)
	public ModelAndView reply(ModelAndView mav) {
		Member member = new Member("ddd","111");
		mav.addObject("member",member); 
		mav.setViewName("board/reply");
		return mav;
		
	}
	
	
	
	
	
	
	
	
	
}
