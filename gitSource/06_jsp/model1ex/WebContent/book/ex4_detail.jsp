<%@page import="com.lec.dto.BookDto"%>
<%@page import="com.lec.dao.BookDao"%>
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
	<%
		int bid = Integer.parseInt(request.getParameter("bid"));
		String pageNum = request.getParameter("pageNum");
		BookDao bDao = BookDao.getInstance();
		BookDto book = bDao.getBook(bid);
	%>
	<table>
		<tr>
			<td rowspan="4"><img src="<%=conPath%>/bookimg/<%=book.getBimage1()%>"></td>
			<th><%=book.getBid() %>번 도서 상세보기</th>
		</tr>
		<tr>
			<td><%=book.getBtitle() %></td>
		</tr>
		<tr>
			<td>
			<%if(book.getBdiscount()!=0){ %>
				<del><%=book.getBprice() %></del><br>
				<%=book.getBprice() * (100-book.getBdiscount())/100 %>원<br>
				<b><%=book.getBdiscount() %>% 할인</b>
				<%}else{ %>
					<b><%=book.getBprice()%>원</b><br>
					베스트셀러
				<%} %>
			</td>
		</tr>
		<tr>
			<td>
				<button>구매</button>
				<button onclick="location='ex3_list_productp.jsp?pageNum=<%=pageNum %>'">목록</button>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<img src="<%=conPath%>/bookimg/<%=book.getBimage2()%>"><br>
				<pre><%=book.getBcontent() %></pre>
			</td>
		</tr>
	</table>
</body>
</html>