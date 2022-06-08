<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%=conPath%>/css/footer.css" rel="stylesheet">
</head>
<body>
		<footer>
		<div class="office_logo">
			<img src="data:image/png;base64,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">
		</div>
		<div class="office_address">
			<ul>
			
				<li>서울시 XX구 XX로 000 XXX빌딩 8F | TEL : 02-999-9999 | FAX : 02-999-9998</li>
				<li>사업자등록번호 : 000-12-00000 | 통신판매업신로 : 종로 제0000호 | 대표이사 : 홍길동</li>
				<li>좋은시스템 문의 메일 : webmaster@joeun.com</li>
			</ul>
		</div>
		<div class="copyright">
			ⓒ2022 JOEUNSYSTEM.Co.,Ltd. All Rights Reserved.
		</div>
	</footer>
</body>
</html>