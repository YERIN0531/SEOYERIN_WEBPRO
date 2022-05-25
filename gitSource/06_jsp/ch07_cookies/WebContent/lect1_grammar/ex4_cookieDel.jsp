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
	<h1>특정쿠키(쿠키이름이 cookieName인 쿠키) 삭제</h1>
<%
//쿠키는 모든 쿠키를 삭제하려면 for문을 돌려야 함
//쿠키 삭제는 보통 특정 쿠키를 삭제한다는 뜻 
//쿠키 삭제는 보통 로그아웃할때 활용 
	Cookie[] cookies = request.getCookies();
if(cookies!=null){
	for(Cookie c : cookies){
		String name = c.getName();
		if(name.equals("cookieName")){
			// 쿠키 삭제 : 유효기간이 0초짜리 같은 이름의 쿠키를 만들어 덮어 씀
			Cookie cookie = new Cookie("cookieName","xxxxxx");//0초후에 사라질 아이 
			cookie.setMaxAge(0); //탑재하자마자 파괴될 아이 
			response.addCookie(cookie);
			out.println("<h3>쿠키 삭제 성공</h3>");
		}//if
	}//for
}//if
%>	
<hr>
		<a href="ex1_cookieConstruct.jsp">쿠키생성(cookieName)</a><br>
		<a href="ex2_cookielist.jsp">쿠키들(쿠키이름-쿠키값) 리스트 확인</a><br>
		<a href="ex3_thatCookie.jsp">특정 쿠키(이름이 cookieName) 찾기</a><br>
		<a href="ex4_cookieDel.jsp">쿠키 삭제</a>
</body>
</html>