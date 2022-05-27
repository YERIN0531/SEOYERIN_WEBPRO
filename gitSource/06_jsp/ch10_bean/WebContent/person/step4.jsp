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
	<!-- 프로세스단계 -->
	<!-- 새로운 request가 만들어지기 전까지만 유효함 url창이 바뀔때 새로운 request가 만들어진거라고 본거임  -->
	<!-- 그럼 새로운 request가 안만들어지도록 다른페이지로 가야함 이 정보를 안아야 하니까 그럴떄 쓰는게 forward -->
	<jsp:useBean class="com.lec.ex.Person" id="p" scope="request"/>
	
	<!-- set을 호출하는 아이 property:는 name(속성변수이름) 이고, name은 p(객체이름)  -->
	<jsp:setProperty name="p" property="name" value='<%=request.getParameter("name") %>' />
	<jsp:setProperty name="p" property="age" value='<%=Integer.parseInt(request.getParameter("age")) %>' />
	<jsp:setProperty name="p" property="gender" value='<%=request.getParameter("gender").charAt(0) %>' />
	<jsp:setProperty name="p" property="address" value='<%=request.getParameter("address")%>' />
	
	<jsp:forward page="pView.jsp"/>
</body>
</html>