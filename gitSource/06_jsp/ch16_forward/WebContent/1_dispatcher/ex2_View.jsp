<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%=conPath%>/css/style.css" rel="stylesheet">
</head>
<body>
	<h2>ex2_view.jsp 파일입니다</h2>
	<h2>회원정보</h2>
	<h3>ID : ${member.id }</h3>
	<h3>PW : ${member.pw }</h3>
	<h3>등록일 : ${member.rdate }</h3>
	<button onclick="history.go(-1)">이전</button>
	<hr>
	<!-- parma은 , initparam(모든 프로젝트에서 쓸 수 있는 내장객체), paramValues  -->
	<h3>넘어온 파라미터 ID : ${param.id }</h3>
	<h3>넘어온 파라미터 PW : ${param.pw }</h3>
	<button onclick ="history.go(-1)">이전</button>
</body>
</html>