<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<h1>ex6_param_include.jsp 페이지입니다</h1>
	<hr>
	<jsp:include page="ex4.jsp">
		<jsp:param name ="n" value="1"/>
		<jsp:param name ="id" value="aaa"/>
		<jsp:param name ="pw" value="111"/>
	</jsp:include>	
	<hr>
	<h1>다시 ex6_param_include.jsp페이지입니다</h1>
</body>
</html>