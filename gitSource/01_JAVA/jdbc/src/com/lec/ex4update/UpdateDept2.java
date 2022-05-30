package com.lec.ex4update;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

//sql���� oracle���� ġ�� ������ 
public class UpdateDept2 {

	public static void main(String[] args) {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url 	  = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		
		Scanner scanner = new Scanner(System.in);
		Connection conn = null;
		Statement stmt = null;
		//select �� �Ⱦ��Ŷ� resultSet �����ٰ��� 
		//����ڿ��� �Է¹��� �� sql �������� 
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,"scott","tiger");
			stmt = conn.createStatement();
			
			//����ڿ��� �Է¹��� �� sql �ۼ� 
			System.out.println("������ �μ���ȣ�� ? ");
			int deptno = scanner.nextInt();
			
			//�Է��� �μ���ȣ�� �ִ��� ������ üũ - �̹������� ���Ұ�  
			System.out.println("������ �μ��̸��� ? ");
			String dname = scanner.next();
			System.out.println("������ �μ���ġ�� ? ");
			String loc = scanner.next();
			
			//sql�� ����� 
			String sql = "UPDATE DEPT SET DNAME = '"+dname+"', LOC ='"+loc+"' WHERE DEPTNO =" + deptno;
			int result = stmt.executeUpdate(sql);
			System.out.println(result >0 ? "��������" : "�ش� �μ��� ���� ���� �ʽ��ϴ�");
			
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			
			try { //(7) �ݾ��ֱ�
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {}
	}
		
	}
}























