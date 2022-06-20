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
	<c:if test="${not empty loginResult }">
		<script>
			alert('${loginResult}');
		</script>
	</c:if>
	<c:if test="${not empty loginerror }">
		<script>
			alert('${loginerror}');
			history.back();
		</script>
	</c:if>  
	
	<c:if test="${modifyResult eq 1}">
		<script>
			alert('수정이 완료되었습니다');
		</script>
	</c:if> 

	<c:if test="${not empty member}">
		<h2>${member.mname }(${member.mid })님 어서오세요</h2>
		<hr>
	<input type="button" value="정보수정" onclick="location='${conPath}/modifyView.do'">
	<input type="button" value="로그아웃" onclick="location='${conPath}/logout.do'">
	<input type="button" value="전체회원보기" onclick="location='${conPath}/mAllView.do'">	
	</c:if>
	<c:if test="${empty member }">
		<h2>로그인 상태가 아닙니다</h2>
		<hr>
		<input type="button" value="로그인" onclick="location='${conPath}/loginView.do'">
	<input type="button" value="회원가입" onclick="location='${conPath}/joinView.do'">
	<input type="button" value="전체회원보기" onclick="location='${conPath}/mAllView.do'">
	</c:if>
	
</body>
</html>