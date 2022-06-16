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
	<c:set var="SUCCESS" value="1"/>
	<c:set var="FAIL" value="0"/>
	<c:if test="${joinResult eq SUCCCESS }">
		<script>alert('회원가입성공');</script>
	</c:if>
	<c:if test="${joinResult eq FAIL }">
		<script>alert('회원가입실패');</script>
	</c:if>
	
	<table>
		<tr>
		<th>번호</th>
		<th>ID</th>
		<th>PW</th>
		<th>이름</th>
		<th>생일</th>
		<th>가입일</th>
		</tr>
		
		<c:if test="${memberList.size() eq 0 }">
			<tr>
				<th colspan="6">가입한 회원이 없습니다</th>
			</tr>
		</c:if>
		
		<c:if test="${memberList.size() !=0 }">
			<c:set var="i" value="1"/>
			<c:forEach var="member" items="${memberList }">
				<tr>
				<td>${i }</td>
				<td>${member.id }</td>
				<td>${member.pw }</td>
				<td>${member.name }</td>
				<td>
				<fmt:formatDate value="${member.birth }" pattern="MM월 dd일"/>
				</td>
				<td>${member.rdate }</td>
				</tr>
				<c:set var="i" value="${i+1 }"/>
			</c:forEach>
		</c:if>
	</table>	
	<h2><a href="${conPath }/memberJoin_veiw.do">회원가입</a></h2>
</body>
</html>













