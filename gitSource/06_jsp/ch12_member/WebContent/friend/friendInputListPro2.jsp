<%@page import="com.lec.friend.FriendDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.lec.friend.FriendDao"%>
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
	<%
	request.setCharacterEncoding("utf-8");
	%>
	<jsp:useBean id="dto" class = "com.lec.friend.FriendDto" scope="page"/>
	<jsp:setProperty property="*" name="dto"/>
	 	<%
	 	response.sendRedirect("friendInputList2.jsp");
	FriendDao fDao = FriendDao.getInstance();
	int result = fDao.insertFriend(dto.getName(), dto.getTel());
	if(result ==FriendDao.SUCCESS){
		session.setAttribute("name", dto.getName());
		session.setAttribute("tel",dto.getTel());
	%>
		<script>
		alert('친구추가 성공');
		location.href='friendInputList.jsp';
		</script>
	<% 
	}else{
		%>
		<script>
		alert('친구추가 실패');
		location.href='friendInputList.jsp';
		</script>
	<%}
	
	%> 
	
</body>
</html>