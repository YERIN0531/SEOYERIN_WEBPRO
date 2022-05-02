package com.lec.ex19_jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

// 사용자로부터 부서명을 입력받아 해당부서 사원의 사번, 이름, 직책, 급여를 출력하시오 
public class Ex2_select {

	public static void main(String[] args) {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url 	  = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		
		Scanner scanner = new Scanner(System.in);
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT EMPNO, ENAME, JOB, SAL" + 
				" FROM EMP E, DEPT D" + 
				" WHERE E.DEPTNO = D.DEPTNO AND DNAME = UPPER(?)";
		
		System.out.print("찾으시는 부서명은 ? ");
		String dname = scanner.next();
		
		try {
			Class.forName(driver); // 1
			conn = DriverManager.getConnection(url,"scott","tiger"); // 2
			pstmt = conn.prepareStatement(sql); //3
			pstmt.setString(1, dname);
			rs = pstmt.executeQuery(); //4 + 5
			
			if(rs.next()) {
				System.out.println("사번\t이름\t직책\t\t급여연봉");
				do {
						
				int empno = rs.getInt("empno");
				String ename = rs.getString("ename");
				String job = rs.getString("job");
				int sal = rs.getInt("sal");
				int anu =(sal*12);
				if(job.length()>=8) {
					System.out.println(empno+"\t"+ename+"\t"+job+"\t"+sal + anu);					
				}else {
					System.out.println(empno+"\t"+ename+"\t"+job+"\t\t"+sal + anu);
				}
				
				}while(rs.next());
				
				
			}else {
				System.out.println("입력하신 부서는 존재하지 않는 부서입니다.");
			}
			
			
			
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt!= null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {}
		}
	}
}














