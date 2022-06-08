<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.OutputStream"%>
<%@page import="com.sun.org.apache.xalan.internal.xsltc.trax.OutputSettings"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.io.IOException"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
	<%
		String path = request.getRealPath("fileUpFolder");
		//out.println(path); 얘부터 실행할게 아니니까 
		//사용자가 첨부한파일은 path(톰캣폴더)에 저장이 됨(내 소스폴더가 아니라)
		int maxSize = 1024*1024*10; //업로드 최대 용량을 10MB
		String filename = ""; //서버에 저장될 파일 이름
		String originalFilename =""; //업로드한 오리지널 파일이름 
		//multipartRequest는 매개변수 없는 생성자 함수가 없음. 
		//매개변수 있는 생성자 함수 만들어 주면 됨 
		try{
		MultipartRequest multipartRequest = new MultipartRequest(request,path,maxSize,"utf-8",
				new DefaultFileRenamePolicy());
		
		/*************************************************************************************/
		
		//9. 데이터베이스에 올릴 filename과 originaname받아오는 것 
		//파일이름이 데이터베이스에 들어가야 하고, 게시판에는 originalfile이름이 들어가야함 
		//그럼 데이터베이스에 filename과 originalfilename 이 둘 다 들어가야 하기 때문에 일단 이름을 받아놓는 과정이라고 생각하면 됨
		Enumeration<String> paramNames = multipartRequest.getFileNames(); //파라미터 이름들 받아오기 
		//parmaNames가 file이라는 파라미터를 이제가르키게됨 
		String param = paramNames.nextElement(); //파라미터 이름 "file" 받아오는 것 
		filename = multipartRequest.getFilesystemName(param); //파라미터 이름으로 저장된 파일 이름 
		originalFilename = multipartRequest.getOriginalFileName(param); //오리지날 파일 이름 
		//근데 첨부를 안할수도 있음 지금은 input type="file"이 하나만 존재하지만, 첨부파일 버튼이 여러개일수도 있음. 
				//첨부를 하지 않으면 filename originalFilename 에는  null이 들어오게 됨 
		System.out.println("파라미터 이름 : " + param + "/서버에저장된파일이름 : " + filename + 
												"/사용자가 업로드한 오리지널 파일이름 : " + originalFilename);
		
		/*************************************************************************************/
		}catch(IOException e){
			System.out.println(e.getMessage());
		}
		
		/*************************************************************************************/
		//10. 서버에 fileUpFolder폴더에 업로드한 파일을 소스의 fileUpFolder 폴더로 file copy 
		InputStream 	is = null;
		OutputStream 	os = null;
		try{
			File serverfile = new File(path+"/"+filename); //첨부하지 않으면 filename에는 null이 들어감 
			if(serverfile.exists()){ //첨부한 파일이 있는지 
				//파일복사 
				//복사될 파일은 Inputstream에(서버에 저장된파일)
				is = new FileInputStream(serverfile); //원본 파일 
				//복사된 파일은 os에 (소스폴더에복사할것)
				os = new FileOutputStream("D:/webPro/SOURCE/06_jsp/ch14_fileUp/WebContent/fileUpFolder/" 
																	+filename);//복사될 파일
				
				//사진을 읽을때 몇바이트씩 읽을지 저장													
				byte[] bs = new byte[(int)serverfile.length()]; // 서버파일의 크기만큼 바이트로 읽어내겠따는 뜻, 형변환으로도int로 해주기
				
				//이제 파일을 읽어야 하는 과정 
				while(true){
					int nReadCnt = is.read(bs); // 파일의 끝이 아닐경우 읽어드린 byte수 : nReadCnt 
					if(nReadCnt ==-1) break; //-1이라는건 파일의 끝을 의미함. 파일의 끝이면 break로 끝내기 
					os.write(bs, 0, nReadCnt);  // bs가 배열 : 0번 인덱스부터 nReadCnt 까지 읽는다는 뜻 
				}//while
					System.out.println("서버 첨부 & 복사 완료");
			}//if
		}catch(Exception e){
			System.out.println(e.getMessage());
		}finally{
			if(os!=null)os.close();
			if(is!=null)is.close();
		}
		
		if(filename!=null){ //첨부함
	%>			
		<h3>첨부한 오리지널 파일 이름 :<%=originalFilename %></h3>
		<h3>서버에 저장된 파일 : <%=path %>/<%=filename %></h3> <!-- path밑에 filename -->
		<img src="<%=conPath %>/fileUpFolder/<%=filename %>" alt="첨부파일">
		
	<% 	}else{ //첨부안함
			out.println("<h2>첨부안함</h2>");
		}
	%>
</body>
</html>








