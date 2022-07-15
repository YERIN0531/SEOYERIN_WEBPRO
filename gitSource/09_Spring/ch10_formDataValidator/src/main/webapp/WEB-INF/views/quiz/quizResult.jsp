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
</head>
<body>
	
	<h2>"현재 총${cnt }명" </h2>
	<h2>결과는 다음과 같습니다</h2>
	<h4>이름 : ${student2.name }</h4>
	<h4>국어 : ${student2.kor }</h4>
	<h4>영어 : ${student2.eng }</h4>
	<h4>수학 : ${student2.mat }</h4>
	<h4>총점 : ${student2.kor+student2.eng+student2.mat}</h4>
	<h4>평균 : 
		<fmt:formatNumber value="${(student2.kor+student2.eng+student2.mat)/3.0 }" pattern="##.##"/>
	</h4>

	<button onclick="history.back()">이전</button>
	<button onclick="location.href='${conPath}/quizInput.do'">새로</button>
</body>
</html>