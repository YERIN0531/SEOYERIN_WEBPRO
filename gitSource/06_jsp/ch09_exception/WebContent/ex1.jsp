<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="exceptionPage.jsp" %>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
<%! int num1, num2; %>
<%
	//num2에 0이 들어갈경우 에러가 남 try-catch해도 되긴 하지만 예외 페이지를 만들것 
	num1 = Integer.parseInt(request.getParameter("num1"));
	num2 = Integer.parseInt(request.getParameter("num2"));
	out.println("<h3>num1=" + num1 + ", num2=" + num2 +"</h3>");
	out.println("<h3>num1 + num2 = " + (num1+num2) + "</h3>");
	out.println("<h3>num1 / num2 = " + (num1/num2) + "</h3>");
	out.println("<h3>num1 - num2 = " + (num1-num2) + "</h3>");
	out.println("<h3>num1 * num2 = " + (num1*num2) + "</h3>");
	out.println("<h3>DONE</h3>");
%>	
</body>
</html>