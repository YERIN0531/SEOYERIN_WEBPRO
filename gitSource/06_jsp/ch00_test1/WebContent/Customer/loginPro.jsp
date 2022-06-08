<%@page import="java.net.URLEncoder"%>
<%@page import="com.lec.dto.CustomerDto"%>
<%@page import="com.lec.dao.CustomerDao"%>
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
		String cid = request.getParameter("cid");
		String cpw = request.getParameter("cpw");
		CustomerDao cDao = CustomerDao.getInstance();
		int result = cDao.loginCheck(cid,cpw);
		if(result==CustomerDao.LOGIN_SUCCESS){//로그인 성공
			CustomerDto customer = cDao.getCustomer(cid);
			session.setAttribute("customer", customer);	
			response.sendRedirect("main.jsp");
		}else{ //비밀번호 오류 %>
			<script>
				alert("아이디와 비밀번호를 확인하세요");
				<%
				String msg = URLEncoder.encode("id와 pw를 체크하세요","utf-8");
				response.sendRedirect("login.jsp?msg="+msg);
				%>
			</script>
			
		<%}%>
	
</body>
</html>