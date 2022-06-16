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
	<c:if test="${insertResult == 1 }">
		<script> alert('입력 성공');</script>
	</c:if>
	
	<c:if test="${deleteResult == 1 }">
		<script> alert('삭제 성공');</script>
	</c:if>
	
	<c:if test="${updateResult == 1 }">
		<script> alert('수정 성공');</script>
	</c:if>
	
	<h1>select.jsp 입니다</h1>
	<h3>select 결과${list }</h3>
</body>
</html>