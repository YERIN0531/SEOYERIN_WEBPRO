<%@page import="com.lec.dao.CustomerDao"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
		<%request.setCharacterEncoding("utf-8");%>
	<jsp:useBean id="dto" class="com.lec.dto.CustomerDto"/>
	<jsp:setProperty property="*" name="dto"/>
<%
	String tempbirth = request.getParameter("tempbirth");
	dto.setCbirth(Date.valueOf(tempbirth));
	CustomerDao cDao = CustomerDao.getInstance();
	int result = cDao.confirmCid(dto.getCid());
	if(result == CustomerDao.CUSTOMER_NONEXISTENT){ // 사용가능한(없는) ID
		result = cDao.insertCustomer(dto);
		if(result ==CustomerDao.SUCCESS){
			session.setAttribute("cid", dto.getCid());
%>		<script>
				alert('회원가입 감사합니다. 로그인 이후에 서비스를 이용하세요');
				location.href='loginForm.jsp';
			</script>	
<%	}else{%>
			<script>
				alert('회원가입이 실패되었습니다. 너무 긴 데이터는 가입 불가합니다. 다시 가입해 주세요');
				history.back();
			</script>		
<%		}
	}else{ // 사용불가(중복된) ID
%>	<script>
			alert('중복된 ID입니다. 다른 아이디를 사용하세요');
			history.back();
		</script>	
<%}%>
</body>
</html>