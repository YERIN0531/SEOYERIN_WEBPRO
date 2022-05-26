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
		String msg = request.getParameter("msg");
	%>
	<%if("success".equals(msg)){ //가입이 완료된 것 %>
		<h1>가입이 완료 되었습니다</h1>
	<%}else{ %>	
		<h1>가입되지 않았습니다</h1>
		<a href="join.jsp">회원가입으로</a>
	<%} %>
	<hr>
	<button onclick = "location.href='<%=conPath%>/lect2_login/login.jsp'">로그인</button>
</body>
</html>