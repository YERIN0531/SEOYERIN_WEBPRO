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
<!-- 	<form action="ex09_visitNum.jsp"> -->
<!-- 	choose문은 잘 안씀 if를 더 많이 씀  -->
	<form action="ex11_visitNumChoose.jsp"> 
		방문횟수
		<input type="number" name="visitNum" required="required">
		<input type="submit">
	</form>
</body>
</html>