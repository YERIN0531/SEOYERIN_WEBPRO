package com.lec.ex6preparedstatement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class Ex1_insertDept {

	public static void main(String[] args) {

		String driver = "oracle.jdbc.driver.OracleDriver";
		String url 	  = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
				
		Scanner scanner = new Scanner(System.in);
		
		// �߰��� ������ �ޱ� (?�ȿ� ��  �������� ���� �������ִ� �� ) 
		
		System.out.print("�߰��� �μ���ȣ ? ");
		int deptno = scanner.nextInt();
		
		//�Ʒ� ������ ���� �����ٰ� �����ϴ°� ������, ������ ȭ��� �� ���̱� ���ؼ� ����ٰ� ���� 
		
		Connection 		  conn = null;
		PreparedStatement pstmt = null;
		String selectSQL="select * from dept where deptno=?";
		ResultSet rs = null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, "scott","tiger");
			pstmt = conn.prepareStatement(selectSQL);
			pstmt.setInt(1, deptno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				
					System.out.println("�̹� �����ϴ� �μ���ȣ�Դϴ�");
					
				
			}else {
				pstmt.close();
				System.out.print("�߰��� �μ��̸� ? ");
				String dname = scanner.next();
				System.out.print("�߰��� �μ���ġ ? ");
				String loc = scanner.next();
				String sql = "INSERT INTO DEPT VALUES (?,?,?)";
				pstmt = conn.prepareStatement(sql); // stmt ��Ÿ���̶��� �ٸ�. pstmt�� sql���� �־���ߵ�
				// SQL���۰�ü 
				pstmt.setInt(1, deptno); // sql�� ù��° ����ǥ�� int������ depno�� ��
				pstmt.setString(2, dname);
				pstmt.setString(3, loc);
				int result = pstmt.executeUpdate();
				// int result = stmt.executeUpdate(sql);  
				System.out.println(result>0 ? "�Է¼���" : "�Է½���");
			}
			
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}

