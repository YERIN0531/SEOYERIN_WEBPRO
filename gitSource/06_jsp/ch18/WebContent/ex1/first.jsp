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
	
	<h1><a href="../insert.do">insert</a></h1>
	<h1><a href="${conPath }/select.do">select</a></h1>
	<h1><a href="/ch18/delete.do">delete</a></h1>
	<h1><a href="http://localhost:8090/ch18/update.do">update</a></h1>
	
</body>
</html>