<%@page import="com.lec.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/style.css" rel="stylesheet">
</head>
<body>
	<%
	BoardDao dao = BoardDao.getInstance();
	for(int i=0; i<60; i++){
		String bname = "홍길동" + i;
		String btitle = "글제목 " + i;
		String bcontent = "글본문";
		String bip = "129.16.126."+i;
		dao.insertBoard(bname,btitle,bcontent,bip);
	}
	response.sendRedirect("../list.do");
	
	%>
</body>
</html>