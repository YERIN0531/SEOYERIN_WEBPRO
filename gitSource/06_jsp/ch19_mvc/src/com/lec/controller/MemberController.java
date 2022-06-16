package com.lec.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.service.MemberJoinService;
import com.lec.service.MemberListservice;
import com.lec.service.Service;

@WebServlet("*.do")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		actionDo(request, response);
	}
	
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI(); 
		String conPath = request.getContextPath();
		String command = uri.substring(conPath.length());
		
		String viewPage = null;
		Service service = null;
		
		
		if(command.equals("/memberList.do")) {
			// list 로직 수행하는 객체를 생성
			service = new MemberListservice();
			// 객체.메소드()
			service.execute(request, response);
			// view단 설정 
			viewPage = "member/memberList.jsp";
			
		}else if(command.equals("/memberJoin_veiw.do")){
			//얘는 form태그에 뿌리기만 하면 끝나기 때문에 request를 받는다거나, 로직을 수행하는 등의 과정이 필요가 없음
			// view단 설정 
			viewPage = "member/join.jsp";
			
		}else if(command.equals("/memberJoin.do")) {
			// join 로직 수행하는 객체를 생성
			service = new MemberJoinService();
			// 객체.메소드()
			service.execute(request, response);
			// view단 설정 
			viewPage="memberList.do";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}

}
