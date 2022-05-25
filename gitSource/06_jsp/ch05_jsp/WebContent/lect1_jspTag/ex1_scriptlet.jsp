<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//스크립트릿을 활용하여 자바코드 부분에 color라는 name을 불러와서 로직을 짜는 것 
//파라미터를 불러와야 body안에 color에 <%=color를 사용 가능.
	String color = request.getParameter("color");
	if(color==null){
		color = "white";
	}
//request라는 아이가 그냥 jsp안에서 존재하는 내부객체기 때문에 이렇게 쓸 수 있음 
//맨처음 시작하면 color엔 null이 들어가있을 것 .
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
	/* 위에서 받은 color parameter를 사용 */
	body{ background-color: <%=color%>;}
	</style>
	
</head>
<body>
	<h1>배경색 바꾸기</h1>
	<!-- 다른페이지로 가는 것 말고, 현재 홈페이지가 변하는 것으로 만들것  -->
	<form action="">
	<select name="color">
		<option value="red">빨강</option>
		<option value="orange">주황</option>
		<option value="yellow">노랑</option>
		<option value="green">초록</option>
		<option value="blue">파랑</option>
		<option value="navy">남색</option>
		<option value="purple">보라</option>
	</select>
	<input type="submit" value="적용">
	</form>
</body>
</html>