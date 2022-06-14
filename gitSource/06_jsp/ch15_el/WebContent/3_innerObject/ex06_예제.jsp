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
	<form action="">
	<p>
	<input type="text" name="su1" value="<%=(int)(Math.random()*9)+1%>">
	*
	<input type="text" name="su2" value="<%=(int)(Math.random()*9)+1%>">
	=
	<input type="number" name="result">
	</p>
	<p>
	<input type="submit" value="확인">
	</p>
	</form>
	<p>
	<h3>
	${param.su1 } * ${param.su2 } = ${param.result }
	${param.result == param.su1*param.su2 ? "는 true 정답" : "는 false" }
	
<%-- 	${param.su1 } * ${param.su2 } = ${param.result } --%>
<%-- 	${param.su1*param.su2 eq param.result } --%>
<!-- 	${not empty param.result ? (param.su1*param.su2 eq param.result ? "정답" : "오답" : "" } -->
	
	 </h3>
	</p>
</body>
</html>