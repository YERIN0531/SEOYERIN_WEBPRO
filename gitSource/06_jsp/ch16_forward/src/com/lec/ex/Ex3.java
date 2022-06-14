package com.lec.ex;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex3")
public class Ex3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		actionDo(request,response);
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int su = Integer.parseInt(request.getParameter("su"));
		int sum = 0;
		for(int i=0; i<=su; i++) {
			sum += i;
		}
		// 이 수를 request 객체에 담기 
		// 이렇게 쓸수도 있지만 아래처럼 써도 됨 request.setAttribute("sum", new Integer(sum));
		request.setAttribute("sum", new Integer(sum));
		
		//view 단으로 보내기 
		RequestDispatcher dispatcher = request.getRequestDispatcher("1_dispatcher/ex3_suView.jsp");
		dispatcher.forward(request, response);
		
		
		
		
	}
}
