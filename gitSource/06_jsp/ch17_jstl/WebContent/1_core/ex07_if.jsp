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
<!-- 얘는 if문 else문이 없음  -->
<c:if test="${1+2 eq 3 }">
	1+2는 3입니다<br>
</c:if>
<c:if test="${1+2 != 3 }" var="result" scope="page">
	 두번째 if 조건에 대한 결과는 ${result }입니다
</c:if>

<%-- 
 	if(1+2==3){
 		out.println("1+2는 3입니다");
 	}else{
 		out.println("1+2는 3이 아닙니다");
 	}
	 --%>
</body>
</html>