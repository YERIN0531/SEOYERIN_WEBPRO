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
	<!-- Student String학번, 이름, int 학년, char 반(radio), int 점수(number)) -->
  <!-- String sno, String name, int grade, char cla, int score -->
	<jsp:useBean id="s" class="com.lec.ex.Student" scope="request"/>
	<h2>입력된 학생 정보</h2>
	<p>학번 : <jsp:getProperty property="sno" name="s"/></p>
	<p>이름 : <jsp:getProperty property="name" name="s"/></p>
	<p>학년 : <jsp:getProperty property="grade" name="s"/> 학년</p>
	<p>반 : <jsp:getProperty property="cla" name="s"/> 반</p>
	<p>점수 : <jsp:getProperty property="score" name="s"/> 점</p>
</body>
</html>