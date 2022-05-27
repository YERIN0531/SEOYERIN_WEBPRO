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
		<jsp:useBean id="p" class="com.lec.ex.Person" scope="request"/>
		<!-- *치면 속성변수와 param이 같은걸 다 뽑아줌  -->
		<jsp:setProperty name="p" property="*"/>
		<jsp:forward page="pView.jsp"/>
</body>
</html>


































