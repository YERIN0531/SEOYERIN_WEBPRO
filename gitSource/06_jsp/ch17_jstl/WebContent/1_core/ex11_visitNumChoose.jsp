<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<c:set var="visitNum" value="${param.visitNum }"/>
<!-- 	표준 액션태그는 jstl에서만 사용 가능하며 반드시 닫는 태그를 해주어야 함. choose는 액션태그의 영역 -->
	<c:choose>
		
		<c:when test="${visitNum eq 0 }">
		<h2>첫 방문 감사합니다</h2>
		</c:when>
		
		<c:when test="${visitNum>0 && visitNum<5 }">
		<h2>더 자주 뵙고 싶어요</h2>
		</c:when>
		
		<c:when test="${visitNum>=5 }">
		<h2>자주 방문해 주셔서 감사합니다</h2>
		</c:when>

		<c:when test="${visitNum<0 }">
		<h2>제대로된 방문 횟수를 받지 못했습니다</h2>
		</c:when>
	</c:choose>	
	
	
</body>
</html>