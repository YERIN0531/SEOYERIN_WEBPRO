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
<form action="update.do" method="post">
		<input type="hidden" name= "bid" value="${boardDto.bid }">
		<input type="hidden" name= "pageNum" value="${param.pageNum }">
		<table>
			<caption>${boardDto.bid }번 글 정보 수정</caption>
			<tr><th>글쓴이</th><td><input type="text" name="bname" value="${boardDto.bname }"></td></tr>
			<tr><th>글제목</th><td><input type="text" name="btitle" value="${boardDto.btitle }"></td></tr>
			<tr><th>글본문</th><td><input type="text" name="bcontent" value="${boardDto.bcontent }"></td></tr>
			<tr>
				<th>입사일</th>
				<td><input type="date" name="bdate" value="${boardDto.bdate}"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정" class="btn">
					<input type="button" value="목록" class="btn"
					onclick="locaion='boardList.do?pageNum=${param.pageNum }'">
				</td>
			</tr>			
		</table>
	</form>
</body>
</html>