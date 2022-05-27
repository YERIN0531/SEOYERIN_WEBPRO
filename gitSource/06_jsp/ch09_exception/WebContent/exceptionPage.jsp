<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>    
<% response.setStatus(200); //response의 (상태)status를 500이 아니라 200이라고 생각해!-임의적으로 200으로 만들어놓은것 %>
<%-- 200 : 정상상태 
		 500 : 문법오류나 예외사항이 발생한 경우
		 400 : 해당문서를 찾을 수 없을 때 
		 407 : 인증을 받지 못한 경우 
--%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script>
		consol.log('예외 메세지 : ' + '<%=exception.getMessage()%>');
		consol.log('예외타입 : ' + '<%=exception.getClass().getName()%>');
		//exception은 내부객체지만 그냥 쓸 순 없고, 이 페이지가 예외처리 홈페이지야  라는걸 알려줘야함 
	</script>
</head>
<body>
	<h1>공사중입니다. 0으로 나누는 부분은 아직 처리되지 않습니다</h1>
	<h6>문의 주시면 감사하겠습니다 mail 주소 추가</h6>
	<%
	System.out.println("예외 메세지 : " + exception.getMessage());
	System.out.println("예외 타입 : " + exception.getClass().getName());
	%>
</body>
</html>