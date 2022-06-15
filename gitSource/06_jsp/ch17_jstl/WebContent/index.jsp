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
	<!-- 이 프로젝트를 만들거에요 라고 선언하기 위해 index.jsp하는 건데, 선언 안해도 상관 없음 -->
	<h1><a href="${conPath }/emplist">empList</a></h1>
	<h1><a href="${conPath }/empSch">empSch</a></h1>
</body>
</html>