package com.mega.lect;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Ex3")
public class Ex3_LifeCycle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Ex3_LifeCycle() {
    	//super(); 얘 빼도 알아서 매개변수 없는 super생성자 호출 
    	System.out.println("Ex3_LifeCycle 생성자 - 1");
    	// 메모리에 객체를 막 얹어놓으려고 할 때 생성되는 아이 
    	// 생성자는 객체 만들기 전에 한번 호출됨 
    	// 생성자 함수는 객체가 막 만들어지려고 할때 호출되는것. init는 생성자 함수가 생성되는 순간 호출 
    }
    @PostConstruct//함수이름은 내 마음대로 해도됨
    public void postConstruct() {
    	System.out.println("Ex3_LifeCycle 서블릿 객체가 생성되었을때 수행 - 2-1");
    }
    
	public void init(ServletConfig config) throws ServletException {
		// init는 객체가 생성될 때 , 최초 한 번 수행  호출됨
		System.out.println("Ex3_LifeCycle 서블릿 객체가 생성되었을때 수행 - 2-2");
	}


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// service라는 함수가 있으면 doget과 dopost 무시되고 service만 수행
		// 클라이언트의 요청이 들어왔을 때 수행 
		System.out.println("Ex3_LifeCycle service() 실행 - 3");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("<h2>service()실행했을 경우 </h2>");
		out.close();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 클라이언트 요청이 get 방식으로 들어왔을 때 수행 (service함수가 없을때)
		System.out.println("doGet() 실행");
		response.setContentType("text/html; charset-utf-8");
		PrintWriter out = response.getWriter();
		out.print("<h2>doGet()실행했을 경우 </h2>");
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 클라이언트 요청이 post 방식으로 들어왔을 때 수행 (service함수가 없을때)
		System.out.println("doPost() 실행");
		response.setContentType("text/html; charset-utf-8");
		PrintWriter out = response.getWriter();
		out.print("<h2>doPost()실행했을 경우 </h2>");
		out.close();
		
	}

	public void destroy() {
		// Ex3_LifeCycle 서블릿이 메모리 해제될 때
		// 메모리에서 없어지는 거기 때문에 브라우저에 쓰는 건 의미가 없음 
		System.out.println("destroy() 실행(메모리 해제)- 4-1" );
	}
	
	 @PreDestroy//함수이름은 내 마음대로 해도됨
	    public void predestroy() {
		 System.out.println("destroy() 실행(메모리 해제) - 4-2");
	    }
	 

}
