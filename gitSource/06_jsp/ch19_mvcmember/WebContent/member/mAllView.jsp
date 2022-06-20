<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/style.css" rel="stylesheet">
</head>
<body>
	<table>
		<caption>전체회원보기</caption>
		<tr>
			<c:forEach var="member" items="${memberView }">
			<td>
			<img src="${conPath }/memberPhotoUp/${member.mphoto }"><br>
			${member.mname }<br>(${member.mid })
			</td>
			</c:forEach>
		
		</tr>
	</table>
	<div class="paging">
		<c:if test="${startPage>BLOCKSIZE }">
			[<a href="${conPath }/mAllView.do?pageNum=${startPage-1}">이전</a>]
		</c:if>
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			
			<c:if test="${i eq pageNum }">
				[<b> ${i } </b>]
			</c:if>
			
			<c:if test="${i != pageNum }">
				[ <a href="${conPath }/mAllView.do?pageNum=${i}">${i }</a>]
			</c:if>
		 </c:forEach>
		 
		 <c:if test="${endPage<pageCnt }">
			[<a href="${conPath }/mAllView.do?pageNum=${endPage+1}">다음</a>]
		</c:if>
	</div>
</body>
</html>