<%@page import="com.lec.member.MemberDao"%>
<%@page import="java.sql.Timestamp"%>
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
	request.setCharacterEncoding("utf-8");
%>
	<jsp:useBean id="dto" class ="com.lec.member.MemberDto" scope="page"/>
	<jsp:setProperty property="*" name="dto"/>
<%
  String tempbirth = request.getParameter("tempbirth");
	if(!tempbirth.equals("")){
		dto.setBirth(Timestamp.valueOf(tempbirth + " 00:00:00"));
	}
	MemberDao mDao = MemberDao.getInstance();
	int result = mDao.confirmID(dto.getId());//id중복체크
	
	if(result == MemberDao.MEMBER_NONEXISTENT){//사용가능한 id
		result=mDao.joinMember(dto); //회원가입
		
		if(result==MemberDao.SUCCESS){//회원가입 성공
			session.setAttribute("id", dto.getId()); %>
			<script>
				alert('회원가입 감사합니다. 로그인 후 서비스를 이용하세요');
				location.href ='login.jsp';
			</script>	
	<% }else{//회원가입실패
  %>
			<script>
			alert('회원가입이 실패하셨습니다. 다시 시도해주세요');
			location.href='join.jsp';
			</script>
	<%}
	}else{//중복된 id
%>
	<script>
	alert('중복된 ID입니다. 다른 아이디를 사용하세요');
	history.back();
	</script>
<% 		
	}
%>	
</body>
</html>