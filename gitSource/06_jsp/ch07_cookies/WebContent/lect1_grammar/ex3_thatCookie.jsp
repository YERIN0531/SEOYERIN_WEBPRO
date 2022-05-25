<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
	a{
	color:blue;
	text-decoration: none;
	}
	</style>
</head>
<body>
	<h1>특정 쿠키(쿠키이름이 cookieName인 쿠키) 찾아 값 확인하기</h1>
	<%
	Cookie[] cookies = request.getCookies();
	if(cookies!=null){
		int idx=0; //idx를 밖에 놓은 이유 : for 밑에서 if(idx=cookies.length)이냐 라는걸 물어보기위해 
		for(idx=0; idx<cookies.length; idx++){
			//idx번째 cookies이름이 내가 찾고자 하는 쿠키의 이름과 같은지 만약 같으면 break;
			String name = cookies[idx].getName(); //idx번째 쿠키 이름 
			if(name.equals("cookieName")){	
				//name이 동일하면 value값을 받아서 뿌리기
				String value = cookies[idx].getValue(); //idx번째 쿠키의 값
				out.println("<h2>찾고자 하는 쿠키 이름 : " + name +", 쿠키값: " + value +"</h2>");
				break;
			}//if
		}//for
		if(idx==cookies.length){
			//내가 찾고자 하는 특정쿠키가 없다라는 뜻 
			// 왜 ? cookies.length가 3이라는건 쿠키갯수가 3이라는 뜻 하지만 idx는 0부터 돌기 때문에 
		  // idx==cookies.length가 같다라는건 위에서 찾는 쿠키가 없어서 방을 다 돌고 3이 되었을때 떨어졌다라는 뜻임
			out.println("찾고자 하는 쿠키가 없습니다");
		}
			
	}else {
		out.println("생성된 쿠키가 없습니다");
	}
	
	
	
	%>
	<hr>
		<a href="ex1_cookieConstruct.jsp">쿠키생성(cookieName)</a><br>
		<a href="ex2_cookielist.jsp">쿠키들(쿠키이름-쿠키값) 리스트 확인</a><br>
		<a href="ex3_thatCookie.jsp">특정 쿠키(이름이 cookieName) 찾기</a><br>
		<a href="ex4_cookieDel.jsp">쿠키 삭제</a>
</body>
</html>