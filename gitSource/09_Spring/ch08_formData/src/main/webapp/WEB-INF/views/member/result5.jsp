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
	<h2>모든 요청에서 cnt, list 출력 가능</h2>
	<h3>cnt : ${cnt }</h3>
	<h3>list : ${list }</h3>
	<h2> result5.jsp 페이지 넘어온 개인 정보</h2>
	<h4>이름 : ${memberDto.name }</h4>
	<h4>아이디 : ${memberDto.id }</h4>
	<h4>비밀번호 : ${memberDto.pw }</h4>
	<h4>나이 : ${memberDto.age }</h4>
	<h4>이메일 : ${memberDto.email }</h4>
	<h4>주소 : ${memberDto.address }</h4>
	<button onclick="history.back()">뒤로가기</button>
	<button onclick="location.href='${conPath }/'">처음으로</button>
</body>
</html>