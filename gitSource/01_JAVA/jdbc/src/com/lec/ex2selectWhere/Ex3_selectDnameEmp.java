package com.lec.ex2selectWhere;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

/* 1. ����ڿ��� �μ����� �Է¹޾� 
 * 	1-1. �μ����� �����ϴ� ��� : �μ������� �������(���, �̸�, �޿�, �޿����)�� ���
 * 	1-2. �μ��� �������� �ʴ� ��� : ���ٰ� ���   */
// �䱸���� �ľ��� query�� ���� �ۼ� 
public class Ex3_selectDnameEmp {

	public static void main(String[] args) {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url 	  = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		
		Connection 	conn = null; //DB ���� ��ü ���� 
		Statement 	stmt = null; //SQL ���� ��ü ����
		ResultSet 	rs 	 = null; //SELECT ��� ���� ���� (select ���۹��� �� �ƴϸ� �ʿ� ����)
		Scanner 	sc = new Scanner(System.in);
		System.out.print("���ϴ� �μ����� ? ");
		String dname = sc.next();
		String sql1 = "SELECT * FROM DEPT WHERE DNAME = UPPER('"+dname+"')";
		sql1 = String.format("SELECT * FROM DEPT WHERE DNAME = UPPER('%s')", dname);
		String sql2 = String.format("SELECT EMPNO, ENAME, SAL, GRADE" + 
				" FROM EMP E, SALGRADE, DEPT D" + 
				" WHERE SAL BETWEEN LOSAL AND HISAL AND E.DEPTNO=D.DEPTNO AND DNAME = UPPER('%s')", dname);
		
		try {
			Class.forName(driver);//(1)
			conn = DriverManager.getConnection(url,"scott","tiger"); //(2)
			stmt = conn.createStatement(); //(3)
			rs	 = stmt.executeQuery(sql1); //(4)+(5)
			if(rs.next()) {//(6) �ش�μ����� �ִ� ��� 
				System.out.println("�μ���ȣ : " + rs.getInt("deptno"));
				System.out.println("�μ��̸� : " + dname);
				System.out.println("�μ���ġ : " + rs.getString("loc"));
				rs.close();
				rs = stmt.executeQuery(sql2);
				if(rs.next()) { //�ش�μ����� ����� �ִ� ��� 
					System.out.println("���\t�̸�\t�޿�\t���");
					System.out.println("============================");
					do {
						int empno = rs.getInt("empno");
						String ename = rs.getString("ename");
						int sal = rs.getInt("sal");
						int grade = rs.getInt("grade");
						//��� 
						System.out.println(empno+"\t"+ename+"\t"+sal+"\t"+grade+"���");
					}while(rs.next());
				}else {// �ش�μ����� ����� ���� ��� 
					System.out.println(dname + "�μ����� ����� �������� �ʽ��ϴ�.");
				}
			}else {// �ش�μ����� ���� ��� 
				System.out.println(dname + "�� ���� �μ����Դϴ�.");
			}
			
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			
				try {
					if(rs!=null) rs.close();
					if(stmt!=null) stmt.close();
					if(conn!=null) conn.close();
				} catch (SQLException e) {}
		}
	}
}















