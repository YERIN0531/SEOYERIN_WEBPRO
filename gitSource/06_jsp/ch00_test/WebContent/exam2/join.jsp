<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="join.css" rel = "stylesheet">
	  <script> 
  function chkJoinInfo(){
	  
	  if(frm.name.value<2){
		  alert('이름은 두글자 이상을 입력하세요');
		  return false;
	  }
	  if(frm.pw.value!=frm.pwChk.value){
		  alert('비밀번호가 일치하지 않습니다');
		  frm.pw.value='';
		  frm.pwChk.value='';
		  frm.pw.focus();
		  return false;
	  }
	  var hobbyCnt = 0;
	  for(var i=0; i<frm.hobby.length; i++){
		  if(frm.hobby[i].checked){
			  hobbyCnt ++;
		  }//if
	  }//for
	  if(!hobbyCnt){
		  alert('취미를 하나이상 선택하세요');
		  return false;
	  }
	  
	  var mailSendcnt=0;
	  for(var j=0; j<frm.mailSend.length; j++){
		  if(frm.mailSend[j].selected){
			  mailSendcnt ++;
		  }
	  }
	  if(!mailSendcnt){
		  alert('메일수신방법을 하나 이상 선택하세요');
		  return false;
	  }
  }
  </script>
</head>
<body>
	<div id=joinForm_wrap>
	<form name="frm" action="joinPro.jsp" method="post" onsubmit="return chkJoinInfo()">
		<div id="join_title">회원가입</div>
		<input type="hidden" name="hiddenParam" value="보이지 않을 뿐 전달되는 값">
		<table>
		<tr>
		<th><label for="name">이름 </label></th>
		<td><input type="text" name="name" id="name" class="name"></td>
		</tr>
		
		<tr>
		<th><label for="id">아이디 </label></th>
		<td><input type="text" name="id" id="id" class="id"></td>
		</tr>
		
		<tr>
		<th><label for="pw">비밀번호 </label></th>
		<td><input type="password" name="pw" id="pw" class="pw" required="required"></td>
		</tr>
		
		<tr>
		<th><label for="pwChk">비밀번호확인 </label></th>
		<td><input type="password" name="pwChk" id="pwChk" class="pwChk"></td>
		</tr>
		
		<tr>
		<th><label for="birth">이름 </label></th>
		<td><input type="date" name="birth" id="birth" class="birth" required="required"></td>
		</tr>
		
		<tr>
		<th>취미</th>
		<td>
				<input type="checkbox" name="hobby" value="독서" id="reading">독서
				<input type="checkbox" name="hobby" value="요리" id="cooking">요리
				<input type="checkbox" name="hobby" value="운동" id="exercising">운동
				<input type="checkbox" name="hobby" value="취침" id="sleeping">취침
		</td>
		</tr>
		
		<tr>
		<th>성별</th>
		<td>
		<input type="radio" name="gender" id="m" value="m"><label for='m' checked="checked">남자</label>
		<input type="radio" name="gender" id="f" value="f"><label for='f'>여자</label>		
		</td>
		</tr>
		
		<tr>
		<th><label for="email">이메일</label></th>
		<td><input type="email" name="email" id="email" class="email" required="required"></td>
		</tr>
				
		<tr>
		<th>메일수신</th>
		<td>
			<select name="mailSend" class="mailSend" size="3">
				<option value="광고">광고</option>
				<option value="배송">배송</option>
				<option value="공지">공지</option>
			</select>
		</td>
		</tr>		
		<tr>
		</tr>
		<tr>
		<td colspan="2">
		<input type="submit" value="가입하기" class="joinBtn_style">
		<input type="reset" value="다시하기" class="joinBtn_style">
		<input type="button" value="뒤로하기" class="joinBtn_style" onclick="history.back()">
		</td>
		</tr>
		</table>
	</form>
</div>
	
	<%@ include file="footer.jsp" %>
</body>
</html>