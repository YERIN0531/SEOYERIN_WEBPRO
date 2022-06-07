<%@page import="com.lec.dto.BoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.lec.dao.BoardDao"%>
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
		<caption>게시판</caption>
		<tr><td><a href="<%=conPath %>/board/writeForm.jsp">글쓰기</a></td></tr>
	</table>
	<table>
		<tr><th>글번호</th><th>작성자</th><th>글제목</th><th>메일</th><th>조회수</th></tr>
		<%
		/************************************************************************/
		
		//list.jsp 또는 list.jsp?pageNum=11 또는 list.jsp?pageNum=1
		//pageNum 을 통해 startRow와 endRow 뽑고, 몇번째 블럭에 있는지 가늠하고, 밑에 페이지가 몇부터몇까지 나와야 하는지 파악하자
		final int PAGESIZE = 10, BLOCKSIZE =10;
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null){//list.jsp그냥 들어왔다는 얘기 
			pageNum = "1";//전달받은 pageNum 파라미터가없으면 1페이로 셋팅 하겠다는 뜻 
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*PAGESIZE + 1;
		int endRow = startRow + PAGESIZE -1;
		
		/************************************************************************/	
		
		BoardDao dao = BoardDao.getInstance();
		int totalCnt = dao.getBoardTotalCnt(); //DB에 저장된 글 갯수 
		if(totalCnt ==0){
			out.println("<tr><td colspan='5'>등록된 글이 없습니다</td></tr>");
		}else{
			ArrayList<BoardDto> dtos = dao.listBoard(startRow,endRow);/****************************/
			for(BoardDto dto : dtos){
				// 글번호, 작성자, 
				out.println("<tr><td>" + dto.getNum() + "</td><td>" + dto.getWriter()+"</td>");
				// 글제목 <td><img src ='/ch13_board/img/hot.gif'><a href ='content.jsp'>글제목</a></td>
				out.println("<td class='left'>");
				if(dto.getReadcount() > 10){
					out.println("<img src='" + conPath +"/img/hot.gif'>");
				}
				//<a href="content.jsp?num=글번호&pageNum=현페이지수">글제목</a>
				out.println("<a href='" + conPath + "/board/content.jsp?num="+dto.getNum()+"&pageNum="+pageNum+"'>" + dto.getSubject() +"</a></td>");
				// 메일, 조회수
				out.println("<td>" + (dto.getEmail()!=null ? dto.getEmail() : "")
						+"</td><td>"+dto.getReadcount() + "</td></tr>");
			}
		}
		%>
	</table>
	<div class="paging"> <!-- 여기 나오는 애들은 이제부터 가운데 정렬. css 위해서 div와 class 잡아줌 -->
	<%
		//math.ceil의 return값은 double이니 int로 형변환 한번 더 
		int pageCnt = (int)Math.ceil((double)totalCnt/PAGESIZE);
		int startPage = ((currentPage - 1)/BLOCKSIZE)*BLOCKSIZE +1;
		int endPage =startPage+BLOCKSIZE -1;
		if(endPage>pageCnt){
			endPage = pageCnt;
		}
		
		if(startPage>BLOCKSIZE){ //이전 블럭이 있는지 여부 <a href='list.jsp?pageNum=10'>이전</a> //index.jsp를 썼으면 list.jsp앞에 <%=conPath>해줘야됨
			out.println("[ <a href='list.jsp?pageNum=1'>맨앞</a> ]");
				out.println("[ <a href='list.jsp?pageNum="+(startPage-1)+"'>이전</a> ]");
		}
		for(int i = startPage ; i<=endPage ; i++){
			if(i==currentPage){//i가 currentPage랑 같으면 a 태그 뺀 페이지수만출력(빨간색 글씨로)<b>2</b>
				out.println("<b>["+i+"]</b>");
			}else{ //a태그를 포함한 페이지수 출력 <a href='list.jsp?pageNum=10'>10</a> 
				out.println("[<a href='list.jsp?pageNum="+i+"'>"+i+"</a>]");
			}
		}
			if(endPage < pageCnt){//다음 블록이 있는지 여부 <a href='list.jsp?pageNum=다음블록첫페이지'>다음</a>
				out.println("[<a href='list.jsp?pageNum="+(endPage+1)+"'>다음</a>]");
				out.println("[<a href='list.jsp?pageNum="+(startPage*pageCnt)+"'>맨뒤</a>]");
			}
	%>
	</div>	
</body>
</html>














