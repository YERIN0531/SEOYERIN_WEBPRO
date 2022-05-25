<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%=conPath %>/css/login.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="loginForm_wrap">
		<div id="login_title">로그인</div>
		<form action="loginPro.jsp" method="post">
			<table>
				<tr>
					<th><label for="id">아이디</label></th>
					<td><input type="text" name="id" id="id" required="required" autofocus="autofocus"></td>
				</tr>
				<tr>
					<th><label for="pw">비밀번호</label></th>
					<td><input type="password" name="pw" id="pw" required="required"></td>
				</tr>
				<tr>
				<td colspan="2">
					<input type="submit" value = "로그인" class="loginBtn_style">
				</td>
				</tr>
				<tr>
				<td colspan="2">
					<%
						String msg = request.getParameter("msg");
							if(msg!=null){%>
						<p id="login_findIdPw" onclick="alert('아이디는 aaa/pw는111');">
							아이디/비밀번호를 잊으셨나요?
						</p>
					<%			
							}
					%>
				</td>
				</tr>
			</table>
			<p id="login_join">아직 회원이 아니신가요? <a href="<%=conPath %>/member/join.jsp">회원가입</a></p>
		</form>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>