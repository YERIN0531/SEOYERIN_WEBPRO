<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style >
		table{
		width: 300px; margin:10px auto;
		}
	</style>
</head>
<body>
	<table>
		<caption>2단 구구단</caption>
		<%for(int i=1; i<=9; i++){%>
			<tr><td>2*<%=i%> = <%=2*i%></td></tr>
		<%}%>
	</table>	
</body>
</html>