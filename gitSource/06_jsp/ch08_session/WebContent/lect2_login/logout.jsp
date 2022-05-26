<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%=conPath %>/css/style.css" rel="stylesheet">
</head>
<body>
	<%// 로그인 상태 : id, name session 속성이 있을 것
		// name 의 유무만 봐도 됨. 왜? id는 회원가입에서 들어온걸수도 있으니까
		String name = (String)session.getAttribute("name");
	if(name!=null){
		//로그인 된 상태니 로그아웃 가능함 
		/*이렇게 따로따로 해도 되지만 invalidate()활용하여 싹다 지워도 됨 
		session.removeAttribute("id");
		session.removeAttribute("name"); */
		session.invalidate();
		out.println("<h2>성공적으로 로그아웃되었습니다.</h2>");
	}else{
		out.println("<h2>로그인 상태가 아닙니다<h2>");
	}
	%>
	<button onclick = "location.href='login.jsp'">로그인</button>
	<button onclick = "location.href='sessionTest.jsp'">세션 들어다 보기</button>
</body>
</html>