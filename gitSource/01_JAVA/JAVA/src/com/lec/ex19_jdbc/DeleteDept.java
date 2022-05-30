package com.lec.ex19_jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

//����ڷκ��� �����ϰ��� �ϴ� �μ���ȣ�� �Է¹޾� �����ϱ� 
public class DeleteDept {

	public static void main(String[] args) {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url 	  = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		
		Scanner scanner = new Scanner(System.in);
		Connection conn = null;
		Statement  stmt = null;
		System.out.print("������ �μ���ȣ�� ? ");
		int deptno = scanner.nextInt();
		String sql = "DELETE FROM DEPT WHERE DEPTNO=" + deptno;
		
		try {
			Class.forName(driver); //(1)
			conn = DriverManager.getConnection(url,"scott","tiger"); //(2)
			stmt = conn.createStatement();//(3)
			int result = stmt.executeUpdate(sql); //(4)
			System.out.println(result>0 ? deptno + "�� �μ� ���� ����" : deptno + "�� �μ��� �������� �ʽ��ϴ�");
			
		} catch (ClassNotFoundException e) {
			System.out.println("����̹� �ε� ���� " + e.getMessage());
		} catch (SQLException e) {
			System.out.println("SQL�� ����" + e.getMessage());
		}finally {
			try {
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {}
		}
		
		
	}
}























