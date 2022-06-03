<%@page import="com.lec.dao.BoardDao"%>
<%@page import="com.lec.dto.BoardDto"%>
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
<%
	//글번호는 반드시 넘겨야 수정이됨 (파라미터로 반드시 num을 넘겨줘야됨 )
	//num을 넘기는 input이 없으면 num이 안넘겨짐-hidden해주면됨
	//작성자는 수정안해도 되기 때문에 파라미터가 안넘어가도 됨. 따라서 그냥 readonly 해주면 됨 
	String num = request.getParameter("num");
	BoardDao dao = BoardDao.getInstance();
	BoardDto dto = dao.getBoardOneLine(num); //얘를 먼저 가지고 와서 뿌린 뒤에 수정 해야 하니깐먼저 dto에 받아주기
%>
	<form action="updatePro.jsp" method="post">
	<input type="hidden" name="num" value="<%=num %>">
		<table>
			<caption><%=num %>번 글 수정</caption>
			<tr>
            <th>작성자</th>
            <td><input type="text" name="writer" value="<%= dto.getWriter() %>" readonly="readonly"></td>
            <%-- <td><%= dto.getWriter() %></td> --%>
         </tr>		
			
			<tr>
			<th>제목</th>
			<td><input type="text" name="subject" value="<%=dto.getSubject()%>" required="required"></td>
			</tr>
			
			<tr>
			<th>이메일</th>
			<td><input type="email" name="email" value="<%=dto.getEmail()!=null ? dto.getEmail() : " " %>"></td>
			</tr>
			
			<tr>
			<th>본문</th>
			<td>
				<textarea rows="5" cols="5" name="content" required="required">
				<%=dto.getContent() %>
				</textarea>
			</td>
			</tr>
			
			<tr>
			<th>비밀번호</th>
			<td>
				<input type="password" name="pw" value="<%=dto.getPw()%>" required="required">
			</td>
			</tr>
			<tr>
			<td colspan="2">
			<input type="submit" value="수정" class="btn">
			<input type="reset" value="취소" class="btn">
			<input type="button" value="목록" class="btn" onclick="locatoin.href='list.jsp'">
			</td>
			</tr>
		</table>	
	</form>	
</body>
</html>