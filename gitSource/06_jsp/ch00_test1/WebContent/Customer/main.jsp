<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<%-- <link href="<%=conPath%>/css/style.css" rel="stylesheet"> --%>
		<style>
		#mainForm_wrap{
			width:430px;
			margin: 0 auto;
			height:600px;
			line-height:600px;
			text-align: center;
			font-size:2.5em;
			font-weight: bold;
			color:black;
		}
	</style>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<div id="mainForm_wrap">
		main 화면
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>