<%@page import="org.apache.catalina.valves.rewrite.InternalRewriteMap.UpperCase"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
<!-- 	<style>
	body{background-color: lightyellow;}
	#wrap{}
	#html{margin:0 auto; width:200px; margin-top:50px; color:navy; font-weight: bold;}
	input[type=text]{width:50px; border:1px solid navy;}
	input[type=submit]{background-color: lightgray; color:black; font-weight:bold;}
	#db{margin:50px auto; width:500px; border : 2px solid navy; height:500px; background-color: #cad5ad;}
	#db b{color:white; padding-left:18px;}
	td,th{color:white; text-align: center; padding-left:10px;}
	</style> -->
</head>
<body>
<%
	String ename = request.getParameter("ename");
	if(ename==null) ename ="-1"; 
	
	String driver 	= "oracle.jdbc.driver.OracleDriver";
	String url 			= "jdbc:oracle:thin:@localhost:1521:xe";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
%>
<form action="">
<div id=wrap>
	<div id="html"> 
		이름 
		<input type="text" name="ename">
		<input type="submit" value="검색">
	 </div> 
	<div id="db">
	<%if(ename != "-1"){ %>
	
	<table>
	
	<!-- 파라미터로 받은 이름의 사원정보 테이블에 추가  -->
	<%
	String sql = "SELECT * FROM EMP WHERE ENAME LIKE '%'||UPPER(?)||'%'";
	try{
		conn = DriverManager.getConnection(url,"scott","tiger");
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, ename);
		rs    = pstmt.executeQuery();
		if(rs.next()){
 			do{
				int empno = rs.getInt("empno");
				ename = rs.getString("ename");
				String job = rs.getString("job");
				int mgr = rs.getInt("mgr");
				Date hiredate = rs.getDate("hiredate");
				int sal = rs.getInt("sal");
				int comm = rs.getInt("comm");
				int deptno = rs.getInt("deptno");
				out.println("<tr>");
				out.println("<td>"+empno+"</td>"+"<td>"+ename+"</td>"+"<td>"+job+"</td>"+"<td>"+mgr+"</td>");
				out.println("<td>"+hiredate+"</td>"+"<td>"+sal+"</td>"+"<td>"+comm+"</td>"+"<td>"+deptno+"</td>");
				out.println("</tr>");
			}while(rs.next());
		}else{
			out.println("<tr><th>해당되는 사원이 존재하지 않습니다</th></tr>");
		}
	}catch(Exception e){
		
	}finally{
		if(rs!=null)rs.close();
		if(pstmt!=null)pstmt.close();
		if(conn!=null)conn.close();
		
	}
	}
	%>
	
	</table>
	 </div>
</div> 
</form>	
</body>
</html>