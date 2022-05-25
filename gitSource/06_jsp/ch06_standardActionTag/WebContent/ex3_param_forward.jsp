<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<!-- ex3_param_forward.jsp?n=1 -->
	<h1>ex3_param_forward 페이지 입니다</h1>
	<jsp:forward page="ex4.jsp">
		<jsp:param name="id" value="hong" />
		<jsp:param name="pw" value="1111" />
	</jsp:forward>
</body>
</html>