<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
</head>
<body>
<%-- 지시자(<%@ %> : 페이지 속성  --%>
<%-- 스크립트릿(<% %> : 자바코드 --%>
<%-- 선언부(<%! %>) : 변수, 함수 --%>
<%
	long result = power(2,3);
%>
<p>2의 3승은 <%=result %>입니다</p>
<p>9의 11승은 <%=power(9,11) %>입니다</p> <!-- 표현식 안에는 세미콜론 쓰지말기 -->
	<%!
	private long power(int a, int b){//jsp선언부 : a의 b승을 return할 power 함수 선언
		long temp = 1; //long형을 return한다고 했으니 long형 변수 하나 주기
		for(int i = 1; i<=b; i++){
			temp *= a;
		}
		return temp;
	}
	
	%>
</body>
</html>