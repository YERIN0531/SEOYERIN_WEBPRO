<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="../css/join.css" rel="stylesheet">
</head>
<body>
	<% //import 지시자 확인하려고 만든 아이 
	int[] arr = {10,20,30};
	out.println(Arrays.toString(arr));
	%>
	
	<hr>
	<%@ include file="../member/footer.jsp" %>
	<hr>
	다시 ex3_지시자.jsp로 옮
</body>
</html>


























