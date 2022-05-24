<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <% String conPath = request.getContextPath(); %>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
	body{
	text-align:center;
	}
	h3{
	color:red;
	}
	</style>
</head>
<body>
	<%
		int su = (int)(Math.random()*3);		
		int btn =Integer.parseInt(request.getParameter("btn")); 
		if(btn==su){
			out.print("<h3>정답입니다</h3>");
			out.print("동전이 있던 곳은" + su +"<br>");	
		
		}else{
			String msg = "Wrong! Try Again! (" + btn + "은 아니고 정답은 " + su + ")";
			msg = URLEncoder.encode(msg,"utf-8");
			response.sendRedirect("ex.jsp?msg=" + msg);
		}
	%>
		<button onclick = "history.go(-1);">다시도전</button>
</body>
</html>