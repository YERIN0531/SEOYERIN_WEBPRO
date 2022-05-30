package com.lec.ex3insert;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;
//�ڹٿ��� INSERT �����ϸ� �ڵ� COMMIT�� �� 

public class InsertDept {

	public static void main(String[] args) {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url 	  = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		
		Scanner scanner = new Scanner(System.in);
		System.out.print("�Է��� �μ���ȣ�� ? ");
		int deptno = scanner.nextInt();
		System.out.print("�Է��� �μ��̸���? ");
		String dname = scanner.next();
		System.out.print("�Է��� �μ���ġ��? ");
		String loc = scanner.next();
		//sql�� �����
		String sql = "INSERT INTO DEPT VALUES ("+deptno+",'"+dname+"','"+loc+"')";
		sql = String.format("INSERT INTO DEPT VALUES (%d,'%s','%s')", deptno, dname, loc);
		
		Connection conn = null;
		Statement  stmt = null;
		//select �ƴϴϱ� resultSet �����൵�� 
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,"scott","tiger");
			stmt = conn.createStatement();
			int result = stmt.executeUpdate(sql); // rs ���� �ȸ���� ������, result��� ���� ���� ������༭ ����ٰ� sql �־����� 
			System.out.println(result>0 ? "�Է¼���" : "�Է½��� "); // 0���̸� �����Ѱ� n�� �߰��� �Ǿ�� �Է¼��� 
		
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println("SQL����:" + e.getMessage());
		}finally {
			
			try { //(7) �ݾ��ֱ� 
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {}
	}
		
	}
}
























