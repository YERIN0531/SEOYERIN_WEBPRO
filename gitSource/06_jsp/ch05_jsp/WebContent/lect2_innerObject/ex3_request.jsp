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
	<h2>컨텍스트 path : <%=conPath %></h2>
	<hr>
	<!-- 아래 다 똑같은 말임 하지만 앞으로는 getContextPath()를 쓸거임 -->
	<a href="<%=conPath%>/Ex3">Ex3서블릿</a><br>
	<!-- <a href="../Ex3">Ex3서블릿</a>
	<a href="/ch05_jsp/Ex3">Ex3서블릿</a> -->
	<button onclick="location.href='<%=conPath%>/Ex3'">Ex3서블릿</button>
</body>
</html>