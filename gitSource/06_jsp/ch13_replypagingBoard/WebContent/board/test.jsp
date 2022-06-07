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
<a href="xx.jsp">xx</a>
<%-- <%
	request.setCharacterEncoding("utf-8");
	BoardDao bDao = BoardDao.getInstance();
	
	out.println("<h2>1. DB 글갯수 : " + bDao.getBoardTotalCnt() + "개입니다</h2>");
	
	out.println("<h2>2. DB 글목록 출력 </h2>");
	ArrayList<BoardDto> bDto = bDao.listBoard();
	for(BoardDto b : bDto){
		out.println(b + "<br>");
	}
	
	out.println("<h2>3. DB 글쓰기 </h2>");
	BoardDto dto = new BoardDto(0,"서예린","글제목","본문\n입니다","seo@s.com",0,"1",0,0,0,"127.0.0.2",null); 
	int result = bDao.inserBoard(dto);
	out.println(result == BoardDao.SUCCESS ? "글쓰기 성공" : "글쓰기 실패");
	
	out.println("<h2>4와5. 조회수 올리고 DB 글번호로 글(DTO) 가져오기 </h2>");
	bDao.readCountUp(3); //7번글 조회수 올리는 로직 
	dto = bDao.getBoardOneLine(3);
	out.println(dto);
	
	out.println("수정전의 7번 글 " + dto);
	out.println("<h2>6.7번글 수정하기 </h2>");
	
	dto.setSubject("바뀐 제목 xxxx");
	dto.setContent("바뀐 본문 yyyy");
	
	result = bDao.updateBoard(dto);
	if(result == BoardDao.SUCCESS){
		dto = bDao.getBoardOneLine(7);
		out.println("수정후의 7번 글 : " + dto);
	}else{
		out.println("수정 실패");
	}
	
	out.println("<h2>7.글삭제하기</h2>");
	result = bDao.deleteBoard(1, "1");
	out.print(result ==BoardDao.FAIL ? "비번틀려 못지워" : "삭제성공");
	result = bDao.deleteBoard(7, "1");
	out.print(result ==BoardDao.FAIL ? "비번틀려 못지워" : "삭제성공");
	
%>	 --%>
</body>              
</html>
















