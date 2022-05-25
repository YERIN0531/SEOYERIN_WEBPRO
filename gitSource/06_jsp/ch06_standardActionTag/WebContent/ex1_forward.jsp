<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<!-- ex1_forward.jsp?n=1로 요청 -->
	<h2>ex1_forward.jsp 페이지입니다</h2>
	 <jsp:forward page="ex2_forward.jsp"/>
	 
	<!-- redirect하면 n=1이 안감. request로 받아와야됨. 새로운걸 받아오려면 기존의 request객체를 없애고 가지고옴 -->
	<%//response.sendRedirect("ex2_forward.jsp");
		//얘를 실행하면 request 객체가 새롭게 만들어짐 n이라는 파라미터를 전달하고와도, sendRedirect에는 n=1이 전달이 안됨 (객체를 새로 만드니까)
		//전달받은 파라미터를 그대로 전달하려면 jsp:forward를 써야됨 
	%>
</body>
</html>