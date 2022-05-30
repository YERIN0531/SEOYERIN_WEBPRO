package com.lec.ex19_jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;
//�ڹٿ��� INSERT �����ϸ� �ڵ� COMMIT�� �� 
// �μ���ȣ�� �Է¹޾� �ߺ�üũ Ȯ�� �� �Է����� 
// while�� �Ⱦ��� 
public class InsertDept2 {

	public static void main(String[] args) {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url 	  = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		
		Connection conn = null;
		Statement  stmt = null;
		ResultSet  rs	= null;
		Scanner scanner = new Scanner(System.in);
		
		System.out.print("�Է��� �μ���ȣ�� ? ");
		int deptno = scanner.nextInt();
		//�μ���ȣ �ߺ�üũ
		String selectSQL = "SELECT COUNT(*)CNT FROM DEPT WHERE DEPTNO=" + deptno;
		//1~7�ܰ� ���� 
		try {
			Class.forName(driver); //(1)
			conn = DriverManager.getConnection(url,"scott","tiger"); //(2)
			stmt = conn.createStatement(); //(3)
			rs   = stmt.executeQuery(selectSQL); //(4),(5)
			rs.next(); //�ѹ��� �����ؾ� 0�̵� 1�̵� ���� 
			int cnt = rs.getInt("cnt"); // 0�� 1�� ���� �׸� 
			if(cnt!=0) {
				System.out.println("�ߺ��� �μ���ȣ�� �Է��� �Ұ��մϴ�.");
			}else {
				System.out.print("�Է��� �μ��̸���? ");
				String dname = scanner.next();
				System.out.print("�Է��� �μ���ġ��? ");
				String loc = scanner.next();
				//sql�� �����
				String sql = "INSERT INTO DEPT VALUES ("+deptno+",'"+dname+"','"+loc+"')";
				sql = String.format("INSERT INTO DEPT VALUES (%d,'%s','%s')", deptno, dname, loc);
				int result = stmt.executeUpdate(sql); // rs ���� �ȸ���� ������, result��� ���� ���� ������༭ ����ٰ� sql �־����� 
				System.out.println(result>0 ? "�Է¼���" : "�Է½��� "); // 0���̸� �����Ѱ� n�� �߰��� �Ǿ�� �Է¼��� 

			} //else
			scanner.close();
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println("SQL����:" + e.getMessage());
		}finally {
			
			try { //(7) �ݾ��ֱ�
				if(rs  !=null) rs.close();
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {}
	}
		
	}
}
























