package com.mega.lect;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex2")
public class Ex2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//menu, rest, 파라미터 : request.getParameterValues("파라미터이름") => 배열로 받음 
		// 배열에 아무것도 없으면 null, 같은 이름의 파라미터가 여러개
		//nation 파라미터 : request.getParameter("파라미터이름") 
		String[] menu 	= request.getParameterValues("menu");
		String[] rest 	= request.getParameterValues("rest");
		String   nation = request.getParameter("nation");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		/*for(int i = 0; i<menu.length ; i++)
		 * 여기서 for문 돌릴경우 menu가 null이 들어가게 되면 오류가 나기 때문에 확장 for문을 써주거나 아니면 if문으로 쓰기 
		 */
		if(menu!=null) {
			out.println("<h4>선택한 메뉴는</h4><br>");
			for(String m : menu) {
				out.println(m + "<br>");
			}
		}else {
			out.println("<h4>선택한 메뉴가 없습니다</h4>");
		}
		if(rest!=null) {
			out.println("<h4>선택한 식당은</h4><br>");
			for(String r : rest) {
				out.println(r + "<br>");
			}
			out.println("<h4>선택 식당 지역은" + Arrays.toString(rest)+"입니다</h4>");
		}else {
			out.println("<h4>선택한 식당이 없습니다</h4>");
		}
		out.println("<h4>당신의 국적은 " + nation + "입니다</h4>");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
