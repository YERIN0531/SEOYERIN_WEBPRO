<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%=conPath %>/css/style.css" rel="stylesheet">
</head>
<body>
	<% 
	//로그인 전과 로그인 후의 welcome이 다름
		//name과 id를 먼저 받는다.
		String name = (String)session.getAttribute("name");
		String id   = (String)session.getAttribute("id");
	%>
	<%if(name!=null){//로그인된상태%>
		<h2><%=name %>(<%=id %>)님 안녕하세요</h2>
		<button onclick ="location.href='logout.jsp'">로그아웃</button>
	<%}else{ //비로그인상태%>
		<h2>손님 안녕하세요. 로그인이 필요합니다</h2>
		<button onclick = "location.href='login.jsp'">로그인</button>
	<%} %>
		<button onclick = "location.href='sessionTest.jsp'">세션 들여다 보기</button>
</body>
</html>