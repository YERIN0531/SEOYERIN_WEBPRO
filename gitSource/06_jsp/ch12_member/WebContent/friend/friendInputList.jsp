<%@page import="com.lec.friend.FriendDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.lec.friend.FriendDao"%>
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
	 String name	= request.getParameter("name");
	if(name == null){ //searchName이 null이면 searchName을 빈스트링으로 만들어라 
		name = ""; 
	}
	%>
	<form action="friendInputListPro.jsp" method="post">
		친구이름 <input type="text" name="name">
		전화 <input type="text" name="tel">
		<input type="submit" value="추가">
	</form>
	<table>
	 <%
	 	FriendDao fDao = FriendDao.getInstance(); //dao 가져오고 
	 	ArrayList<FriendDto> fdto = fDao.getFriend();
	 	out.println("<tr><th>순번</th><th>이름</th><th>전화</th></tr>");
		if(!fdto.isEmpty()){
			for(FriendDto fdtos: fdto){
				out.println("<tr><td>" +fdtos.getNum() +"</td><td>"+ fdtos.getName()+"</td><td>" +
				fdtos.getTel() + "</td></tr>");				
			}
			
		}else{
			out.println("<tr><td colspan='3'>해당 친구가 존재하지 않습니다</td></tr>");
		}
	 
	 
	 %>
	</table>
</body>
</html>