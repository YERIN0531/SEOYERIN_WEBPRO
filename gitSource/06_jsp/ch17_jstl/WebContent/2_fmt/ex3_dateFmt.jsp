<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.Date"%>
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
	<c:set var="nowDate" value="<%=new Date(System.currentTimeMillis()) %>"/>
	<c:set var="nowTimes" value="<%=new Timestamp(System.currentTimeMillis()) %>"/>
	<c:set var="nowDateUtil" value="<%=new java.util.Date() %>"/>
	${nowDate }<br>
	${nowTimes }<br>
	${nowDateUtil }<br>
	<hr>
	<!-- 타입을 데이트로 지정해주면 date만 나옴 , time으로 하면 time만 나옴, both로 하면 둘 다 나옴   -->
	<!--  dateStyle을 지정해줄수도 있음  -->
	<h3>날짜만 출력</h3>
	<fmt:formatDate value="${nowDate }" type="date" dateStyle="short"/><br>
	<fmt:formatDate value="${nowDate }" type="date" dateStyle="medium"/><br>
	<fmt:formatDate value="${nowDate }" type="date" dateStyle="long"/><br>
	<fmt:formatDate value="${nowDate }" type="date" dateStyle="full"/><br>
	
	<h5>시간만 출력 </h5>
	<fmt:formatDate value="${nowDate }" type="time" timeStyle="short"/><br>
	<fmt:formatDate value="${nowDate }" type="time" timeStyle="medium"/><br>
	<fmt:formatDate value="${nowDate }" type="time" timeStyle="long"/><br>
	<fmt:formatDate value="${nowDate }" type="time" timeStyle="full"/><br>
	
	<h5>날짜와 시간 모두 출력</h5>
	<fmt:formatDate value="${nowDate }" type="both" dateStyle="long"  timeStyle="short"/><br>
	<fmt:formatDate value="${nowDate }" type="both" dateStyle="short" timeStyle="medium"/><br>
	<fmt:formatDate value="${nowDate }" type="both" timeStyle="long"/><br>
	<fmt:formatDate value="${nowDate }" type="both" timeStyle="long"/><br>

	<fmt:formatDate value="${nowDate }" pattern="yy년MM월 dd(E) HH:mm:ss:SS"/><br>
	
	
	
</body>
</html>





