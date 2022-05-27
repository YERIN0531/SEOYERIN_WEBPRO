<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		#mainForm_wrap{
			width:430px;
			margin: 0 auto;
			height:600px;
			line-height:600px;
			text-align: center;
			font-size:1em;
			font-weight: bold;
			color:#A47060;
		}
	</style>
	<script>
    setTimeout(function go_url(){
             location.href="<%=conPath%>/member/main.jsp"
         },3000);  // 3초후 go_url() 함수를 호출한다.
      
	</script>
	
</head>
<body>
	<%-- <%
	Cookie[] cs = request.getCookies();
	if(cs!=null){
		for(Cookie c : cs){
			if(c.getName().equals("id")){
				c.setMaxAge(0);
				response.addCookie(c);
				break;
			}
		}
	}
	response.sendRedirect("main.jsp");
	%> --%>
	<%
	String name = (String)session.getAttribute("name");
	if(name!=null){//로그인된 상태 
		session.invalidate();%>
		
		<jsp:include page="header.jsp"/>
		<div id="mainForm_wrap">
			로그아웃되었습니다. 3초후 페이지 이동이 있겠습니다
		</div>
		<jsp:include page="footer.jsp"/>	
	
<%	}else{
		out.println("<h2>로그인 상태가 아닙니다</h2>");
	}
	%>
</body>
</html>