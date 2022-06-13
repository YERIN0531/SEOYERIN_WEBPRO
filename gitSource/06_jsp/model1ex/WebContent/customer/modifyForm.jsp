<%@page import="java.sql.Date"%>
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
<%! String cid, cpw, cname, ctel, cemail, caddress, cgender; Date cbirth; %>
<%
	CustomerDto customer = (CustomerDto)session.getAttribute("customer");
	if(customer==null){
		response.sendRedirect("loginForm.jsp");
	}else{
		cid = customer.getCid();
		cpw = customer.getCpw();
		cname = customer.getCname();
		ctel = customer.getCtel();
		cemail = customer.getCemail();
		cbirth = customer.getCbirth();
		caddress = customer.getCaddress();
	}
%>	
	<jsp:include page="../main/header.jsp"/>
	<div id="joinForm_wrap">
		<form action="modifyPro.jsp" method="post">
			<div id="join_title">정보수정</div><br>
			<table>
				<tr>
					<th><label for="cid">아이디</label></th>
					<td><input type="text" name="cid" id="cid" value="<%=cid%>" readonly="readonly"></td>
				</tr>
				<tr>
					<th><label for="cpw">현비밀번호</label></th>
					<td><input type="password" name="oldPw" id="cpw" required="required"></td>
				</tr>
				<tr>
					<th><label for="cpw">새비밀번호확인</label></th>
					<td><input type="password" name="cpw" id="cpwChk" ></td>
				</tr>
				<tr>
					<th><label for="cname">이름</label></th>
					<td><input type="text" name="cname" id="cname" value="<%=cname %>" required="required"></td>
				</tr>
				<tr>
					<th><label for="ctel">전화</label></th>
					<td>
						<input type="tel" name="ctel" id="ctel" value="<%=ctel %>" required="required" value="010-">
					</td>
				</tr>
				<tr>
					<th><label for="cemail">이메일</label></th>
					<td><input type="email" name="cemail" id="cemail" value="<%=cemail!=null? cemail : ""%>"></td>
				</tr>
				<tr>
					<th><label for="caddress">주소</label></th>
					<td><input type="text" name="caddress" id="caddress" value="<%=caddress!=null? caddress : ""%>"></td>
				</tr>
				<tr>
					<th><label for="cbirth">생년월일</label></th>
					<td><input type="date" name="tempbirth" id="cbirth" required="required" value="<%
					if(cbirth!=null){
						out.print(cbirth.toString());
					}
					%>"></td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<%if("m".equals(cgender)){%>
							<input type="radio" name="cgender" value="m" checked="checked" id="m"><label for="m">남자</label>
							<input type="radio" name="cgender" value="f" id="f"><label for="f">여자</label>
						<%}else{%>
							<input type="radio" name="cgender" value="m" id="m"><label for="m">남자</label>
							<input type="radio" name="cgender" value="f" checked="checked" id="f"><label for="f">여자</label>
						<%} %>
					</td>
				</tr>
				<tr>
					<td colspan="2"> </td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="수정하기" class="joinBtn_style">
						<input type="reset" value="다시하기" class="joinBtn_style">
						<input type="button" value="이전으로" class="joinBtn_style" 
											onclick="history.back()'">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>