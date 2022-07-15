<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/style.css" rel="stylesheet">
</head>
<body>
	<h2>board의 content.jsp 페이지입니다.</h2>
	  <h3> ID : ${id }</h3>
	  <h3> PW : ${pw }</h3>
	  <h3>${member } (toString()결과)</h3>
	  <h3>member.getId() : ${member.id }</h3>
	  <h3>member.getPw() : ${member.pw }</h3>
	  <hr>
	  <h2 onclick="history.go(-1)">이전 페이지로 가기</h2>
</body>
</html>