<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String conPath = request.getContextPath(); %>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
	#wrap{
	width:300px;
	hegiht:1000px;
	border:2px solid blue;
	margin : 0 auto;
	padding: 30px;
	}
	#wrap button{
	margin-left:50px;
	border:3px solid blue;
	height:40px;
	
	}
	#msg{
	color:red;}
	</style>
</head>
<body>
	<div id=wrap>
	<h3>동전이 있는 곳을 맞춰봐</h3>
	<hr>
	<button name=btn onclick="location.href='exPro.jsp?btn=1'" value="1">1번</button>
	<button name=btn onclick="location.href='exPro.jsp?btn=2'" value="2">2번</button>
	<button name=btn onclick="location.href='exPro.jsp?btn=3'" value="3">3번</button>
	
	<div id="msg">
	<%
 		String msg = request.getParameter("msg");
			if(msg!=null){
				out.print("<h2>"+msg+"</h2>");
			}
	%>	
	</div>
	</div>
</body>
</html>