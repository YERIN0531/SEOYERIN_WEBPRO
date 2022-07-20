package com.lec.ch11.controller;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
// mvcboard/list.do, mvcboard/writeView.do, mvcboard/write.do, 
// mvcboard/content.do, mvcboard/modify.do, mvcboard/reply.do
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.ch11.bservice.BContentService;
import com.lec.ch11.bservice.BDeleteService;
import com.lec.ch11.bservice.BListService;
import com.lec.ch11.bservice.BModifyReplyViewService;
import com.lec.ch11.bservice.BModifyService;
import com.lec.ch11.bservice.BReplyService;
import com.lec.ch11.bservice.BWriteService;
import com.lec.ch11.bservice.Service;
import com.lec.ch11.dto.BoardDto;
@Controller
@RequestMapping("mvcboard") // 공통요청경로
public class BoardController {
	private Service bservice;
	@RequestMapping(value="list", method = RequestMethod.GET)
	public String list(String pageNum, Model model) {
		// mvcboard/list.do?pageNum=2
		// mvcboard/list.do
		model.addAttribute("pageNum", pageNum);
		bservice = new BListService();
		bservice.execute(model);
		return "mvcboard/list";
	}
	@RequestMapping(value="list", method = RequestMethod.POST)
	public String list_post(String pageNum, Model model) {
		// mvcboard/list.do?pageNum=2
		// mvcboard/list.do
		model.addAttribute("pageNum", pageNum);
		bservice = new BListService();
		bservice.execute(model);
		return "mvcboard/list";
	}
	@RequestMapping(value="writeView", method = RequestMethod.GET)
	public String writeView() {
		return "mvcboard/write";
	}
	@RequestMapping(value="write", method = RequestMethod.POST)
	public String write(@ModelAttribute("bDto") BoardDto boardDto, 
						HttpServletRequest request, Model model) {
		model.addAttribute("request", request); // 서비스단에서 ip 추출(request.getRemoteAddr()) ip 가져올라오 rquest 객체씀
		bservice = new BWriteService();
		bservice.execute(model);
		return "forward:list.do";
	}
	@RequestMapping(value="content", method = RequestMethod.GET)
	public String content(int bid, Model model) {
		model.addAttribute("bid", bid);
		bservice = new BContentService(); // 조회수를 1 올리고 dto 가져오기
		bservice.execute(model);
		return "mvcboard/content";
	}
	@RequestMapping(value="content", method = RequestMethod.POST)
	public String content_post(int bid, Model model) {
		model.addAttribute("bid", bid);
		bservice = new BModifyReplyViewService(); // 조회수를 올리지 않고 dto 가져오기
		bservice.execute(model);
		return "mvcboard/content";
	}
	@RequestMapping(value = "modify", method = RequestMethod.GET)
	public String modifyView(int bid, Model model) {
		model.addAttribute("bid", bid);
		bservice = new BModifyReplyViewService();
		bservice.execute(model);
		return "mvcboard/modify";
	}
	//얘는 get으로 받으면 안됨 게시판의 글이 200글자가 넘어갈수도 있음 
	@RequestMapping(value="modify", method = RequestMethod.POST)
	public String modify(BoardDto boardDto, Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		bservice = new BModifyService();
		bservice.execute(model);
		return "forward:content.do";
	}
	@RequestMapping(value="delete", method = RequestMethod.GET)
	public String delete(int bid, Model model) {
		model.addAttribute("bid", bid);
		bservice = new BDeleteService();
		bservice.execute(model);
		return "forward:list.do";
	}
	@RequestMapping(value="reply", method = RequestMethod.GET)
	public String replyView(int bid, Model model) {
		model.addAttribute("bid", bid);
		bservice = new BModifyReplyViewService();  // bid로 dto 가져오기(조회수를 올리지 않고)
		bservice.execute(model);
		return "mvcboard/reply";
	}
	@RequestMapping(value="reply", method = RequestMethod.POST)
	public String reply(BoardDto boardDto, HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		bservice = new BReplyService();
		bservice.execute(model);
		return "forward:list.do";
	}
}















