package com.mega.exam;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex5Join")
public class Ex5Join extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request,response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hiddenParam 	= request.getParameter("hiddenParam");
		String name 		= request.getParameter("name");
		String id 			= request.getParameter("id");
		String pw 			= request.getParameter("pw");
		//String pwChk 		= request.getParameter("pwChk"); - 여기까지 왔다는건 이미 pw와 pwChk가 같다는 뜻이니 안써도 됨
		String birth 		= request.getParameter("birth");
		Date birth2=null; Timestamp birth3=null;
		if(birth!="") {
		birth2			= Date.valueOf(request.getParameter("birth"));
		birth3	= Timestamp.valueOf(request.getParameter("birth")+" 00:00:00");
		}
		String[] hobby 		= request.getParameterValues("hobby"); // 배열||null(나는 유효성 검사 했기 때문에 null은 안나올것)
		String gender 		= request.getParameter("gender");
		String email 		= request.getParameter("email");
		String[] mailSend 	= request.getParameterValues("mailSend");// 배열
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<html>");
		out.println("<head>");
		out.println("<link href='css/join.css' rel='stylesheet'>");
		out.println("</head>");
		out.println("<body>");
		out.println("<div id='joinForm_wrap'>");
		out.println("<div id='join_title'>회원가입정보</div>");
		out.println("<h2>hiddenParam : " + hiddenParam+"</h2>");
		out.println("<h2>이름 : " + name+"</h2>");
		out.println("<h2>아이디 : " + id+"</h2>");

		//pw는 출력시 *처럼 보이도록 for문 돌리기
		out.println("<h2>비밀번호 : ");
		for(int i=0; i<=pw.length(); i++) {
			out.println('*');
		}
			out.println("</h2>");
			
		out.println("<h2>생년월일: " + birth + "</h2>");
		out.println("<h2>생년월일(java.sql.Date): " + birth2+ "</h2>"); //date는 스트링처럼 출력해도됨 
		out.println("<h2>생년월일(java.sql.Timestamp) : " + birth3 + "</h2>");

		//취미 출력시 for문 돌리기(배열이니까!)
		out.println("<h2>취미 : "); // 취미 : 요리, 운동 
		if(hobby!=null) {
			for(int i=0; i<hobby.length; i++) {
				if(i==hobby.length-1){ //맨 마지막 글자라는 뜻 
					out.println(hobby[i]);
				}else { //마지막이 아니면 컴마까지 출력
					out.println(hobby[i]+",");
				}
			}	
		}else {
			out.println("선택된 취미가 없음");
		}
		out.println("</h2>");
		out.println("<h2>성별: " + gender +"</h2>");
		out.println("<h2>이메일: " + email +"</h2>");
		
		//메일 수신동의 출력시 for문 돌리기 (배열이니까)
		out.println("<h2>메일수신동의 : " + Arrays.toString(mailSend) + "</h2>");
		out.println("</div>");
		out.println("</body>");
		out.println("</html>");
		out.close();
	}
}











