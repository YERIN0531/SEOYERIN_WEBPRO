<%@page import="java.sql.Timestamp"%>
<%@page import="com.lec.dto.CustomerDto"%>
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

<%! String cid, cname, ctel, cgender, cmail, caddress; Timestamp cbirth; %>
	<% 
		CustomerDto customer = (CustomerDto)session.getAttribute("customer");
		if(customer==null){ //로그인 안된거
			response.sendRedirect("login.jsp");
		}else{
			cid 			= customer.getCid();
			cname 		= customer.getCname();
			ctel      =customer.getCtel();
			cgender 	= customer.getCgender();
			cmail 	  = customer.getCmail();
			caddress  = customer.getCaddress();
			cbirth    = customer.getCbirth();
		}
	%>	
	<jsp:include page="header.jsp"/>
	<div id="joinForm_wrap">
	<form action ="modifyPro.jsp" method="post" name="modify_frm">
		<table>
			<caption>정보수정</caption>
			<tr><th>아이디</th><td><input type="text" name="cid" value="<%=cid%>" readonly="readonly"></td></tr>
			<tr><th>현비밀번호</th>
					<td><input type="password" name="oldPw" required="required">
			</tr>
			<tr><th>새비밀번호</th>
					<td><input type="password" name="cpw"></td>
			</tr>
			<tr><th>새비밀번호확인</th>
					<td><input type="password" name="cpwChk"></td>
			</tr>
			<tr>
			<th>이름</th>
			<td><input type="text" name="cname" value="<%=cname %>" required="required"></td>
			</tr>
			<tr>
			<th>전화</th>
			<td>
				<input type="text" name="ctel" value ='<%=ctel%>' required="required">
			</td>
			</tr>
			<tr><th>이메일</th>
					<td><input type="email" name="cmail" value='<%=cmail==null?"":cmail %>'></td>
			</tr>
			<tr>
			<th>주소</th>
			<td><input type="text" name="caddress" value='<%=caddress==null?"":caddress %>'></td>
			</tr>
			<tr>
			<th>생년월일</th>
			<td><input type="date" name="tempbirth" value='<%=cbirth==null?"":cbirth.toString().substring(0,10) %>'></td>
			</tr>
			<tr>
			<th>성별</th>
			<td>
			<%if("m".equals(cgender)){ %>
				<input type="radio" name="cgender" value="m" checked="checked" class='btn'>남
				<input type="radio" name="cgender" value="f" class='btn'>여
			<%}else if("f".equals(cgender)){ %>
				<input type="radio" name="cgender" value="m" class='btn'>남
				<input type="radio" name="cgender" value="f" checked="checked" class='btn'>여
			<%}else{ %>
				<input type="radio" name="cgender" value="m" class='btn'>남
				<input type="radio" name="cgender" value="f" class='btn'>여
			<%} %>
			</td>
			</tr>
			
			<tr>
			<td colspan="2">
				<input type="submit" value="수정하기" class='btn'>
				<input type="reset" value ="다시하기" class='btn'>
				<input type="button" value="이전으로" onclick="history.back()" class='btn'>
				</td>
			</tr>
		</table>
	</form>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>