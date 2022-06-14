<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%=conPath%>/css/style.css" rel="stylesheet">
</head>
<body>
	<h2>contextID : ${initParam.contextID }</h2>
	<h2>contextPW : ${initParam.contextPW }</h2>
	<!--  아래 함수를 써도 되지만, 우린 표현식을 안 쓰기로 했으니 위에처럼 쓰면 됨  -->
	<h2>contextID : <%=getServletContext().getInitParameter("contextID") %></h2>
	
</body>
</html>