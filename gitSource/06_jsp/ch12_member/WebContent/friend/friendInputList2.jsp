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
	<script>
	function search(){
	var name =	frm.name.value;
	var tel  = frm.tel.value;
	location.href = 'friendInputList2.jsp?name='+name+'&tel='+tel;
	} 
	</script>
</head>
<body>
	<%
	//파라미터 먼저 받자
	 String name	= request.getParameter("name");
	String tel  = request.getParameter("tel");
	%>
	<form action="friendInputListPro2.jsp" method="get" name='frm'>
		친구이름 <input type="text" name="name" value="<% 
         if(name!=null) out.print(name);
      %>">
		전화 <input type="text" name="tel"value="<% 
         if(tel!=null) out.print(tel);
      %>">
		<input type="button" value="검색" onclick="search()">
		<input type="submit" value="추가">
	</form>
	<table>
	 <%
	 	FriendDao fDao = FriendDao.getInstance(); //dao 가져오고 
	 	ArrayList<FriendDto> fdto = fDao.searchFriend(name,tel); //name과 tel이 빈스트링이면 select ALl 
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
	 <table>
	 <caption>전체결과</caption>
	<% 	
	  ArrayList<FriendDto> dto =fDao.getFriend();
 	 	out.println("<tr><th>순번</th><th>이름</th><th>전화</th></tr>");
		if(!dto.isEmpty()){
			for(FriendDto dtos: dto){
				out.println("<tr><td>" +dtos.getNum() +"</td><td>"+ dtos.getName()+"</td><td>" +
				dtos.getTel() + "</td></tr>");				
			}
			
		}else{
			out.println("<tr><td colspan='3'>해당 친구가 존재하지 않습니다</td></tr>");
		}
	  
	 
	 %>
	</table>
</body>
</html>