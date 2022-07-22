<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/style.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function(){

	});
	function trclicked(bid){
		// 해당 empno 사원의 상세보기 페이지 
		location.href='${conPath}/detail.do?bid='+bid + '&pageNum=${paging.currentPage}';
	}
</script>
</head>
<body>
<c:set var="num" value="${paging.startRow }"/>
<c:set var="rnum" value="${paging.totCnt - paging.startRow +1 }"/>
<table>
<caption>게시판</caption>
		<tr><td><a href="${conPath }/writeView.do">글쓰기</a></td></tr>
	</table>
	<table>
		<tr>
			<th>순번</th><th>역순</th><th>글번호</th><th>글쓴이</th><th>글제목</th><th>작성일</th><th>조회수</th>
		</tr>
		<c:if test="${totCnt eq 0 }">
			<tr><th colspan="7">등록된 글이 없습니다</th></tr>
		</c:if>
		<c:if test="${totCnt != 0 }">
			<c:forEach items="${boardList }" var="bDto">
				<tr onclick="trclicked(${bDto.bid})">
					<td>${num }</td>
					<td>${rnum }</td>
					<td>${bDto.bid }</td>
					<td>${bDto.bname }</td>
					<td class="left">
						<c:forEach var="i" begin="1" end="${bDto.bindent }">
						 	<c:if test="${i == bDto.bindent }">
						 		└─
						 	</c:if>
						 	<c:if test="${i != bDto.bindent }">
						 		&nbsp; &nbsp; &nbsp; 
						 	</c:if>
						</c:forEach>
						${bDto.btitle }
					</td>
					<td>
						<fmt:formatDate value="${bDto.bdate }" pattern="yy/MM/dd(E) hh:mm:ss(a)"/><%-- <br>
  					<fmt:formatDate value="${bDto.date }" pattern="yy/MM/dd(E) hh:mm:ss(a)"/> --%>
					</td>
					<td>
						<fmt:formatNumber value="${bDto.bhit }" groupingUsed="true"/>
					</td>
				</tr>
				<c:set var="num" value="${num +1 }"/>
				<c:set var="rnum" value="${rnum - 1 }"/>
			</c:forEach>
		</c:if>
	</table>
	<div id="paging">
		<c:if test="${paging.startPage > paging.blockSize }">
			[ <a href="${conPath }/boardList.do?pageNum=${paging.startPage-1}">이전</a>]
		</c:if>
		<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
			<c:if test="${i eq paging.currentPage }">
				[<b>${i }</b>]
			</c:if>
			<c:if test="${i != paging.currentPage }">
				[<a href="${conPath }/boardList.do?pageNum=${i }">${i }</a>]
			</c:if>				
		</c:forEach>
		<c:if test="${paging.endPage < paging.pageCnt }">
			[ <a href="${conPath }/boardList.do?pageNum=${paging.endPage+1 }">다음</a>]
		</c:if>
	</div>

</body>
</html>