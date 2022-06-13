<%@page import="com.lec.dto.BookDto"%>
<%@page import="com.lec.dao.BookDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%=conPath%>/css/bookstyle.css" rel="stylesheet">
</head>
<body>
	
	<jsp:include page="../main/header.jsp"/>

	<table>
	<tr>
<%
	//paging 추가 : PAGESIZE = 3;, BLOCKSIZE = 4;
	String pageNum = request.getParameter("pageNum");
	if(pageNum==null) pageNum="1";
	int currentPage = Integer.parseInt(pageNum);
	final int PAGESIZE=3, BLOCKSIZE=4;
	int startRow = (currentPage-1)*PAGESIZE +1;
	int endRow = startRow + PAGESIZE -1;
	
	BookDao bDao = BookDao.getInstance();
	ArrayList<BookDto> books = bDao.listBook(startRow, endRow);
	
	for(int i=0; i<books.size(); i++){ //어차피 books가 arraylist기 때문에 0부터 존재함
%>			
	<td>
		<!-- books의 i번째아이 가지고와 (arrayList기 떄문에 get(i)해주고 그중에서 첫번째 이미지 getBimage1()가져와 -->
		
		<!-- /*********************************************************************************************************/ -->
																						<!-- bid와  pageNum 같이 받고 넘기기 눌렀을때 상세페이지  -->
		<a href="detail.jsp?bid=<%=books.get(i).getBid()%>&pageNum=<%=pageNum%>">
		<img src = "../bookimg/<%=books.get(i).getBimage1()%>"><br>
		<%=books.get(i).getBtitle() %><br>
		</a>
		
		
		<del><%=books.get(i).getBprice() %></del><br>
		(<%=books.get(i).getBdiscount()%>할인)<br>
		<b><%=books.get(i).getBprice() * (100-books.get(i).getBdiscount())/100 %>원</b>
	</td>	
	
	<!-- 위에만 실행하면 한줄로 쭉나옴 3개씩 끊을거야  -->
<%-- 	<%if(i%3==2) out.println("</tr><tr>"); %> --%>
	
<%}%>	
</tr>
</table>
<div class="paging">
<%
	int bookTotalCnt = bDao.getBookTotCnt(); //전체 데이터 베이스에 저장된 책 개수 
	int pageCnt = (int)Math.ceil((double)bookTotalCnt/PAGESIZE);
	int startPage = ((currentPage-1)/BLOCKSIZE)*BLOCKSIZE +1;
	int endPage = startPage + BLOCKSIZE -1;
	if(endPage>pageCnt){
		endPage = pageCnt;
	}
	if(startPage>BLOCKSIZE){ %>
	[<a href="bookList.jsp?pageNum=<%=startPage-1 %>">이전</a>]	
<%	}
	for(int i=startPage ; i<=endPage; i++){
		if(i==currentPage){
			out.println("[<b>"+i+"</b>]");
		}else{
			out.println("[<a href='bookList.jsp?pageNum="+i+"'>"+i+"</a>]");
		}
	}
	if(endPage<pageCnt){%>
	[<a href="bookList.jsp?pageNum=<%=endPage+1 %>">다음</a>]
	
	<%}
%>
</div>
	
	<jsp:include page="../main/footer.jsp"/>

</body>
</html>














