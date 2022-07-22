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
</script>
</head>
<body>
<table>
		<caption>글정보</caption>
		<tr><th>글번호</th><td>${boardDto.bid }</td></tr>
		<tr><th>글쓴이</th><td>${boardDto.bname }</td></tr>
		<tr><th>글제목</th><td>${boardDto.btitle }</td></tr>
		<tr><th>글본문</th><td>${boardDto.bcontent }</td></tr>
		<tr>
		<th>작성일</th>
		<td><fmt:formatDate value="${boardDto.bdate }" pattern="yy년MM월dd일(E)"/></td>
		</tr>
		<tr>
			<td colspan="2">
				<button onclick="location.href='boardList.do?pageNum=${param.pageNum}'">목록</button>
				<button onclick="location.href='updateView.do?bid=${boardDto.bid }&pageNum=${param.pageNum}'">수정</button>
				<button onclick="location.href='delete.do?bid=${boardDto.bid }&pageNum=${param.pageNum}'">삭제</button>
				<button onclick="location.href='replyView.do?bid=${boardDto.bid }&pageNum=${param.pageNum}'">답글</button>
			</td>
		</tr>
	</table>
</body>
</html>