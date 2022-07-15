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
	<h2>StudentNG 페이지</h2>
	<h4>confirm 에서 실패된 ID : ${param.id } (파라미터의 id 0)</h4>
	<h4>confirm 에서 실패된 ID : ${id } (model id X)</h4>
</body>
</html>