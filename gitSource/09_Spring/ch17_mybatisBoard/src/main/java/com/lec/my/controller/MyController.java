package com.lec.my.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.my.dto.Board;
import com.lec.my.service.BoardService;
import com.lec.my.util.Paging;
@Controller
public class MyController {

	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value="boardList", method={RequestMethod.GET, RequestMethod.POST})
	public String boardList(String pageNum, Model model) {
		model.addAttribute("boardList", boardService.boardList(pageNum));
		model.addAttribute("paging", new Paging(boardService.totCnt(), pageNum, 10, 5));
		return "boardList";
	}

	@RequestMapping(value="writeView", method = {RequestMethod.GET, RequestMethod.POST})
	public String writeView() {
		return "write";
	}
	@RequestMapping(value="write.do", method= RequestMethod.POST)
	public String write(@ModelAttribute("board")Board board, HttpServletRequest request,  Model model) {
		board.setBip(request.getRemoteAddr());
		model.addAttribute("writeResult", boardService.write(board));
		return "forward:boardList.do";
	}
	
	@RequestMapping(value="detail.do", method=RequestMethod.GET)
	public String detail(int bid, Model model) {
		boardService.upHit(bid);
		model.addAttribute("boardDto", boardService.detail(bid));
		return "detail";
	}
	@RequestMapping(value="updateView.do", method={RequestMethod.GET, RequestMethod.POST})
	public String updateView(int bid, Model model) {
		model.addAttribute("boardDto", boardService.detail(bid));
		return "update";
	}
	@RequestMapping(value="update.do", method=RequestMethod.POST)
	public String update(@ModelAttribute("board")Board board,HttpServletRequest request, Model model) {
		board.setBip(request.getRemoteAddr());
		model.addAttribute("updateResult", boardService.update(board));
		return "forward:boardList.do";
		
	}
	@RequestMapping(value="delete", method = RequestMethod.GET)
	public String delete(int bid, Model model) {
		model.addAttribute("deleteResult", boardService.delete(bid));
		return "forward:boardList.do";
	}
	
	
	@RequestMapping(value="replyView", method = {RequestMethod.GET, RequestMethod.POST})
	public String replyView(int bid, Model model) {
		model.addAttribute("boardDto", boardService.detail(bid));
		return "reply";
	}
	@RequestMapping(value="reply.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String reply(@ModelAttribute("board")Board board, int bid, HttpServletRequest request,  Model model) {
		Board dto = boardService.detail(bid);
		board.setBgroup(dto.getBgroup());
		board.setBstep(dto.getBstep()+1);
		board.setBindent(dto.getBindent()+1);
		board.setBip(request.getRemoteAddr());
		boardService.stepA(dto);
		model.addAttribute("bid", dto.getBid());
		model.addAttribute("replyResult", boardService.reply(board));
		return "forward:boardList.do";
	}
	
	
}
