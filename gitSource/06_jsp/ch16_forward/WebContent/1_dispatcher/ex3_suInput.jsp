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
	<%int a = 5; %>
	<h2>a : <%=a %></h2>
	<h2>a : ${a }요건 안나와요</h2> <!-- 표현식에다가 변수를 선언하면 el태그에서 읽지를 못함  -->
	
<!-- 	<form action="ex3_suPro.jsp"> -->
	<form action="../Ex3">
	 	누적을 원하는 수 <input type="number" min="1" name="su" required="required">
	 	<input type="submit" value="누적">
	</form>
</body>
</html>