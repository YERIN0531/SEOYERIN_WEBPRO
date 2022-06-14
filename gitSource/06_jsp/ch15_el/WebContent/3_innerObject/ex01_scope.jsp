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
		<form action="ex02_scope.jsp">
		<p>이름<input type="text" name="name"></p>
		<p>ID<input type="text" name="id"></p>
		<p><input type="submit"></p>
		<!--  여기서 submit을 실행하면  페이지가 넘어가고 새로운 url을 받아오게 되니 request가 새로 생성되면서 페이지 속성과 request속성은 사라짐  -->
		<!--  url 창에 아까랑 다른 url 이 생기면 새로운 request가 생긴것  -->
		<!--  이게 싫으면 foward 하면 됨  -->
	</form>
	
	<%
		//이 페이지를 벗어나면 없어지는 속성
		pageContext.setAttribute("pageName","pageValue");
		//새로운 request객체를 생성하기 전까지 유효 
		request.setAttribute("requestName", "requestValue");
		//브라우저를 닫기전까지 유효
		session.setAttribute("sessionName", "sessionValue");
		//메모리에서 이 어플리케이션이 사라지기전까지 유효(톰캣을 껏다 키기 전까지)
		application.setAttribute("applicationName", "applicationName");
		// 자바에서 forward하는 법 
		// forward할 객체가 필요함 (dispatcher)
		// 1. 객체 생성
		RequestDispatcher dispatcher = request.getRequestDispatcher("ex02_scope.jsp?name=kim&id=aaa");
		// 2. forward 실행 
		dispatcher.forward(request, response);
	%>
	
	<jsp:forward page="ex02_scope.jsp"/> <!-- 실행하면 얘가 바로 나오게 됨  -->
	<h3>페이지 내 속성 변수 값 : <%=pageContext.getAttribute("pageName") %></h3>
	<h3>request 내 속성 변수 값 : <%=request.getAttribute("requestName") %></h3>
	<h3>session 내 속성 변수 값 : <%=session.getAttribute("sessionName") %></h3>
	<h3>application 내 속성 변수 값 : <%=application.getAttribute("applicationName") %></h3>
	

	<hr>
	
	<h3>페이지 내 속성변수 값: ${pageScope.pageName }</h3>
	<h3>request 내속성변수 값: ${requestScope.requestName }</h3>
	<h3>session 내 속성변수 값: ${sessionScope.sessionName }</h3>
	<h3>application 속성변수 값: ${applicationScope.applicationName }</h3>
	
	<hr>
	<h3>페이지 내 속성변수 값: ${pageName }</h3>
	<h3>request 내속성변수 값: ${requestName }</h3>
	<h3>session 내 속성변수 값: ${sessionName }</h3>
	<h3>application 속성변수 값: ${applicationName }</h3>
</body>
</html>