<%@page import="java.sql.DriverManager"%>
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
<form action="ex3_deptnoOut.jsp">
	부서번호 
	<select name="deptno">
		<option value="0"></option>
		<%
		String driver 	= "oracle.jdbc.driver.OracleDriver";
		String url 			= "jdbc:oracle:thin:@localhost:1521:xe";
		
		Connection conn = null;
		Statement stmt 	= null;
		ResultSet rs 		= null;
		String sql = "SELECT * FROM DEPT";
		
		try{
		Class.forName(driver);
		conn = DriverManager.getConnection(url,"scott","tiger");
		stmt = conn.createStatement();
		rs   = stmt.executeQuery(sql);
		if(rs.next()){
			do{
				int deptno = rs.getInt("deptno");
				String dname = rs.getString("dname");
				String loc = rs.getString("loc");
	%>
		<option value=<%=deptno %>><%=deptno%>-<%=dname %></option>
	<% 			
			}while(rs.next());
		}else{
			out.println("해당되는 부서번호의 사원이 없습니다");
		}
		
		}catch(Exception e){
			
		}finally{
			if(rs!=null)rs.close();
			if(stmt!=null)stmt.close();
			if(conn!=null)conn.close();
		}
		
		
		%>
	</select>
	<input type="submit" value="제출">
</form>	
</body>
</html>











