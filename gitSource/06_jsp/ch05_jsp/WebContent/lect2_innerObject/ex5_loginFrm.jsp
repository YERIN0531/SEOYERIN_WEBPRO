<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
	td{
	text-align: center; padding: 5px;
	}
	#msg { color: red; text-align: center;}
	</style>
</head>
<body>
<form action="ex5_loginCertification.jsp" method="post">
	<table>
	<tr>
		<td>아이디</td>
		<td><input type="text" name="id" required="required"></td>
		</tr>
		<tr>
		<td>비밀번호</td>
		<td><input type="password" name="pw" required="required"></td>
	</tr>
	<tr>
	<td colspan="2">
	<input type="submit" value="로그인">
	</td>
	</tr>
	</table>
</form>
	
	<div id="msg">
	<%
 		String msg = request.getParameter("msg");
			if(msg!=null){
				out.print("<h2>"+msg+"</h2>");
			}
	%>	
	</div>

</body>
</html>

















