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
	<!-- useBean : 나는 빈을 사용할거야 라는 뜻 id는 객체 생성할때 이름 쓰듯이 쓰면 됨 -->
	<!-- 객체의 이름이 p고 객체의 타입이 Person인 아이 만듦 step1의 Person p = newPerson();과 비슷 -->
	<!-- 얘는 자동으로 매개변수 없는 생성자 함수 호출하기 때문에 class에서 꼭 매개변수 없는 생성자 만들어주자 -->
	<!-- scope : 디폴트 값이 page임. p라는 빈 객체는 이 페이지에서만 유효하다는 뜻  -->
	<!-- scope : request 하면 새로운 request 객체가 만들어 지는 것  ******다시 물어보기-->
	<jsp:useBean class="com.lec.ex.Person" id="p" scope="page"/>
	
	<!-- set을 호출하는 아이 property:는 name(속성변수이름) 이고, name은 p(객체이름)  -->
	<jsp:setProperty name="p" property="name" value='<%=request.getParameter("name") %>' />
	<jsp:setProperty name="p" property="age" value='<%=Integer.parseInt(request.getParameter("age")) %>' />
	<jsp:setProperty name="p" property="gender" value='<%=request.getParameter("gender").charAt(0) %>' />
	<jsp:setProperty name="p" property="address" value='<%=request.getParameter("address")%>' />

	<h2>입력받은 개인정보</h2>
	<p>이름 : <jsp:getProperty property="name" name="p"/></p>
	<p>나이 : <jsp:getProperty property="age" name="p"/></p>
	<p>성별 : <jsp:getProperty property="gender" name="p"/></p>
	<p>주소 : <jsp:getProperty property="address" name="p"/></p>
</body>
</html>