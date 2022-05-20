package com.lec.ex;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Ex1_HelloWorld
 */
//@WebServlet(name = "HelloWorld", urlPatterns = { "/HWorld" })
//url 매핑은 필수 
public class Ex1_HelloWorld extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Ex1_HelloWorld() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("doGet호출");
		//method 불러올때 get으로 불러오면 이 친구가 뜸 
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter(); //스트림 객체 생성
		// out 은 response에 들어가있는 html에 있는 글을 getWriter 해서 넣어놓은 스트링
		out.println("<html>");
		out.println("<head>");
		out.println("<style>");
		out.println("h1{color:blue;}");
		out.println("</style>");
		out.println("</head>");
		out.println("</head>");
		out.println("<body>");
	      out.println("<h1>안녕하세요. 첫 servlet 예제입니다. </h1>");
	      out.println("</body>");
		out.println("</html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost호출");
		doGet(request, response);
		//method 불러올때 post 쓰면 얘까 불러와지고
		//로그인이나 게시판은 post 방식으로 호출해야 됨 
	}

}
