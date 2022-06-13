<%@page import="com.lec.dto.FileboardDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.lec.dao.FileboardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%=conPath%>/css/style.css" rel="stylesheet">
	<style>
		#content_form{
			height: 570px; 
			padding-top:30px;
		}
	</style>
	
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="content_form">
	<table>
		<tr><td colspan="7">
			<%//로그인이 된 상태여야 글쓰기 버튼이 보이게 하도록 하기위해 추가하는 로직 
				if(session.getAttribute("customer")!=null){%>
				<a href="fboardWriteForm.jsp">글쓰기</a>
			<% }%>
		</td></tr>
		<tr>
		<th>글번호</th>
		<th>작성자</th>
		<th>글제목</th>
		<th>메일</th>
		<th>IP</th>
		<th>작성일</th>
		<th>조회수</th>
		</tr>
		<% // fboardList.jsp 또는 fboardList.jsp?pageNum=2
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null) pageNum="1";
		int currentPage = Integer.parseInt(pageNum);
		final int PAGESIZE =10, BLOCKSIZE = 10;
		int startRow = (currentPage-1)*PAGESIZE +1;
		int endRow = startRow + PAGESIZE -1;
		
		//DAO 받아오기 
		FileboardDao fDao = FileboardDao.getInstance();
		ArrayList<FileboardDto> dtos = fDao.listBoard(startRow, endRow);
		if(dtos.isEmpty()){
			out.println("<tr><td colspan='7'>글이 없습니다</td></tr>");
		}else{
			for(FileboardDto dto : dtos){
		%>
			<!-- 글번호, 작성자, 글제목, 메일, IP, 작성일, 조회수 -->
			<tr>
			<td><%=dto.getFnum() %></td>
			<td><%=dto.getCname() %></td>
			<td class="left">
			<%if(dto.getFre_level()>0){%>
				<img src="<%=conPath %>/img/level.gif" width="<%=dto.getFre_level()*20%>"
									height="10">
				<img src="<%=conPath %>/img/re.gif">
			<%} %>
			<%if(dto.getFhit()>10) {%>
				<img src="<%=conPath %>/img/hot.gif">
			<%} %>
			<a href="fboardContent.jsp?fnum=<%=dto.getFnum()%>&pageNum=<%=pageNum%>">
			<%=dto.getFsubject() %></a>
			<%if(dto.getFfilename()!=null){ %>
			<img src="<%=conPath %>/img/fileup.jpg" height="10">
			<%} %>
			
			</td>
			<td><%=dto.getCemail()==null? " - " : dto.getCemail() %></td>
			<td><%=dto.getFip() %></td>
			<td><%=dto.getFrdate() %></td>
			<td><%=dto.getFhit() %></td>
			</tr>	
	<% 
		}
	}
	%>
	</table>
		<div class="paging">
		<%
		int totCnt = fDao.getBoardTotalcnt();
		int pageCnt = (int)Math.ceil((double)totCnt/PAGESIZE);//페이지수
		int startpage = ((currentPage-1)/BLOCKSIZE) * BLOCKSIZE +1;
		int endpage = startpage + BLOCKSIZE -1;
		if(endpage>pageCnt){
			endpage = pageCnt;
		}
		if(startpage>BLOCKSIZE){%>
			[<a href="<%=conPath %>/fileboard/fboardList.jsp?pagenum=<%=startpage-1%>">이전블럭</a>];
		<% }
		for(int i= startpage; i<=endpage; i++){
			if(i==currentPage){
				out.println("[<b>"+i+"</b>]");
			}else{
				out.println("<a href='"+conPath+"/fileboard/fboardList.jsp?pageNum="+i+"'>"+i+"</a>");
			}
		}
		if(endpage<pageCnt){%>
			[<a href="<%=conPath %>/fileboard/fboardList.jsp?pageNum=<%=endpage+1%>">다음블럭</a>];
		<%}
		%>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>