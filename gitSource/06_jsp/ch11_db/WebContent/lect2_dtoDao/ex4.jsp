<%@page import="com.lec.dto.EmpDTO"%>
<%@page import="com.lec.dao.EmpDAO"%>
<%@page import="java.util.ArrayList"%>
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
	//파라미터 먼저 받자
	 String searchName = request.getParameter("searchName");
	if(searchName == null){ //searchName이 null이면 searchName을 빈스트링으로 만들어라 
		searchName = ""; 
	}
	%>
	<form action="">
	<p>이름 
	<input type="text" name="searchName" value="<%=searchName.toUpperCase()%>">
	<input type="submit" value="검색">
	</p>
	</form>
	<table>
	<%
		EmpDAO dao = EmpDAO.getInstance();//dao 함수 호출하는 것 
		ArrayList<EmpDTO> emps = dao.selectSearchName(searchName);
		out.println("<tr><th>사번</th><th>이름</th><th>직책</th>" 
	               + "<th>상사사번</th><th>입사일</th><th>급여</th><th>상여</th><th>부서번호</th></tr>");
		if(!emps.isEmpty()){
			for(EmpDTO emp: emps){
				out.println("<tr><td>" +emp.getEmpno() +"</td><td>"+ emp.getEname()+"</td><td>" +
				emp.getJob() + "</td><td>" + emp.getMgr() + "</td><td>" + emp.getHiredate() +
				"</td><td>" + emp.getSal() + "</td><td>" + emp.getComm() + "</td><td>" +
				emp.getDeptno() + "</td></tr>");				
			}
			
		}else{
			out.println("<tr><td colspan='8'>해당 사원이 존재하지 않습니다</td></tr>");
		}
	%>
	</table>
</body>
</html>
