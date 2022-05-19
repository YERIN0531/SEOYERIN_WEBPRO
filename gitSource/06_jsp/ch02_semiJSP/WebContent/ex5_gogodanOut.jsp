<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
  <!-- 5_gogodanOut부터 실행하면 입력받은게 없기 때문에 에러남. 5_dansuInput부터 실행해야됨 -->
	<!-- 5_dansuInput에 있는 su 파라미터 받아야됨 -->
	<!-- 파라미터는 스트링으로 넘어옴(html에서 그렇게 만들어서) -->
	<%
	// 내장객체 document처럼 request이용하여 받은 파라미터값은 String
	//int su = request.getParameter("su"); - 스트링값인데 int로 넣을 수 없으니 아래처럼 형변환
	int su = Integer.parseInt(request.getParameter("su"));
	%>
	<h3><%=su %>단 구구단 출력</h3>
	<% for(int i=1; i<=9; i++){ %>
		<p><%=su%> X <%=i%> = <%=su*i%></p>
	<%} %>
	
</body>
</html>