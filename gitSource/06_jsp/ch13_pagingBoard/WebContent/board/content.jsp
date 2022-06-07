<%@page import="com.lec.dto.BoardDto"%>
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
	<%
		int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
		//뿌리기 전에 조회수 올려야함 
		BoardDao dao= BoardDao.getInstance();
		dao.readCountUp(num); //조회수 올리기 hit up
		BoardDto dto = dao.getBoardOneLine(num);
		%>
		<table>
		<caption><%=dto.getNum() %>번 글 상세보기</caption>
		<tr><th>글번호</th><td><%=dto.getNum() %></td></tr>
		<tr><th>글제목</th><td><%=dto.getSubject() %></td></tr>
		<tr><th>이메일</th><td><%=dto.getEmail()==null?"":dto.getEmail() %></td></tr>
		<tr><th>조회수</th><td><%=dto.getReadcount() %></td></tr>
		<tr><th>본문</th><td><pre><%=dto.getContent() %></pre></td></tr> <!--\n을 반영못하니 <pre>달아주기 -->
		<tr><th>IP</th><td><%=dto.getIp()%></td></tr> 
		<tr><th>글쓴시점</th><td><%=dto.getRdate()%></td></tr>
		<tr>
		<td colspan="2">
			<button onclick="location.href ='updateForm.jsp?num=<%=num %>&pageNum=<%=pageNum%>'">수정</button>
			<button onclick="location.href ='deleteForm.jsp?num=<%=num%>&pageNum=<%=pageNum%>'">삭제</button>
			<button>답변</button>
			<button onclick ="location.href='list.jsp?pageNum=<%=pageNum%>'">목록</button>
		</td>
		</tr> 
		
		</table>
</body>
</html>