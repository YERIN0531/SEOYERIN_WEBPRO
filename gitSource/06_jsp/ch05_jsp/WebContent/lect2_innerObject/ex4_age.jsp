<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
<%
	//age라는 파라미터를 age로 
	int age = Integer.parseInt(request.getParameter("age"));
	if(age >=19){
		//그냥 들어가면 age가 몇살인지는 컴퓨터가 까먹게됨. 
		//따라서 ? age = age를 기억하고 가게 써줘야함 age 전달하는 것 
		response.sendRedirect("ex4_pass.jsp?age="+age);
	}else{
		response.sendRedirect("ex4_ng.jsp?age="+age);
	}
%>	
</body>
</html>

































