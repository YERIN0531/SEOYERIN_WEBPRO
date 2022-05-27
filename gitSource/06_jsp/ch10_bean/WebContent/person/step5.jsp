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
<!-- 위에다가 써줘도 됨. 자동완성 잘 안되니까 body에다가 쓰는거임 -->
<!-- property는 class에 있는 속성변수 , param은 input에 쓴 name 말하는 것  -->
<jsp:useBean id="p" class="com.lec.ex.Person" scope="request"/>
<jsp:setProperty property="name" name="p" param="name"/>	
<!-- age자동으로 Integer.parsint해서 들어감 -->
<jsp:setProperty property="age" name="p" param="age"/>
<!-- gender charAT안해줘도 자동으로 문자열 변환해서 들어가게됨  -->	
<jsp:setProperty property="gender" name="p" param="gender"/>	
<jsp:setProperty property="address" name="p" param="address"/>
<jsp:forward page="pView.jsp"/>	
</body>
</html>