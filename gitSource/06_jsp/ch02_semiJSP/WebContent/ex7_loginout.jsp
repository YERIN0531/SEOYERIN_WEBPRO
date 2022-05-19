<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<h4>결과화면</h4>
	<%! String name, id, pw; %>
	
	<%
	request.setCharacterEncoding("utf-8");// post 방식으로 파라미터 전송시만 
	name = request.getParameter("name");
	id = request.getParameter("id");
	pw = request.getParameter("pw"); //pw는 숫자만 들어가는거 아니니까 int가 아니라 String으로
	%>
	<p>아이디는 <%=id%> 이고</p>
	<p>패스워드는 <%=pw%> 입니다</p>
	<p><%=name%>님 반갑습니다</p>
</body>
</html>