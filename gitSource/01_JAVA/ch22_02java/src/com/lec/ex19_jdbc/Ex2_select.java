package com.lec.ex19_jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

// ����ڷκ��� �μ����� �Է¹޾� �ش�μ� ����� ���, �̸�, ��å, �޿��� ����Ͻÿ� 
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
		
		System.out.print("ã���ô� �μ����� ? ");
		String dname = scanner.next();
		
		try {
			Class.forName(driver); // 1
			conn = DriverManager.getConnection(url,"scott","tiger"); // 2
			pstmt = conn.prepareStatement(sql); //3
			pstmt.setString(1, dname);
			rs = pstmt.executeQuery(); //4 + 5
			
			if(rs.next()) {
				System.out.println("���\t�̸�\t��å\t\t�޿�����");
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
				System.out.println("�Է��Ͻ� �μ��� �������� �ʴ� �μ��Դϴ�.");
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














