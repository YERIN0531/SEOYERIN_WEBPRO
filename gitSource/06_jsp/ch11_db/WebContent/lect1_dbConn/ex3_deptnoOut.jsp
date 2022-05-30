<%@page import="java.sql.Date"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.mysql.cj.xdevapi.PreparableStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
		PreparedStatement pstmt = null;
		ResultSet  rs   = null;
		String sql = "SELECT * FROM EMP WHERE DEPTNO=?";
		String deptnoStr = request.getParameter("deptno");
		if(deptnoStr==null)
			deptnoStr = "0";
		int deptno = Integer.parseInt(deptnoStr);
		try{
			Class.forName(driver);//1단계
			conn = DriverManager.getConnection(url, uid, upw);
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, deptno);
			rs = pstmt.executeQuery();
			if(rs.next()){
				out.println("<tr><th>사번</th><th>이름</th><th>입사일</th><th>부서번호</th></tr>");
				do{
				deptno = rs.getInt("deptno");
				int empno = rs.getInt("empno");
				String ename = rs.getString("ename");
				Date hiredate = rs.getDate("hiredate");
				out.println("<tr>");
				out.println("<td>"+empno+"</td>" +"<td>"+ename+"</td>" +"<td>"+hiredate+"</td>" + "<td>"+deptno+"</td>");
				out.println("</tr>");
				}while(rs.next());
			}else{
				out.println("<tr><td>해당되는 부서의 사원이 존재하지 않습니다</td></tr>");
			}
			
		}catch(Exception e){
			System.out.println(e.getMessage());
		}finally{ // finally 에서 jsp에선 try catch 안해주고 그냥 써줘도 됨 
			try {
				if(rs  !=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e) {
				
			}
		}
	
	%>
	<button onclick = "location.href='ex3_deptno.jsp'">다시검색</button>
	
	</table>
</body>
</html>







