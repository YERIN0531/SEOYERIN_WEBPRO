<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
		<!-- age.html -> age.jsp -> ng.jsp -->
	<%
		//age.jsp에서 넘겨준 age를 다시 받아야됨
		int age = Integer.parseInt(request.getParameter("age"));
	%>	
	<h2><%=age %>살 미성년자니 주류구매 불가능합니다</h2>
	<button onclick = "history.go(-1);">뒤로가기</button>
	
</body>
</html>