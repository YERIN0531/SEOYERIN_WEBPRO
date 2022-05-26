<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%=conPath %>/css/style.css" rel="stylesheet">
</head>
<body>
	<!-- join.jsp에서는 받아서 저장 X 저장은 다음페이지에서 할 것  -->
	<form action="agree.jsp" method="post">
	<table>
		<caption>회원가입폼</caption>
	<tr>
		<th>아이디</th>
		<td><input type="text" name="id" required="required"></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="pw" required="required"></td>
	</tr>
	<tr>
		<th>비밀확인</th>
		<td><input type="password" name="pwC" required="required"></td>
	</tr>
	<tr>
		<th>이름</th>
		<td><input type="text" name="name" required="required"></td>
	</tr>
	<tr>
		<td colspan="2">
		<!-- class=btn은 css 때문에 준거임  -->
		<input type="submit" value="가입" class="btn">
		<input type="reset" value="취소" class="btn">
		</td>
	</tr>
	</table>
	
	</form>
</body>
</html>