<%@page import="com.lec.dao.CustomerDao"%>
<%@page import="com.lec.dto.CustomerDto"%>
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
	<%request.setCharacterEncoding("utf-8"); %>
	<jsp:useBean id="dto" class="com.lec.dto.CustomerDto" scope="page"/>
	<jsp:setProperty property="*" name="dto"/>
	<%
	String tempbirth = request.getParameter("tempbirth");
	if(!tempbirth.equals("")){
		dto.setCbirth(Timestamp.valueOf(tempbirth + " 00:00:00"));
	}
	CustomerDto customer = (CustomerDto)session.getAttribute("customer");
	String sessionpw = null;
	if(customer!=null){
		sessionpw = customer.getCpw();
	}
	String oldPw = request.getParameter("oldPw");
	if(oldPw.equals(sessionpw)){//비번 맞음
		if(dto.getCpw()==null){
			dto.setCpw(sessionpw);
		}
	CustomerDao cDao = CustomerDao.getInstance();
	int result = cDao.modifyCustomer(dto);
		if(result == CustomerDao.SUCCESS){//수정성공
			session.setAttribute("customer", dto);
		}
		%>
		<script>
		alert('회원정보 수정이 완료되었습니다');
		location.href='main.jsp';
		</script>
		<% 
	}else{
		%>
		<script>
		 alert('현비밀번호가 바르지 않습니다. 확인하세요');
		 history.back();
		</script>
		
		<% 
	}
	
%>



</body>
</html>