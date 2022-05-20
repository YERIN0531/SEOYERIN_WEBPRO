package com.lec.ex;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "Ex2_suOut", description = "sumOut", urlPatterns = { "/Ex2suOut" })
public class Ex2_suOut extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String numStr = request.getParameter("num"); //얘부터 실행하면 numStr에 null이 들어갈거야 
		if(numStr==null || numStr.equals("")) {
			numStr = "1";
		}
		int num = Integer.parseInt(request.getParameter("num"));
		int sum = 0;
		for(int i=0;i<=num; i++) {
			sum+= i;
		}
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();// html을 불러올 수 있는
		out.println("<h1>1부터" + num + "까지 누적합은 " + sum+"입니다</h1>");
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
