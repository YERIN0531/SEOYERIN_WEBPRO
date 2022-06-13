<%@page import="com.lec.dto.FileboardDto"%>
<%@page import="com.lec.dao.FileboardDao"%>
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
	FileboardDao fbDao = FileboardDao.getInstance();
	FileboardDto dto = new FileboardDto();
	for(int i=0; i<70; i++){
		if(i%3==0){
			dto.setCid("aaa");
		}else if(i%3==1){
			dto.setCid("bbb");
		}else if(i%3==2){
			dto.setCid("ccc");
		}
		dto.setFsubject("for문으로 강제입력한 글"+i);
		dto.setFcontent("본문내용");
		if(i%5==0){
			dto.setFfilename("쿠키.docx");
		}else{
			dto.setFfilename(null);
		}
			dto.setFpw("111");
			dto.setFip("192.168.10."+i);
			fbDao.insertBoard(dto);
		}
	response.sendRedirect("fboardList.jsp");
%>	
</body>
</html>