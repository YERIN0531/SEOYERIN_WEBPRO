package com.lec.ex7homework;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

// 1�� ������ ������ �Է� -( �̸�, ������,����,����,�������� �Է¹޾�) 
// 2�� ������ ���ϴ� �������� �Է¹޾� ������ ��ȸ �� ������ �߰��Ͽ� ������ ���� ������ �̸�(��ȣ)�� ��� - rownum ��� (top_n����) ��� ��� sql
// 3�� ������ �Էµ� ��� ��ü ��ȸ(select) ������ �߰��Ͽ� ������ ���� ������ ��� (order by sql)
public class Homework_solo {
	public static void main(String[] args) {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url 	  = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		
		Connection conn = null;
		Statement  stmt = null;
		ResultSet  rs   = null; //2��,3���� ���� rs 
		PreparedStatement pstmt = null;
		Scanner scanner = new Scanner(System.in);
		
			int fn; //��ɹ�ȣ (1:�������Է� | 2:�������Է� | 3:��ü��ȸ | 0:����)
			int idx;
			
			try {
				Class.forName(driver);
			} catch (ClassNotFoundException e) {
				System.out.println(e.getMessage());
			}
			
			do {
				
				System.out.println("1:�������Է� | 2:�������Է� | 3:��ü��ȸ | 0:����");
				fn = scanner.nextInt();
				switch(fn) {
				case 1 : //�̸�, ������ȣ, ����, ����, �������� �Է¹ޱ�
					System.out.println("�̸��� �Է��ϼ��� ");
					String pname = scanner.next();
					System.out.println("������ �Է��ϼ��� ");
					String jname = scanner.next();
					System.out.println("�������� �Է� ");
					int kor = scanner.nextInt();
					System.out.println("�������� �Է�");
					int eng = scanner.nextInt();
					System.out.println("�������� �Է�");
					int mat = scanner.nextInt();
					String sql = "INSERT INTO PERSON VALUES (PERSON_NO_SQ.NEXTVAL,?,(SELECT jNO FROM JOB WHERE JNAME=?),?,?,?)";	
					//2~7�ܰ�
					try {
						conn = DriverManager.getConnection(url,"scott","tiger");
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, pname);
						pstmt.setString(2, jname);
						pstmt.setInt(3, kor);
						pstmt.setInt(4, eng);
						pstmt.setInt(5, mat);
						int result = pstmt.executeUpdate();
						System.out.println(result>0 ? "�Է¼���" : "�Է½���");
					} catch (SQLException e) {
						System.out.println(e.getMessage());
					} finally {
						try {
							if(pstmt != null) pstmt.close();
							if(conn != null) conn.close();
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
				    break;				
					
						
				case 2 :
					// �������� �Է¹޾� ���,�̸�,����,����,����,���� ,���� ���
					String sql2 = "SELECT ROWNUM||'��'GRADE,pNAME,jNAME,KOR,ENG,MAT,(KOR+ENG+MAT)SUM" + 
							" FROM (SELECT pNAME||'('||PNO||'��)' pNAME, jNAME, KOR,ENG,MAT, (KOR+ENG+MAT)SUM" + 
							" FROM PERSON P, JOB J" + 
							" WHERE P.jNO = J.jNO AND JNAME = ? ORDER BY SUM DESC)";
					try {
						conn = DriverManager.getConnection(url,"scott","tiger");
						pstmt = conn.prepareStatement(sql2);
						System.out.println("�������� �Է��ϼ��� ");
						pstmt.setString(1, scanner.next());
						rs = pstmt.executeQuery();
					
						if(rs.next()) {
							System.out.println("���\t������\t����\t����\t����");
							do {
								int grade = rs.getInt("grade");
								pname = rs.getString("pname");
								jname = rs.getString("jname");
								kor = rs.getInt("kor");
								eng = rs.getInt("eng");
								mat = rs.getInt("mat");
								int sum = rs.getInt("sum");
								System.out.println(grade + "\t" + jname +"\t"+ kor+"\t"+eng+"\t"+mat+"\t"+sum);
							}while(rs.next());
						}else {
							System.out.println("�ش� ������ ����� �������� �ʽ��ϴ�");
						}
						
					} catch (SQLException e) {
						System.out.println(e.getMessage());
					}finally {
						try {
							if(rs!=null)rs.close();
							if(pstmt!=null) pstmt.close();
							if(conn!=null) conn.close();
						} catch (SQLException e) {
							
						}
					}
					break;
				case 3 : 
					break;
				}//switch
			}while(fn!=0);
			scanner.close();
				System.out.println("����Ǿ����ϴ�");
			
			}
		
}
