<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
<!-- ex1_forward.jsp?n=1 실행 -->
	<h1>ex2_forward.jsp 페이지입니다</h1>
	<%
		String n = request.getParameter("n");
	%>	
	<h2>n : <%=n %></h2>
</body>
</html>