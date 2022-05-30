<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.Date"%>
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
<%
	String deptnoStr = request.getParameter("deptno");
	if(deptnoStr==null) deptnoStr ="-1"; //deptno가 -1이 아닐때만 뿌림 
	int deptno = Integer.parseInt(deptnoStr);
	String driver 	= "oracle.jdbc.driver.OracleDriver";
	String url 			= "jdbc:oracle:thin:@localhost:1521:xe";
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String sql = "SELECT * FROM DEPT";
	
%>
<form action="">
	부서번호 
	<select name="deptno">
		<option value="0"></option>
		<!-- ..DB에서 가져온 부서번호를 option에 추가  -->
		<%
		try{
			Class.forName(driver);
			conn = DriverManager.getConnection(url,"scott","tiger");
			stmt = conn.createStatement();
			rs   = stmt.executeQuery(sql);
			while(rs.next()){
				int deptnoDB = rs.getInt("deptno");
				String dname = rs.getString("dname");
				String loc   = rs.getString("loc");
				//<option value = '10' selected='selected'>10 - 'sales'</option>
				//<option value = '10'>10-'sales'</option>
				if(deptno != deptnoDB){
				out.println("<option value='"+deptnoDB+"'>" + deptnoDB + "-" + dname +"</option>");
					
				}else {
					out.println("<option value='"+deptnoDB +"'selected='selected'>" +
					deptnoDB + "-" + dname +"</option>");
					
				}
				
				
			}
		}catch(Exception e){
			System.out.println(e.getMessage());
		}finally {
			if(rs!=null) rs.close();
			if(stmt!=null) stmt.close();
			if(conn!=null) conn.close();
		}
		%>
	</select>
	<input type="submit" value="검색">
	<%if(deptno!=-1){ %>
	<table>
		<!-- 파라미터로 받은 부서번호의 사원정보 테이블에 추가 -->
		<% 
		sql = "SELECT * FROM EMP WHERE DEPTNO="+deptno;
		try{
			conn = DriverManager.getConnection(url,"scott","tiger");
			stmt = conn.createStatement();
			rs   = stmt.executeQuery(sql);
			if(rs.next()){//해당 부서 사원이 있는 경우
				out.println("<tr><th>사번</th><th>이름</th><th>입사일</th><th>부서번호</th></tr>");
				do{
				deptno = rs.getInt("deptno");
				int empno = rs.getInt("empno");
				String ename = rs.getString("ename");
				Timestamp hiredate = rs.getTimestamp("hiredate");
				out.println("<tr>");
				out.println("<td>"+empno+"</td>" +"<td>"+ename+"</td>" +"<td>"+hiredate+"</td>" + "<td>"+deptno+"</td>");
				out.println("</tr>");
				}while(rs.next());
			}else{ //해당부서 사원이 없는 경우 
				out.println("<tr><th>해당 부서 사원이 존재하지 않습니다</th></tr>");
			}
		}catch(Exception e){
			
		}finally{
			if(rs!=null) rs.close();
			if(stmt!=null) stmt.close();
			if(conn!=null) conn.close();
		}
		}%>
		
	</table>
</form>	
</body>
</html>























