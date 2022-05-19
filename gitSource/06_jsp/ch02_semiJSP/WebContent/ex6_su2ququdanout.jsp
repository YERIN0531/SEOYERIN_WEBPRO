<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
	td{padding:4px;}
	p{
	text-align: center;
	}
	</style>
	<script>
	function historyBack() {
        //history.back();
        history.go(-1); //(-2하면 전전화면으로) 
    }
	</script>
	
</head>
<body>
	<%
	int su1 = Integer.parseInt(request.getParameter("su1"));
	int su2 = Integer.parseInt(request.getParameter("su2"));
	%>
	<h3><%=su1 %>단부터 <%=su2 %>단까지 구구단 출력</h3>
	<table>
	<%for(int i=1; i<=9; i++){ %>
	<tr>
		<%for(int j=su1; j<=su2; j++){ %>
		<td><%=j%> X <%=i%> = <%=j*i%></td>
		<%} %>
	</tr>
	<%} %>
</table>
<button onclick="historyBack()">뒤로가기(이전페이지로 가기)</button>
<button onclick="location.href='ex6_su2Input.html'">새로하기</button>
</body>
</html>