package com.lec.ex;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex1")
public class Ex1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		actionDo(request,response);
	}

	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//넘어온 파라미터 id, pw를 이용하여 객체를 만든 후 View단으로 넘긴다 
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	Member member = new Member(id,pw); // Member 객체 생성후, request 객체 안에 넣어주기 
	request.setAttribute("member", member); //view단에서 request객체 안에 있는 member를 출력
	
	//View단으로 포워드 
	
	  RequestDispatcher dispatcher =
	  request.getRequestDispatcher("1_dispatcher/ex2_View.jsp"); //괄호 안에는 View 단 적어주면 됨 forward 시켜주는 방법 dispatcher.forward(request, response);
//	  response.sendRedirect("1_dispatcher/ex2_View.jsp");
	
	
		
	}
}
