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
	<!--  ${requestScope.joinResult}가 있을수도 있고, 없을수도 있고 -->
	<c:if test="${not empty joinResult }">
		<script>
			alert('${joinResult}');
		</script>
	</c:if>
	<!--  ${requestScope.joinErrorMsg}가 있을수도 있고, 없을수도 있고 -->
	<c:if test="${not empty joinErrorMsg }">
		<script>
			alert('${joinErrorMsg}');
			history.back();
		</script>
	</c:if> 	

	
		
	<form action="${conPath }/login.do" method="post">
		<table>
			<tr><th>ID</th><td><input type="text" name="mid" value="${mid }" required="required"></td></tr>
			<tr><th>PW</th><td><input type="password" name="mpw" required="required"></td></tr>
			<tr>
				<td colspan="2">
				 <input type="submit" value="로그인">
				 <input type="button" value="회원가입" onclick = "location='${conPath}/joinCiew.do'">
				</td>
			</tr>
		</table>
	</form>

	<!--  ${sessionScope.mid}가 있을수도 있고, 없을수도 있고(request에 넣은게 없으면 null이지만 여기선 null일경우엔 뿌리고 아닐경우엔 뿌리지말아라 이럴필요가 없음  -->

</body>
</html>