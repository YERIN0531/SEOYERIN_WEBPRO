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
	String msg="";
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	if(id!=null && id.equals("aaa")){
		if(pw!=null && pw.equals("111")){
			session.setAttribute("id", id);
			session.setAttribute("name","홍길동");
			response.sendRedirect("main.jsp");
		}else{
			msg = URLEncoder.encode("비밀번호가 틀렸습니다","utf-8");
			response.sendRedirect("login.jsp?msg="+msg);
		}
	}else{
		msg = URLEncoder.encode("id가 틀렸습니다","utf-8");
		response.sendRedirect("login.jsp?msg="+msg);
	}
	
	%>



	<%-- <%! String id, pw; %>
	<%
		id = request.getParameter("id");
		pw = request.getParameter("pw");
		// 입력받은 id, pw가 DB에 있는지 확인절차
		if(id!=null && id.equals("aaa") && pw!=null && pw.equals("111")){
			//로그인 처리 (쿠키 만드는 것)
			Cookie cookie = new Cookie("id","aaa");
			cookie.setMaxAge(-1); //유효시간은 브라우저 닫을 때까지
			response.addCookie(cookie);
			Cookie cookie2 = new Cookie("name","홍길동"); //DB에서 가져온 이름을 쿠키값으로
			cookie2.setMaxAge(-1);
			response.addCookie(cookie2);
			response.sendRedirect("welcome.jsp");
			
			/* 
			
			Cookie cookie3 = new Cookie("pw","111"); //DB에서 가져온 이름을 쿠키값으로
			cookie3.setMaxAge(-1);
			response.addCookie(cookie3); 
			정보수정할때 패스워드를 빨리 띄울일이 없기 때문에 (회원정보수정을 빨리하고 싶다) 굳이 pw는 쿠키로 만들 필요가 없음 
			
			*/
			
		}else{
	%>
		<script>
		alert('아이디와 비밀번호가 알맞지 않습니다');
		location.href="login.html";
		</script>
	<%
		}
	%>
 --%>
</body>
</html>