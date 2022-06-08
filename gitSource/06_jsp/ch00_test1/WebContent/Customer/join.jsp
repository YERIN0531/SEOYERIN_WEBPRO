<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%=conPath%>/css/join.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="header.jsp"/>
	<div id="joinForm_wrap">
	<form action="joinPro.jsp" method="post">
		<table>
			<caption>회원가입</caption>
			<tr>
			<th>아이디</th>
			<td><input type="text" name="cid"></td>
			</tr>
			<tr>
			<th>비밀번호</th>
			<td><input type="password" name="cpw"></td>
			</tr>
			<tr>
			<th>비밀번호확인</th>
			<td><input type="password" name="cpwChk"></td>
			</tr>
			<tr>
			<th>이름</th>
			<td><input type="text" name="cname"></td>
			</tr>
			<tr>
			<th>전화</th>
			<td><input type="text" name="ctel"></td>
			</tr>
			<tr>
			<th>이메일</th>
			<td><input type="email" name="cmail"></td>
			</tr>
			<tr>
			<th>주소</th>
			<td><input type="text" name="caddress"></td>
			</tr>
			<tr>
			<th>생년월일</th>
			<td><input type="date" name="tempbirth"></td>
			</tr>
			<tr>
			<th>성별</th>
			<td>
			<input type="radio" name="cgender" value='m' class='btn'>남자
			<input type="radio" name="cgender" value='f' class='btn'>여자
			</td>
			</tr>
			<tr>
		<td colspan="2">
			<input type="submit" value="가입하기" class ='btn'>
			<input type="reset" value="다시하기" class ='btn'>
			<input type="button" value="로그인" onclick="location.href='login.jsp'" class ='btn'>
		</td>
		</tr>
		</table>
	</form>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>