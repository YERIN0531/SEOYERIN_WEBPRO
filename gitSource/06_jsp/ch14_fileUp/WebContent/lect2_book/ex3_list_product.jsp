<%@page import="com.lec.book.BookDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.lec.book.BookDao"%>
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
	<table>
	<tr>
<%
	BookDao bDao = BookDao.getInstance();
	ArrayList<BookDto> books = bDao.listBook();
	for(int i=0; i<books.size(); i++){ //어차피 books가 arraylist기 때문에 0부터 존재함
%>			
	<td>
		<!-- books의 i번째아이 가지고와 (arrayList기 떄문에 get(i)해주고 그중에서 첫번째 이미지 getBimage1()가져와 -->
		<img src = "../bookimg/<%=books.get(i).getBimage1()%>"><br>
		<%=books.get(i).getBtitle() %><br>
		<del><%=books.get(i).getBprice() %></del><br>
		(<%=books.get(i).getBdiscount()%>할인)<br>
		<b><%=books.get(i).getBprice() * (100-books.get(i).getBdiscount())/100 %>원</b>
	</td>	
	
	<!-- 위에만 실행하면 한줄로 쭉나옴 3개씩 끊을거야  -->
	<%if(i%3==2) out.println("</tr><tr>"); %>
	
<%}%>	
</tr>
</table>
</body>
</html>







