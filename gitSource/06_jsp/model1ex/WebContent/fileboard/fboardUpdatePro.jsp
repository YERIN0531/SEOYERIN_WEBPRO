<%@page import="com.lec.dto.FileboardDto"%>
<%@page import="com.lec.dao.FileboardDao"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.OutputStream"%>
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
		// 파라미터
		String pageNum = mRequest.getParameter("pageNum");
		String dbfilename = mRequest.getParameter("dbfilename");
		int fnum = Integer.parseInt(mRequest.getParameter("fnum"));		
		String fsubject = mRequest.getParameter("fsubject");
		// ffilename은 만약 null값이 들어가면 dbfilename으로 대체 할것 
		ffilename = (ffilename==null? dbfilename : ffilename);
		String fcontent = mRequest.getParameter("fcontent");
		String fpw = mRequest.getParameter("fpw");
		String fip = request.getRemoteAddr();
		//FileboardDto(int fnum, String cid, String fsubject, String fcontent, String ffilename, String fpw, int fhit,
			//int fref, int fre_step, int fre_level, String fip, Date frdate)
		FileboardDto fbDto =new FileboardDto(fnum, null, fsubject, fcontent, ffilename, fpw, 0, 0, 0, 0, fip, null);
		FileboardDao fbDao = FileboardDao.getInstance();
		int result = fbDao.updateBoard(fbDto);
		if(result==FileboardDao.SUCCESS){ %>
			<script>
			alert('글수정 성공');
			location.href='fboardList.jsp?pageNum=<%=pageNum%>';
			</script>
		<% }else{%>
			<script>
			alert('글수정 실패');
			 history.back();
			</script>
	<% }
	%>
</body>
</html>











