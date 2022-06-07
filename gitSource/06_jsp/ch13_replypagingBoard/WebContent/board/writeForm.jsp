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
//얘가 원글인지 답변글인지 모르니까, 변수들과 dto 초기화 시켜놓기 
 	int num = 0;
 	BoardDto dto = new BoardDto(); 
 //num이라는 파라미터를 받았는데, null이면 원글이고, null이 아니면 답변글이라는 뜻 
 // list.jsp 에서 그냥 글쓰기는 매개변수 없이 썼고, content.jsp에서 글쓰기 보낼땐 num을 넣어서 보냄. 즉 num이 넘어왔으면 ㄴ답변글, 없으면 원글임
 	String pageNum = request.getParameter("pageNum"); //원글쓰기는 pageNum안들어옴. 
 	if(pageNum==null){
 		pageNum = "1"; //pageNum이 null이면 1페이지로 
 	}
 	if(request.getParameter("num")!=null){//답변글을 위해 들어왔다면 원글의 정보를 dto에 
 		 num = Integer.parseInt(request.getParameter("num"));
		 BoardDao dao = BoardDao.getInstance();
		 dto = dao.getBoardOneLine(num); //원글에 대한 정보 - ref, re_step, re_indent를 알아야해
		 //밑에 굳이 출력할 필요는 없지만 원글 글을 잘 받아온 상태인지 확인하기 위해서 쓰는 것 
		 System.out.println("writeForm.jsp에서 원글의 ref:"+dto.getRef());
		 System.out.println("writeForm.jsp에서 원글의 re_step:"+dto.getRe_step());
		 System.out.println("writeForm.jsp에서 원글의 re_indent:"+dto.getRe_indent());
 	}
 
%>
	<form action="writePro.jsp" method="post">
	<input type="hidden" name="pageNum" value="<%=pageNum %>">
	<input type="hidden" name="num" value="<%=num %>">
	<input type="hidden" name="ref" value="<%=dto.getRef()%>">
	<input type="hidden" name="re_step" value="<%=dto.getRe_step()%>">
	<input type="hidden" name="re_indent" value="<%=dto.getRe_indent()%>">
	
	<table>
		<caption>게시판</caption>
		<tr><th>작성자</th>
				<td><input type="text" name="writer" required="required"></td>
		</tr>
		<tr><th>제목</th>
				<td><input type="text" name="subject" required="required"
				value="<%
				if(dto.getSubject()!=null){ //답변글 쓰러 들어왔다는 뜻.
					out.print("답 : " + dto.getSubject());
				}
					%>"
				></td>
		</tr>
		<tr><th>이메일</th>
				<td><input type="email" name="email"></td>
		</tr>
		<tr><th>본문</th>
				<td>
				<textarea name="content" rows="5" cols="5"
					required="required"
				></textarea>
				</td>
		</tr>
		<tr><th>비밀번호</th>
				<td><input type="password" name="pw" required="required"></td>
		</tr>
		<tr>
		<td colspan="2">
			<input type="submit" value="글쓰기" class="btn">
			<input type="reset" value="취소" class="btn">
			<input type="button" value="목록" class="btn"
			onclick="location.href='list.jsp?pageNum=<%=pageNum%>'">
			</td>
		</tr>
	</table>
	</form>
</body>
</html>