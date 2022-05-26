<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); 
	// 회원가입을 할때도 id를 추가하고, 로그인에 성공해도 id를 추가할거기 때문에 구별을 하기 위해 로그인시 name을 확인하는 것 
	 if(session.getAttribute("name")!=null){//로그인화면은 로그아웃한 사람이나 로그인 안한사람만 볼 수 있도록 셋팅
		 response.sendRedirect("welcome.jsp");
	 }	
	 //로그인을 했냐 안했냐의 판가름은 id에 aa넣고, name에 홍 넣을건데, 로그인 한 사람은 id와 name의 attribute 있을거고
	 //회원가입을 하면 id attribute만 추가할거임 
	 //로그인이 성공하면 name 과 id attribute 추가할 거임 
	 //session에 name attribute가 있으면 로그인 성공한거, session에 attribute가 없으면 로그인 안한거
	 	
	 //여기 로직은 msg 받는 처리(loginOk에 만들어놓은 msg);
		String msg = request.getParameter("msg");
%>
<%if(msg!=null){ %>
	<script>
	alert('<%=msg%>');
	</script>
<%} %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%=conPath %>/css/style.css" rel="stylesheet">
</head>
<body>
<form action="loginOk.jsp" method="post">
	<table>
	
	<tr>
		<th>아이디</th>
		<td><input type="text" name="id" required="required" autofocus="autofocus" 
							 value="<%
							 	String id = (String)session.getAttribute("id");
								if(id!=null){
									out.print(id);
								}
							 %>"></td>
	</tr>
	
	<tr>
		<th>패스워드</th>
		<td><input type="password" name="pw" required="required"></td>
	</tr>
	
	<tr>
		<td colspan="2">
			<input type="submit" value="로그인">
		</td>
	</tr>
	</table>
</form>	

</body>
</html>























