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
	<!-- 보통 프로세스엔 자바로직이 들어가고 뷰단에는 뿌리는 것만 만듦 -->
	<!-- 뷰 -->
	<!-- 하지만 내가 만들어놓은걸 나열은 해줘야됨 따라서 내가 step4에 생성해놓은 애 한번더 불러야됨 -->
	<jsp:useBean id="p" class="com.lec.ex.Person" scope="request"/>
	<h2>입력된 개인정보</h2>
	<p>이름 : <jsp:getProperty property="name" name="p"/></p>
	<p>나이 : <jsp:getProperty property="age" name="p"/></p>
	<p>성별 : <jsp:getProperty property="gender" name="p"/></p>
	<p>주소 : <jsp:getProperty property="address" name="p"/></p>
</body>
</html>