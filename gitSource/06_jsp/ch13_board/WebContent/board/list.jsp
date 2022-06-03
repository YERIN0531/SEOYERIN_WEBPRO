<%@page import="com.lec.dto.BoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.lec.dao.BoardDao"%>
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
	<table>
		<caption>게시판</caption>
		<tr><td><a href="<%=conPath %>/board/writeForm.jsp">글쓰기</a></td></tr>
	</table>
	<table>
		<tr><th>글번호</th><th>작성자</th><th>글제목</th><th>메일</th><th>조회수</th></tr>
		<%
		BoardDao dao = BoardDao.getInstance();
		int totalCnt = dao.getBoardTotalCnt();
		if(totalCnt ==0){
			out.println("<tr><td colspan='5'>등록된 글이 없습니다</td></tr>");
		}else{
			ArrayList<BoardDto> dtos = dao.listBoard();
			for(BoardDto dto : dtos){
				// 글번호, 작성자, 
				out.println("<tr><td>" + dto.getNum() + "</td><td>" + dto.getWriter()+"</td>");
				// 글제목 <td><img src ='/ch13_board/img/hot.gif'><a href ='content.jsp'>글제목</a></td>
				out.println("<td class='left'>");
				if(dto.getReadcount() > 10){
					out.println("<img src='" + conPath +"/img/hot.gif'>");
				}
				out.println("<a href='" + conPath + "/board/content.jsp?num="+dto.getNum()+"'>" + dto.getSubject() +"</a></td>");
				// 메일, 조회수
				out.println("<td>" + (dto.getEmail()!=null ? dto.getEmail() : "")
						+"</td><td>"+dto.getReadcount() + "</td></tr>");
			}
		}
		%>
	</table>
</body>
</html>