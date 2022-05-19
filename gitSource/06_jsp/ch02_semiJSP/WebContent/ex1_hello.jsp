<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<h1>Hello, World</h1>
	
	<%
	int total = 0;
	for(int i = 1; i<100; i++){
		total += i;
	}
	%>
	<h2>1부터 100까지 누적합은 <%=total%>입니다</h2>
	<h2>1부터 100까지 누적합은 5050입니다</h2>
</body>
</html>




























