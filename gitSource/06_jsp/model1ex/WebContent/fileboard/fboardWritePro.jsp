<%@page import="com.lec.dao.FileboardDao"%>
<%@page import="com.lec.dto.FileboardDto"%>
<%@page import="com.lec.dto.CustomerDto"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
String path = request.getRealPath("fileboardUpload");
int maxSize = 1024*2012*5; // 업로드 제한 용량 : 5MB
String ffilename = null; //첨부파일 저장 
MultipartRequest mRequest = null;
try{
	mRequest = new MultipartRequest(request, path, maxSize, "utf-8", 
			new DefaultFileRenamePolicy());
	Enumeration<String> params = mRequest.getFileNames();
	String param = params.nextElement();
	ffilename = mRequest.getFilesystemName(param);
}catch(IOException e){
	System.out.println(e.getMessage());
}

if(ffilename!=null){ //파일네임이 null이아니면 소스 복사 - 서버에서 소스 폴더로 파일 복사 
	InputStream is = null;
	OutputStream os = null;
	try{
		File serverFile = new File(path+"/"+ffilename);
		is = new FileInputStream(serverFile);
		os = new FileOutputStream("D:/webPro/SOURCE/06_jsp/model1ex/WebContent/fileboardUpload/"+ffilename);
		byte[] bs = new byte[(int)serverFile.length()];
		int readByteCnt;
		while((readByteCnt = is.read(bs))!=-1){
			os.write(bs,0,readByteCnt);
		}
	}catch(Exception e){
		System.out.println(e.getMessage());
	}finally{
		if(os!=null) os.close();
		if(is!=null) is.close();
	}//try-fianlly
}//if

//파라미터 정보들 받아오기
	String pageNum = mRequest.getParameter("pageNum");
	int fnum = Integer.parseInt(mRequest.getParameter("fnum"));
	String cid = ((CustomerDto)session.getAttribute("customer")).getCid();
	String fsubject = mRequest.getParameter("fsubject");
	String fcontent = mRequest.getParameter("fcontent");
	String fpw = mRequest.getParameter("fpw");
	int fref = Integer.parseInt(mRequest.getParameter("fref")); //원글은 0, 답변글 원글정보
	int fre_step = Integer.parseInt(mRequest.getParameter("fre_step")); //원글은 0, 답변글은 원글정보
	int fre_level = Integer.parseInt(mRequest.getParameter("fre_level")); //원글은 0, 답변글은 원글정보
	String fip = request.getRemoteAddr();
	FileboardDto fbDto = new FileboardDto(fnum, cid,fsubject, fcontent, ffilename,fpw,0  
				,fref, fre_step, fre_level, fip, null);
	
	FileboardDao fbDao = FileboardDao.getInstance();
	int result;
	if(fnum==0){//원글쓰기
		result = fbDao.insertBoard(fbDto);
	}else{//답변글쓰기
		result = fbDao.reply(fbDto);
	}

	if(result == FileboardDao.SUCCESS){ %>
		<script>
		alert('글쓰기 성공');
		location.href='fboardList.jsp?pageNum?=<%=pageNum%>';
		</script>
	<% }else{%>
		<script>
		alert('글쓰기 실패');
		history.back();
		</script>
<% }%>	
</body>
</html>
























