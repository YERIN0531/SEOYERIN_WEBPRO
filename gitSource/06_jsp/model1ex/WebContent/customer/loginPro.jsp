<%@page import="com.lec.dto.CustomerDto"%>
<%@page import="com.lec.dao.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="../css/login.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String cid = request.getParameter("cid");
		String cpw = request.getParameter("cpw");
		CustomerDao cDao = CustomerDao.getInstance();
		int result = cDao.logincheck(cid, cpw);
		if(result == CustomerDao.LOGIN_SUCCESS){// 로그인 성공
			CustomerDto dto = cDao.getCustomer(cid);
			session.setAttribute("customer", dto);  // session에 객체 통째로 넣을 수도 있고, 따로 따로 넣을 수도 있다. 
			session.setAttribute("cid", dto.getCid());
			session.setAttribute("cpw",dto.getCpw());
			session.setAttribute("cname",dto.getCname());
			session.setAttribute("ctel", dto.getCtel());
			session.setAttribute("cemail", dto.getCemail());
			session.setAttribute("caddress",dto.getCaddress());
			session.setAttribute("cbirth", dto.getCbirth());
			session.setAttribute("cgender", dto.getCgender());
			session.setAttribute("crdate",dto.getCrdate());
			response.sendRedirect("../main/main.jsp");
		}else if(result==CustomerDao.LOGIN_FAIL){
			response.sendRedirect("login.jsp?msg=");
		}
	%>
</body>
</html>