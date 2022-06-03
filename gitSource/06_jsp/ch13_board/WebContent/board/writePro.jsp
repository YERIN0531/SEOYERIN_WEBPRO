<%@page import="com.lec.dao.BoardDao"%>
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
	<%request.setCharacterEncoding("utf-8"); %>
	<jsp:useBean id="dto" class="com.lec.dto.BoardDto"/>
	<jsp:setProperty property="*" name="dto"/>
	<%-- <%=dto %> --%>
	<%
		dto.setIp(request.getRemoteAddr());
		BoardDao dao = BoardDao.getInstance();
		int result = dao.inserBoard(dto);
		if(result==BoardDao.SUCCESS){
			%>
			<script>
			alert('글쓰기 완료');
			location.href='list.jsp';
			</script>
		<%}else{%>
			<script>
			alert('글쓰기 실패');
			history.back();
			</script>
		<% }
	%>
</body>
</html>