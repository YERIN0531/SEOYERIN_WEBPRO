<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
	a{
	color:blue;
	text-decoration: none;
	}
	</style>
</head>
<body>
<%
	//쿠키 생성 - 쿠키는 객체형태. 매개변수에는 (쿠키이름,쿠키값)
	Cookie cookie = new Cookie("cookieName","cookieValue");
	
	//쿠키의 유효 시간 setMaxAge(1시간 유효한 쿠키 : 60*60)
	cookie.setMaxAge(60*60);
	
	//response에 탑재
	response.addCookie(cookie);
	///////////////////브라우저에 나오는게 아니라 파일형태로 쿠키가 들어감//////////////
%>	

	<h2>지금 막 생성된 쿠키 이름 : <%=cookie.getName() %></h2>
	<h2>지금 막 생성된 쿠키의 값 : <%=cookie.getValue() %></h2>
	<hr>
	<a href="ex1_cookieConstruct.jsp">쿠키생성(cookieName)</a><br>
	<a href="ex2_cookielist.jsp">쿠키들(쿠키이름-쿠키값) 리스트 확인</a><br>
	<a href="ex3_thatCookie.jsp">특정 쿠키(이름이 cookieName) 찾기</a><br>
	<a href="ex4_cookieDel.jsp">쿠키 삭제</a>
	
</body>
</html>





























