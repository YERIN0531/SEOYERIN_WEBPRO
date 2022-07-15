<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<meta charset="UTF-8">
	<link href="${conPath }/css/style.css" rel="stylesheet">
</head>
<body>
<h1>
	${greeting }  
</h1>
<P>  The time on the server is ${serverTime}. </P>
<p>2022년 07월 14일</p>
<p><img src="${conPath }/img/100.jpg" alt="text"></p>
</body>
</html>
