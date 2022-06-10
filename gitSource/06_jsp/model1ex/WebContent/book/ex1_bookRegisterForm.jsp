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
	<!-- 빈태그 안쓸거라 input name과 필드명 일치 안해도 됨 -->
	<form action="ex2_bookRegisterPro.jsp" method="post" enctype="multipart/form-data">
		<table>
			<caption><strong>책 등 록</strong></caption>
			<tr>
			<th>책제목</th>
			<!-- 33이 넘어가면 submit이 안일어남 -->
			<td><input type="text" name ="btitle" maxlength="33" required="required"></td> 
			</tr>
			
			<tr>
			<th>책가격</th>
			<td><input type="number" name ="bprice" min="0" max="9999999" required="required"></td> 
			</tr>
			
			<tr>
			<th>책이미지</th>
			<td><input type="file" name ="bimage1"></td> <!-- 어차피 빈태그 안쓸거라 그냥 이름 같게 해도됨 file은 빈이 못읽음 -->
			</tr>
			
			<tr>
			<th>책이미지</th>
			<td><input type="file" name ="bimage2"></td> 
			</tr>
			
			<tr>
			<th>책소개</th>
			<td>
				<textarea rows="5" cols="5" name="bcontent"></textarea>
			</td> 
			</tr>
			
			<tr>
			<th>할인율</th>
			<td><input type="number" name ="bdiscount" min="0" max="100" value="0" required="required"></td> 
			</tr>
			
			<tr>
			<td colspan="2">
				<input type="submit" value="책등록" class='btn'>
			</td>
			</tr>
		</table>
	</form>	
</body>
</html>