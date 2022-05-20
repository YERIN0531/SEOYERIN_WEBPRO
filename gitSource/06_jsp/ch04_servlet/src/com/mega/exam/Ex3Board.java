package com.mega.exam;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex3Board")
public class Ex3Board extends HttpServlet {
	private static final long serialVersionUID = 1L;
      

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 String title = request.getParameter("title");
	 String content = request.getParameter("content");
	 String name = request.getParameter("name");
	 response.setContentType("text/html; charset=utf-8");
	 PrintWriter out = response.getWriter();
	 out.println("<html>");
	 out.println("<head>");
	 // <link href="css/style.css" rel="stylesheet">
	 out.println("<link href=\"css/style.css\" rel=\"stylesheet\">");
	 out.println("</head>");
	 out.println("<body>");
	 out.println("<table>");
	 out.println("<tr>");
	 out.println("<td colspan='2'>반갑습니다"+name+"님</td>");
	 out.println("</tr>");
	 out.println("<tr>");
	 out.println("<td >글제목</td>");
	 out.println("<td >"+title+"</td>");
	 out.println("</tr>");
	 out.println("<td >글내용</td>");
	 out.println("<td >"+content+"</td>");
	 out.println("<tr>");
	 out.println("</tr>");
	 out.println("</table>");
	 out.println("</body></html>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
