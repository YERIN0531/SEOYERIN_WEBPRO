<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
<%//특정 세션 속성값 가져오기
	String sessionName= (String)session.getAttribute("sessionName");
//session.setAttribute("sessionName", "sessionValue"); 이렇게 셋팅되어있음
//session은 String으로만 들어오는게 아니라, object 타입으로 들어오기 때문에 string으로 형변환 하거나 tostring쓰면됨
	Integer myNum = (Integer)session.getAttribute("myNum"); //integer로 형변환한건 얼마든지 int로 할당가능함
	out.println("sessionName : " + sessionName + "<br>");
	out.println("myNum : " + myNum + "<br>");
	out.println("id : " + session.getAttribute("id") + "<br>"); //추가한 속성이 없을 경우 null
	//ex2부터 실행하면 안됨. 왜? setAtrribute한 내용이 없기 때문에 getAtrribute에 null 이 들어올거임 
	//따라서 ex1먼저 실행해서 ex2에 타고 들어오셈 
	
	
	//쿠키는 내가만든거 아닌데도 있었음 시스템이 추가했기 때문에
	//세션은 그렇게 안됨. 내가 만든 속성만 있음 
	//모든 세션 속성 리스트 출력 
	out.println("<h4>모든 세션 속성들 list</h4>");
	//Enumeration<> 세션의 속성 이름은 String으로 들어옴. 값은 상관 없음
	//Enumeration = 단계적인 묘사나 열거 (열거법 같은걸 뜻하는 단어)
	Enumeration<String> sAttrNames = session.getAttributeNames();
	//sAttrNames 라는 변수가 0번째 아이 가르키고 있는중입니다
	int cnt=0; //속성이 몇개인지 확인하기 위해 만든 누적변수
	while(sAttrNames.hasMoreElements()){
			String sname = sAttrNames.nextElement(); //세션(속성) 이름
			String svalue = session.getAttribute(sname).toString(); //세션(속성) 값		
			out.println(sname + "(세션이름) / " + svalue +"(세션값)<br>");
			cnt++;
	}
	if(cnt==0){
		out.println("추가된 세션 속성이 없습니다.");
	}
	
	
	// 특정 세션 삭제하기(로그아웃시 사용)
	session.removeAttribute("myNum"); //myNum 세션 속성만 삭제 
	out.println("<h4>myNum 세션 속성 삭제 후 </h4>");
	//Enumeration<> 세션의 속성 이름은 String으로 들어옴. 값은 상관 없음
	//Enumeration = 단계적인 묘사나 열거 (열거법 같은걸 뜻하는 단어)
	sAttrNames = session.getAttributeNames();
	//sAttrNames 라는 변수가 0번째 아이 가르키고 있는중입니다
	cnt=0; //속성이 몇개인지 확인하기 위해 만든 누적변수
	while(sAttrNames.hasMoreElements()){
			String sname = sAttrNames.nextElement(); //세션(속성) 이름
			String svalue = session.getAttribute(sname).toString(); //세션(속성) 값		
			out.println(sname + "(세션이름) / " + svalue +"(세션값)<br>");
			cnt++;
	}
	if(cnt==0){
		out.println("추가된 세션 속성이 없습니다.");
	}
	
	
	
	// 모든 세션 삭제하기(로그아웃시 사용)
	session.invalidate(); // 세션이 없어지는게 아니라 세션안에 속성이 없어지는 것. 따라서 유효한 세션값이 없어지는 것 
											  // setAttribute했던 모든 세션 속성값 다 삭제
	if(request.isRequestedSessionIdValid()){//유효한 세션 속성이 있는지 여부 
		//유효한 세션이 있으면 로그인 한것. 없으면 로그인 안한것
		out.println("session valid<br>");		
	}else{
		out.println("session invalid<br>");
	}
	out.println("<h4>세션ID : " +session.getId() + "</h4>");
	out.println("<h4>세션유효시간 : " + session.getMaxInactiveInterval() + "<br>");
	
 %>	
</body>
</html>





























































