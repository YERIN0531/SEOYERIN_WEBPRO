<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
<%-- JSP주석 --%>
<!-- HTML주석 -->
<!-- 스크립트리 : 자바의 영역 -->
<%
 Date now = new Date(); //데이트 객체 생성
 String str = String.format("%1$TY년 %1$Tm월 %1$Td일 %1$TH시 %1$TM분", now);
 Calendar now2 = Calendar.getInstance();//싱글톤패턴은 new Carendar 못해
 																				//싱글톤패턴은 getInstance로 객체생성
 SimpleDateFormat sdf = new SimpleDateFormat("yy년 MM월 dd일은 좋은 날입니다");
 String str2 = sdf.format(now2.getTime());
%>
<%=str%><br>
<%=str2%>	
</body>
</html>