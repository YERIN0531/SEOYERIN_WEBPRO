<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%=conPath%>/css/style.css" rel="stylesheet">
</head>
<body>
	<%
	String[] names={"홍길동","김길동","신길동"};
// 	 for(String name : names){
// 		out.println("<p>"+name + "</p>");
// 	}
// 	for(int i=0; i<names.length; i++){
// 		out.println("<p>"+i+"번째 이름 : " + names[i] + "</p>");
// 	} 
	%>
	
	<!-- 변수 선언 하는 부분  -->
	<c:set var="names" value="<%=names %>"/>
	<c:forEach var="name" items="${names }">
		<p>${name }
	</c:forEach>
	
	<!-- 둘다 확장포문의 방식이지만 아래는 일반포문의 형식과 비슷함  -->
	<c:set var="idx" value="0"/> <!--  idx변수 선언  -->
	<c:forEach var="name" items="${names }">
		<p>${idx }번째 이름은 ${name }</p>
		<c:set var="idx" value="${idx+1 }"/>
	</c:forEach>
	<p>최종 idx값은 ${idx }</p>
	
</body>
</html>