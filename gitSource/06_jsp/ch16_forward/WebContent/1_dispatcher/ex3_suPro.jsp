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
	<%
	
	// 뷰단과 프로세스 단을 만들지 않으면 이렇게 스크립트 안에다가 써야함 
	int su = Integer.parseInt(request.getParameter("su"));
	int sum = 0; //누적변수 만들어 주기 
	for(int i = 1; i<=su ; i++){
		sum += i;
	}
	%>
	<h2>1부터 <%=su %>까지 누적합은 <%=sum %>입니다</h2>
	
	
	
</body>
</html>