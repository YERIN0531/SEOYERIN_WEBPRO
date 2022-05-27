<%@page import="com.lec.ex.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<%
		//p라는 변수는 이 페이지에서만 유효함. 이게 step1의 치명적인 단점
		//이걸계속 가지고 있으려면 session에다가 해야함 
		Person p = new Person(); //매개변수 없는 생성자 호출
		p.setName(request.getParameter("name"));
		p.setAge(Integer.parseInt(request.getParameter("age")));
		p.setGender(request.getParameter("gender").charAt(0));
		p.setAddress(request.getParameter("address"));
	%>
	<h2>입력받은 개인정보</h2>
	<p>이름 : <%=p.getName() %></p>
	<p>나이 : <%=p.getAge() %></p>
	<p>성별 : <%=p.getGender() %></p>
	<p>주소 : <%=p.getAddress() %></p>
</body>
</html>