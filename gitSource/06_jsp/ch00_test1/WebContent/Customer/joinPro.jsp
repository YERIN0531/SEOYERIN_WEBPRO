<%@page import="com.lec.dao.CustomerDao"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%=conPath%>/css/join.css" rel="stylesheet">
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
	CustomerDao cDao = CustomerDao.getInstance();
	int result= cDao.confirmId(dto.getCid()); //중복체크 

	if(result == CustomerDao.CUSTOMER_NONEXIST){//사용가능 
		result=cDao.joinCustomer(dto);

	if(result == CustomerDao.SUCCESS){//회원가입 성공
			session.setAttribute("cid", dto.getCid()); %>
			<script>
			alert('회원가입 감사합니다. 로그인 이후에 서비스를 이용하세요');
			location.href='login.jsp';
			</script>
	<%	}else{//회원가입 실패 %>
			<script>
			alert('회원가입이 실패되었습니다. 너무 긴 데이터는 가입 불가합니다. 다시 가입해 주세요');
			location.href='join.jsp';
			</script>		
<%}
}else{ //아이디 사용 불가능 
	%>	
	<script>
	alert('아이디가 중복되었습니다');
	history.back();
	</script>
	<% }%>
</body>
</html>