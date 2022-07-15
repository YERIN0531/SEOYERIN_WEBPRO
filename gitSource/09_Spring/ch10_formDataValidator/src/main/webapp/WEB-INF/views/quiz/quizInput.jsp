<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<form action="${conPath }/quizInput.do" method="post">
		<table>
			<caption>개인 정보 입력</caption>
		 <tr>
		 	<td>이름 : </td>
		 	<td><input type="text" name="name" value="${student2.name }"></td>
		 </tr>
		 <tr>
		 	<td>국어 </td>
		 	<td><input type="number" name="kor" value="${student2.kor }"></td>
		 </tr>
		 <tr>
		 	<td>영어 : </td>
		 	<td><input type="number" name="eng" value="${student2.eng }"></td>
		 </tr>
		 <tr>
		 	<td>수학 : </td>
		 	<td><input type="number" name="mat" value="${student2.mat }"></td>
		 </tr>		
		 <tr><td colspan="2"><input type="submit" value="입력"></td></tr>
		</table>
	</form>
		<h4>${nameError }</h4>
	<h4>${scoreError }</h4>
</body>
</html>