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
</head>
<body>
<%
	// 인위적으로 게시판에 70개 올려놓기 (원글 insert)
	BoardDao dao = BoardDao.getInstance();
	BoardDto dto = new BoardDto();
	// 70번 insert 돌려야하니깐 for문 돌리기
	for(int i=0 ; i<70 ; i++){//단순 출력이 아니니까 일반 포문
		dto.setWriter("홍길동" + i);
		dto.setSubject("제목" + i + "입니다");
		dto.setContent("본문입니다"+i);
		dto.setEmail("hong"+i+"@hong.com");
		dto.setPw("1");
		dto.setIp("192.168.10."+i);
 	  int result = dao.inserBoard(dto); //성공 실패 뿌리고 싶으면 int result에 담으면 됨
	  System.out.println(result==BoardDao.SUCCESS? i + "번째글쓰기성공" : i +"번째글쓰기 실패");
	}
	response.sendRedirect("list.jsp");

%>
</body>
</html>