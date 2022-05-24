<%@page import="java.sql.Date"%>
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
request.setCharacterEncoding("utf-8");
String writer = request.getParameter("writer");
String memo = request.getParameter("memo");

//데이터 베이스 할때는 ip주소 넣어야됨 
String ip   =request.getRemoteAddr(); //요청한 클라이언트의 ip 주소 

// 게시판에 글쓰면 주소뿐 아니라 시점도 자동적으로 입력됨
// sql 형태의 Date는 매개변수에 무조건 뭐를 써야됨 
Date date = new Date(System.currentTimeMillis()); //요청한 시점의 날짜와 시간 

%>	
	<h2>글쓴이 : <%=writer %></h2>
	<h2>한줄메모 : <%=memo %></h2>
	<h2>글쓴이 ip : <%=ip %></h2>
	<h2>글쓴시점 : <%=date %></h2>
</body>
</html>

































