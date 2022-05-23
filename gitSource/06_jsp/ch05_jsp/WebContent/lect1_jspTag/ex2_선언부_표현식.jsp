<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
<%
	 int j=0; //얘는 스크립트릿이기 때문에 반드시 초기화 해야해 
	 i++; j++;
	 strBuf.append("<span>♥</span>");
	 out.println("strBuf = " + strBuf + "<br>");
	 out.println("sum(5,2) = " + sum(5,2) + "<br>");
%>
 전역변수 i = <%=i %><br>
 지역변수 j = <%=j %><br>
 <%-- strBuf = <%=strBuf %> --%>
 
<%!
	int i; //선언부에 선언한 변수는 초기화 하지 않아도 0으로 초기화되기 떄문에 int i=0; 써도 되고 안써도 됨 
	StringBuffer strBuf = new StringBuffer("Good");
	public int sum(int a, int b){ //함수 선언
		return a+b;
	}
%>
</body>
</html>