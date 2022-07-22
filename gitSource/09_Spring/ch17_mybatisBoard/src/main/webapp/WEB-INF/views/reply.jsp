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
	<form action="${conPath }/reply.do" method="post">
		<input type="hidden" name="pageNum" value="${param.pageNum }">
		<input type="hidden" name="bgroup" value="${boardDto.bgroup }">
		<input type="hidden" name="bstep" value="${boardDto.bstep }">
		<input type="hidden" name="bindent" value="${boardDto.bindent }">
		<input type="hidden" name="bid" value="${boardDto.bid}">
		<table>
			<caption>${param.bid }번 글의 답글 쓰기</caption>
			<tr><th>작성자</th><td><input type="text" name="bname" required="required"></td></tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="btitle" required="required" 
															value="[답]${boardDto.btitle }"></td>
			</tr>
			<tr><th>분문</th><td><textarea rows="5" cols="20" name="bcontent"></textarea></td></tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="답글쓰기" class="btn">
					<input type="reset" value="초기화" class="btn">
					<input type="button" value="목록" 
						onclick="location='${conPath}/boardList.do?pageNum=${param.pageNum }'" class="btn">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>