<%@page import="com.lec.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%// idConfirm.jsp?mId = aaa
 	String mid = request.getParameter("mid");
 	MemberDao dao = MemberDao.getInstance();
 	int result = dao.confirmId(mid);
 	if(result == MemberDao.MEMBER_EXISTENT){
		 out.println("중복된 아이디 입니다");
 	}else{
	 	 out.println("사용 가능한 ID입니다"); 
 	}
%>
</body>
</html>