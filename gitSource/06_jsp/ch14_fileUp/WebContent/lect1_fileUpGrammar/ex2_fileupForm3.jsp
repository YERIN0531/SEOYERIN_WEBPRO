<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%=conPath%>/css/style.css" rel="stylesheet">
</head>
<body>
	<!-- 파일 첨부할땐 post로 해야 넘어감  -->
	<form action="ex2_frileupPro3.jsp" method="post" enctype="multipart/form-data">
		<p>파일1<input type="file" name="file1"></p>
		<p>파일2<input type="file" name="file2"></p>
		<p>파일3<input type="file" name="file3"></p>
		<input type="submit" value="파일업로드" class="btn">
	</form>
</body>
</html>