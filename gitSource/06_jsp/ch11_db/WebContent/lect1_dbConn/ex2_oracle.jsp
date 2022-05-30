<%@page import="java.sql.Date"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
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
<%!
	String driver 	= "oracle.jdbc.driver.OracleDriver";
	String url 			= "jdbc:oracle:thin:@localhost:1521:xe";
	//String url = "jdbc:mysql://localhost:3306/kimdb?serverTimezone=UTC";
	String uid			= "scott";
	String upw			= "tiger";
%>	
	
<table>	
<%
	Connection conn = null;
	Statement  stmt = null;
	ResultSet  rs   = null;
	String sql ="SELECT * FROM EMP"; //블럭 잡고 ctrl+shift+x 누르면 됨

	try{
		Class.forName(driver);//1단계 드라이버 로드
		conn = DriverManager.getConnection(url,uid,upw); // DB 연결 
		stmt = conn.createStatement(); //sql문 전송 객체 생성
		rs	 = stmt.executeQuery(sql); // sql 전송 + sql 전송 결과 보기 
		if(rs.next()){//데이터 있으면 if문 안 없으면 else문 6단계 : 결과를 이용해서 적당한 로직 수행
			out.println("<tr><th>사번</th><th>이름</th><th>직책</th><th>상사사번</th><th>입사일</th>");
			out.println("<th>급여</th><th>상여</th><th>부서번호</th></tr>"); //if문 만족할경우 뿌려질 타이틀
			do{
				int empno 					= rs.getInt("empno");
				String ename 			= rs.getString("ename");
				String job 				= rs.getString("job");
				int mgr 			= rs.getInt("mgr");
				Date hiredate 	= rs.getDate("hiredate");
				int sal 					= rs.getInt("sal");
				int comm 				= rs.getInt("comm");
				int deptno 					= rs.getInt("deptno");
				out.println("<tr><td>"+empno+"</td><td>"+ename+"</td><td>"+job+"</td>");
				out.println("<td>"+mgr+"</td><td>"+hiredate+"</td><td>"+sal+"</td>");
				out.println("<td>"+comm+"</td><td>"+deptno+"</td></tr>");
				
			}while(rs.next());
		}else{
			out.println("<tr><td>입력된 데이터가 없습니다</td></tr>");
		}
		
	}catch(Exception e){
		System.out.println(e.getMessage());
	}finally{
		try {
			if(rs  !=null) rs.close();
			if(stmt!=null) stmt.close();
			if(conn!=null) conn.close();
		} catch (Exception e) {
			
		}
	}
	
%>	
	
</table>
</body>
</html>














