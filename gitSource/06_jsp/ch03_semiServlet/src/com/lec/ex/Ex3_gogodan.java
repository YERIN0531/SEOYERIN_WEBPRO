package com.lec.ex;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Ex3gogodan", urlPatterns = { "/Ex3gogodan" })
public class Ex3_gogodan extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int su = Integer.parseInt(request.getParameter("su"));
		/*response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();// html을 불러올 수 있는
		out.println("<html>");
		out.println("<head>");
		//<link href="/ch03_semiServlet/css/ex3.css" rel = "stylesheet">
		out.println("<link href=\"/ch03_semiServlet/css/ex3.css\" rel = \"stylesheet\">");
		out.println("</head>");
		out.println("<body>");
		out.println("<h3>" + su + "단 구구단입니다</h3>");
		for(int i = 1; i<=9; i++) {
			out.printf("<p>%d * %d = %d</p>", su, i, su*i);
		}
		out.println("</body>");
		out.println("</html>");
		out.close();
		*/
		response.setContentType("text/html; charset=utf-8");
		for(int idx=1; idx<=9; idx++) {
			
			PrintWriter out = response.getWriter();// html을 불러올 수 있는
			out.println(su + "x" + idx + "=" + su*idx + "<br>");
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
