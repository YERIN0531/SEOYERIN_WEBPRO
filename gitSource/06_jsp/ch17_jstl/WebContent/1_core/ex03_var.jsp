<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
<h2>변수 선언과 출력</h2>
<c:set var="varName" value="0"/> <!-- 변수 선언  -->
varName : ${varName } <br>
<c:set var="varName" value="abc <varValue>"/>
varName : ${varName } <br>
varName : <c:out value="${varName }" escapeXml="true"/> <br><!-- 변수 출력 -->
<!-- 특수문자가 안나오게 하고 싶으면 escapeXml ="false"해주고 기본값은 "true"이기 때문에 특수문자를문자로 인식해서 내보냄  -->
<c:remove var="varName"/> <!-- 변수 삭제 -->
varName : ${varName }<br>
varName : ${empty varName ? "삭제되서 없음":"남아있음" }<br>
varName : <c:out value="${varName }" default="없어진 변수"/>
</body>
</html>