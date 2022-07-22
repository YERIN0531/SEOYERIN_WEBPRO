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
	<!--  혹시나 서브밋 버튼 눌러서  -->
	<c:if test="not empty updateResult">
		<script>alert('${updateResult}');</script>
	</c:if>

	<form action="update.do" method="post">
		<input type="hidden" name= "empno" value="${empDto.empno }">
		<input type="hidden" name= "pageNum" value="${param.pageNum }">
		<table>
			<caption>${empDto.empno }번 사원 정보 수정</caption>
			<tr><th>이름</th><td><input type="text" name="ename" value="${empDto.ename }"></td></tr>
			<tr><th>직책</th><td><input type="text" name="job" value="${empDto.job }"></td></tr>
			<tr><th>상사사번</th><td><input type="text" name="mgr" value="${empDto.mgr }"></td></tr>
			<tr>
				<th>입사일</th>
				<td><input type="date" name="hiredate" value="${empDto.hiredate}"></td>
			</tr>
			<tr>
				<th>급여</th>
				<td><input type="number" name="sal" value="${empDto.sal }"></td>
			</tr>
			<tr>
				<th>상여</th>
				<td><input type="number" name="comm" value="${empDto.comm }"></td>
			</tr>
			<tr>
				<th>부서번호</th>
				<td><input type="number" name="deptno" value="${empDto.deptno }"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정" class="btn">
					<input type="button" value="목록" class="btn"
					onclick="locaion='empDeptList.do?pageNum=${param.pageNum }'">
				</td>
			</tr>			
		</table>
	</form>
</body>
</html>












