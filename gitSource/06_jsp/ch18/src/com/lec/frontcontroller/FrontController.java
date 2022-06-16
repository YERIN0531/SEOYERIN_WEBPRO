package com.lec.frontcontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.service.DeleteService;
import com.lec.service.InsertService;
import com.lec.service.SelectService;
import com.lec.service.Service;
import com.lec.service.UpdateService;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("<h1>FrontController</h1>");
		
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		actionDo(request, response);
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String conPath = request.getContextPath(); // conPath  뿌려주는 아이
		//들어온 요청을 command 변수에 담고, 앞에 있는 conPath를 삭제해주기 
		String command = uri.substring(conPath.length());; // "/select.do"
		System.out.println("uri = " + uri); //ch18/*.do
		System.out.println("conPath = " + conPath); ///ch18
		System.out.println("최종 요청 = " + command);
		
		//내가 갈 JSP 페이지를 저장할 변수를 설정해주기 
		String viewPage = null; //뷰단의 이름 
		Service service = null;
		if(command.equals("/insert.do")) {
			// insert 로직을 수행할 객체 생성
			// 객체이름.메소드()
			//request.setAttribute("result", "insert 결과");
			service = new InsertService();
			service.execute(request, response);
			//실제 게시판에서 insert 성공 후 보통 list로 향하게 됨 따라서 viewPage를 select로 수정해주어야 함 
			viewPage = "select.do";
			
		}else if(command.equals("/select.do")) {
			service = new SelectService();
			service.execute(request, response);
			viewPage = "ex2/select.jsp";
			
		}else if(command.equals("/delete.do")) {
			service = new DeleteService();
			service.execute(request, response);
			viewPage = "select.do";
			
		}else if(command.equals("/update.do")) {
			service = new UpdateService();
			service.execute(request, response);
			viewPage = "select.do";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}
}
