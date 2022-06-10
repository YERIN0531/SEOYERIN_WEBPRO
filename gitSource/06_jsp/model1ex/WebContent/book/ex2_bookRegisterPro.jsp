
<%@page import="com.lec.dto.BookDto"%>
<%@page import="com.lec.dao.BookDao"%>
<%@page import="java.sql.Date"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
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
	<% // 한글 인코딩 처리 - multipartRequest 객체 생성 - 첨부된 파일명 get - 그 외 파라미터에서 입력된 정보 get - insert
	request.setCharacterEncoding("utf-8");
	String path = request.getRealPath("bookimg");
	int maxSize = 1024*1024*5; //최대 업로드 용량이 5mb
	String[] image = {"",""}; // 저장된 파일명 저장소 
	//String[] originalImage = {"",""};
	MultipartRequest mRequest	= null;
	try{
		//multipartRequest 객체 생성
		//서버에 저장된 파일명 
			mRequest = new MultipartRequest(request, path, maxSize, "utf-8",
				new DefaultFileRenamePolicy());
		//파라미터 이름들을 받는것, 함수이름이 getFilename라고  생겼지만 파일 이름을 받는게 아니라 파라미터 이름을 받는 것 
		Enumeration<String> paramNames = mRequest.getFileNames(); 
		int idx = 0;
		while(paramNames.hasMoreElements()){
			String param = paramNames.nextElement(); // 파라미터 이름 
			image[idx] = mRequest.getFilesystemName(param); // 저장된 파일명
			idx++;
		} //while
	}catch(Exception e){
		System.out.println(e.getMessage());
	}
	// 서버(톰캣폴더)에 저장된 bookimg 폴더 파일을 (지금막첨부해서 추가된 파일들) 소스의 	bookimg 폴더로 복사 
	for(String img : image){
		if(img!=null){ //img가 null이라는건 첨부된 파일이 없다라는 뜻 
			
			InputStream is = null;
			OutputStream os = null;
			File serverFile = new File(path+"/"+img);
			
			//밑에 try절로 떨어진다는 것은 위에 serverfile이 존재한다는 뜻 따라서 try -catch절에서 serverfile이 있냐 없냐 물어볼 필요가 없음
			try{
				is = new FileInputStream(serverFile);
				os = new FileOutputStream("D:/webPro/SOURCE/06_jsp/ch14_fileUp/WebContent/bookimg/"+img);
				byte[] bs = new byte[(int)serverFile.length()]; //형변환 하는 이유 
				while(true){
					int readbyteCnt = is.read(bs);
					if(readbyteCnt==-1) break;
					os.write(bs,0,readbyteCnt);
				}
			}catch(Exception e){
				System.out.println(e.getMessage());
			}finally{
				if(os!=null) os.close();
				if(is!=null) is.close();
			}
		}
	}
	/**********************************************************************************************/
	/**********************************************************************************************/
									/*********파일 첨부 위에서 다 완료했으니 나머지 로직들 실행하기 *********/
	// 파일 첨부외 파라미터에서 입력된 정보 get
	// 변수중 받아오는거 아닌 애들이 bid, brdate인데 얘네는 0이나 null로 초기화 시켜놓기 
	 int 	bid = 0;
	 String 	btitle = mRequest.getParameter("btitle");
	 int 	bprice = Integer.parseInt(mRequest.getParameter("bprice"));
	 // 이미지는 이미 위에 image라는 변수에 받아왔음 따라서 밑에 로직처럼 써주면 됨 
	 String 	bimage1 = image[1]==null? "noImg.png" : image[1];
	 String 	bimage2 = image[0]!=null? image[0] : "NOTHING.JPG";
	 String 	bcontent = mRequest.getParameter("bcontent");
	 int 	bdiscount = Integer.parseInt(mRequest.getParameter("bdiscount"));
	 Date	brdate = null;
	// DB에 insert 
		BookDao bDao = BookDao.getInstance();
		BookDto book = new BookDto(bid,btitle, bprice, bimage1, bimage2, bcontent, bdiscount, brdate);
		int result = bDao.insertBook(book);
		if(result == BookDao.SUCCESS){
			out.println("<h2>책 등록 성공</h2>");
		}else{
			out.println("<h2>책 등록 실패</h2>");
		}
		%>
	<h3>책이름 : <%=btitle %></h3>
	<h3>책대표 이미지 : <%=path %>/<%=bimage1 %></h3>
	<img src ="<%=conPath %>/bookimg/<%=bimage1 %>" alt="대표">
	<h3>책 이미지 2 : <%=path + "/" + bimage2 %></h3>	
	<img src ="../bookimg/<%=bimage2 %>">
	<h3>책 설명 </h3> <!-- 그냥 붙이면 스페이스 때문에 이상하게 나오기 때문에 pre를 활용해서 뿌려주기 -->
	<pre><%=bcontent %></pre>
	<h3>책가격 : <del><%=bprice %></del> <%=bprice*(100-bdiscount)/100 %>원</h3> <!-- <del>은 delete 선이 나오는 애  -->
	<h3>할인율 : <%=bdiscount %>%</h3>
	
	<a href="ex3_list_board.jsp">책 전체리스트(게시판 스타일)</a>
	<a href="ex3_list_boardp.jsp">책 리스트(paging 게시판 스타일)</a>
	<a href="ex3_list_product.jsp">책 전체 리스트(쇼핑몰 스타일)</a>
	<a href="ex3_list_productp.jsp">책 리스트(paging 쇼핑몰 스타일)</a>
	
	
</body>
</html>








