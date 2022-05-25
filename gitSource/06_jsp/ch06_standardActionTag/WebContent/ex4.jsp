<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<!-- ex4.jsp?n=1 넘겨받기 -->
	<h1>ex4.jsp 페이지 입니다</h1>
	<h2>ex3 request에서 있었던 n : <%=request.getParameter("n") %></h2>
	<h2>ex3 param태그에서 있었던 id : <%=request.getParameter("id") %></h2>
	<h2>ex3 param태그에서 있었던 pw : <%=request.getParameter("pw") %></h2>
</body>
</html>