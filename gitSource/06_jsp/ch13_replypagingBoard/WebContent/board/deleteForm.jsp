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
	<%String num = request.getParameter("num"); 
	String pageNum = request.getParameter("pageNum");
	%>
	<table>
		<caption><%=num %>번 글 삭제</caption>
		<tr>
		<td>
		<fieldset>
			<legend>삭제를 위한 암호가 일치하여야 합니다</legend>
				<form action="deletePro.jsp" method="post">
				<input type="hidden" name ="pageNum" value="<%=pageNum%>">
				<input type="hidden" name="num" value="<%=num %>">
				<p>암호<input type="password" name="pw" required="required" class="btn"></p>
				<p>
				<input type="submit" value="삭제" class="btn">
				<input type="reset" value="삭제취소" class="btn" onclick="history.back()">
				</p>
			
				</form>
		</fieldset>
		</td>
		</tr>
	</table>
</body>
</html>