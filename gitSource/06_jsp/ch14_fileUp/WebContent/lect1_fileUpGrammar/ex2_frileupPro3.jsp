<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Enumeration"%>
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
		int maxSize = 1024*1024*10; //최대 업로드 용량을 10MB로 하겠다
		String[] filename={"","",""};
		String[] originalFilename={"","",""};
		
		try{
			MultipartRequest mRequest = new MultipartRequest(request,path,maxSize,"utf-8",
					new DefaultFileRenamePolicy());
			
			/******************************************************************************/
			//이번엔 파일 하나가 아니라 여러개를 받아와야 하는 상황
			//근데 받아는 오는데, 받아오는 순서가 1,2,3이아니라 3,2,1 이런식으로 받아옴 
			Enumeration<String> paramNames = mRequest.getFileNames(); //파라미터이름들 받아오기
			int idx = 0;
			while(paramNames.hasMoreElements()){
				String param = paramNames.nextElement(); //파라미터 이름 받아오기 
				filename[idx] = mRequest.getFilesystemName(param); //그 파라미터 이름으로 저장된 파일을 가지고 옴 
				originalFilename[idx] = mRequest.getOriginalFileName(param);//해당 파라미터 이름으로 첨부된 오리지널 파일 이름 가지고 옴
				System.out.println(idx +"번째 파라미터 : " + param + ", 저장파일 : "+filename[idx] 
														+ ",원파일명 : " + originalFilename[idx]);
				idx++;
			}// while
		}catch(Exception e){
			System.out.println(e.getMessage());
		}//try
		
		/*******************************************************************************************/
		//서버에 저장된 파일을 소스 폴더로 복사 
		for(String f : filename){
			if(f!=null){ //f가 null이 아닐때만 카피할 것 
				//파일복사
				InputStream 	is = null;
				OutputStream 	os = null;
				try{
					File serverfile = new File(path+"/"+f); //첨부하지 않으면 filename에는 null이 들어감 
					if(serverfile.exists()){ //첨부한 파일이 있는지 
						//복사될 파일은 Inputstream에(서버에 저장된파일)
						is = new FileInputStream(serverfile); //원본 파일 
						//복사된 파일은 os에 (소스폴더에복사할것)
						os = new FileOutputStream("D:/webPro/SOURCE/06_jsp/ch14_fileUp/WebContent/fileUpFolder/" 
																			+f);//복사될 파일
						
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
				
			}
		}
		
		
	%>
	
	<!-- //submit뿌렸을때 그냥 빈화면 나오는게 이상해서 굳이 써준애임 -->
	<%=Arrays.toString(filename) %>
	<%=Arrays.toString(originalFilename)%>
	
	<h2>파일1첨부파일</h2>
	<h5><%=path %>/<%=filename[2] %></h5>
	<img src ="../fileUpFolder/<%=filename[2] %>" alt="첫번째 첨부파일">
	
		<h2>파일2첨부파일</h2>
	<h5><%=path %>/<%=filename[1] %></h5>
	<img src ="../fileUpFolder/<%=filename[1] %>" alt="두번째 첨부파일">
	
		<h2>파일3첨부파일</h2>
	<h5><%=path %>/<%=filename[0] %></h5>
	<img src ="../fileUpFolder/<%=filename[0] %>" alt="세번째 첨부파일">
</body>
</html>