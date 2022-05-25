<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<%
		String conPath = request.getContextPath(); //css나 servlet 링크걸때 사용함 
		String appPath = application.getContextPath(); //내 프로젝트앞에 슬래쉬만 붙이는 상대경로
		String absolutePath = application.getRealPath(".");//현재 프로젝트의 절대경로
	%>
	<h2>conPath : <%=conPath %></h2>
	<h2>appPath : <%=appPath %></h2>
	<h2>absolutePath : <%=absolutePath %></h2>
	
	<%
		//파일의 절대경로 가지고 와서 그곳에 있는 파일을 input 해야 화면에 뿌려짐
		String filePath = application.getRealPath("WEB-INF/input.txt");
		//파일의 절대경로가 궁금하면 out.println(filePath);
		out.println(filePath + "의 내용입니다<br><br>"); //실행 하는 순간 톰캣에 옮겨줌
		//JSP방식 trycatch 안해줘도됨
		//서블릿은 자바기 때문에 이렇게 하면 안됨. 자바처럼 해줘야됨 
		BufferedReader br = new BufferedReader(new FileReader(filePath));
		while(true){//파일을 언제까지 읽을줄 모르니 while을 써서 파일의 끝까지 읽어주기
			String line = br.readLine(); //파일 읽기(한줄씩); 파일의 끝이면 null을 반환
			if(line==null)break;
			out.println(line + "<br>");
		}
		br.close();
		
		/* 자바방식 	
		//1. 파일을 입출력하기 위해 스트링 객체를 생성해야함 (빨대를 꽂는다) 
		//2. 데이터를 읽는다
		//3. 파일을 닫는다(=스트림객체없앤다)
		// 오타가 나면 안되니 1번 2번 trycatch 안에 넣었음 
		BufferedReader br = null; //원래 1byte씩 읽지만 얘는 한줄씩 읽는아이임
		try{
			br = new BufferedReader(new FileReader(filePath)); //스트링객체생성
			while(true){//파일을 언제까지 읽을줄 모르니 while을 써서 파일의 끝까지 읽어주기
				String line = br.readLine(); //파일 읽기(한줄씩); 파일의 끝이면 null을 반환
				if(line==null)break;
				out.println(line + "<br>");
			}
		}catch(Exception e){
			out.println("파일이 존재하지 않거나 읽을수 없는 파일입니다");
		}finally{
			try{
				if(br!=null) br.close();
			}catch(Exception e){
				out.print(e.getMessage());
			}
		}
		 */
	%>
</body>
</html>










