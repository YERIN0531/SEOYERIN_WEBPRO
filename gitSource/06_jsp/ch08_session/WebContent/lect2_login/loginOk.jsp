<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
<%
	String msg = "";
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	//id제대로 친 거, pw 제대로 친거 분류해서 할거야. 메시지를 따로 뿌릴 거니까
	//id!=null가 없으면 id.equals("aaa")먼저 실행하면 id가 null 일경우 에러남 
	// 첫ㅍ페이지에선 set을 받아온게 없기 때문에 예외가 발생할 수 있음 
	if(id!=null && id.equals("aaa")){//유효한 id를 입력한 경우
		if(pw!=null && pw.equals("111")){//pw가 맞는 경우
			//로그인 처리 = 세션 속성(id, name) 추가한 후 welcome.jsp로 가기
			session.setAttribute("id", id);
			session.setAttribute("name","홍길동");
			response.sendRedirect("welcome.jsp");
		}else{//pw가 틀린경우
			msg=URLEncoder.encode("pw를 체크하세요","utf-8");
			response.sendRedirect("login.jsp?msg="+msg);
		}
	}else{// 유효하지 않은 id를 
		msg = URLEncoder.encode("id를 체크하세요", "utf-8");
		response.sendRedirect("login.jsp?msg="+msg);
	}
%>	
</body>
</html>

























