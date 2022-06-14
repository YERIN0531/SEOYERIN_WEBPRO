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
<jsp:useBean id="member" class="com.lec.ex.Member"/>
<jsp:setProperty property="*" name="member"/>
<h2>bean태그를 이용한 정보 출력</h2>
<h3>이름 : <jsp:getProperty property="name" name="member"/></h3>	
<h3>ID : <jsp:getProperty property="id" name="member"/></h3>	
<h3>PW : <jsp:getProperty property="pw" name="member"/></h3>	

<h2>표현식 이용한 정보 출력</h2>
<h3>이름 : <%=member.getName() %></h3>	
<h3>ID : <%=member.getId() %></h3>	
<h3>PW : <%=member.getPw() %></h3>	

<h2>EL표기법 이용한 정보 출력</h2>
<h3>이름 : ${ member.name }</h3>	
<h3>ID : ${ member.id }</h3>	
<h3>PW : ${ member.pw }</h3>	
</body>
</html>