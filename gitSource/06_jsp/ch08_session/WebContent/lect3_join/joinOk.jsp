<%@page import="java.io.PrintWriter"%>
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
	<%
	//session 속성 3개 agree 파라미터 들어와 있음 
	String agree = request.getParameter("agree");
	if(agree.equals("y")){// 약관동의한 경우(세션속성값받아 파일저장, 일부세션 날림 ->다음페이지로)
		//저장하기 위해선 세션에 저장한거 받아오기
		String id = (String)session.getAttribute("id");
		String pw = (String)session.getAttribute("pw");
		String name = (String)session.getAttribute("name");
		
		//파일저장(소스폴더의 WebContent/WEB_INF/id.txt)
		String filePath = "D:\\webPro\\SOURCE\\06_jsp\\ch08_session\\WebContent\\WEB-INF\\"+id+".txt";
		PrintWriter writer = new PrintWriter(filePath);
		writer.println("오늘은 DB에 insert 대신 파일 출력");
		writer.println("아이디 : " + id);
		writer.println("비밀번호 : " + pw);
		writer.println("이름 : " + name);
		writer.close();
		
		//세션에 아이디만 빼놓고 날리기 
		session.removeAttribute("pw");
		session.removeAttribute("name");
		// 세션의 id 속성은 유지 - 회원가입에 성공하면 id 세션을 로그인 세션에 뜨게 할거라서 
		response.sendRedirect("result.jsp?msg=success");
	}else{//약관에 동의하지 않는 경우(세션 날림->다음페이지로)
		session.invalidate(); //유효한 세션 삭제 
		response.sendRedirect("result.jsp?msg=fail");
	}
	%>
</body>
</html>



































