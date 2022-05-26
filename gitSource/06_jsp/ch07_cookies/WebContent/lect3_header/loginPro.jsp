<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%=conPath %>/css/login.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		if(id==null || !id.equals("aaa") || pw==null ||!pw.equals("111")){
			response.sendRedirect("login.jsp?msg=xx");
		}else{
			//로그인 처리 
			Cookie cookie = new Cookie("id", id);
			cookie.setMaxAge(-1);
			response.addCookie(cookie);
			response.sendRedirect("main.jsp");
		}
	%>
	
	</body>
</html>

































