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
	<c:set var="num" value="1234567.8"/>
<%-- 	자바에서 request.setAttribute 해서 넘어오면 사실 jsp 단에서 <c:set>을 활용하여 변수 선언을 할일이 많지 않음 --%>
	<p>num : ${num }</p>
	<p>세자리마다 , : <fmt:formatNumber value="${num }" groupingUsed="true"/>
	<p>세자리마다 , : <fmt:formatNumber value="${num }" pattern="#,###.#"/>
	<p>소수점 2자리(소수점 한자리의 경우 뒤에 0) :
		<fmt:formatNumber value="${num }" pattern="#,###.00"/>
	</p>
	<p>
		소수점 2자리(소수점 한자리의 경우 한자리):
		<fmt:formatNumber value="${num }" pattern="#,###.##"/>
	</p>
	<c:set var="num" value="3.149"/>
	<p>
		소수점 2자리(소수점 두자리 이상의 반올림):
		<fmt:formatNumber value="${num }" pattern="#,###.##"/>
	</p>
	
</body>
</html>