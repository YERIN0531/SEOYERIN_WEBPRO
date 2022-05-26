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
	<%//세션에 속성 추가(객체타입으로 추가)
		session.setAttribute("sessionName", "sessionValue");
		session.setAttribute("myNum", 123);// 이렇게 쓰면 내부적으로 아래처럼 바꿔줌(내부적으로 object타입으로 바꿔줌)
		//session.setAtrribute("myNum",new Integer(123));
	%>
	<h1>세션에 sessionName 속성 추가</h1>
	<h1>세션에 myNum 속성 추가</h1>
	<a href="ex2_sessionGet.jsp">세션 GET</a>
</body>
</html>