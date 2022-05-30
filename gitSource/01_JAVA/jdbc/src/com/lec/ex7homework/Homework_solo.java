package com.lec.ex7homework;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

// 1을 누르면 데이터 입력 -( 이름, 직업명,국어,영어,수학점수 입력받아) 
// 2를 누르면 원하는 직업명을 입력받아 직업별 조회 후 총점을 추가하여 총점이 높은 순으로 이름(번호)로 출력 - rownum 사용 (top_n구문) 등수 출력 sql
// 3을 누르면 입력된 사람 전체 조회(select) 총점을 추가하여 총점이 높은 순으로 출력 (order by sql)
public class Homework_solo {
	public static void main(String[] args) {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url 	  = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		
		Connection conn = null;
		Statement  stmt = null;
		ResultSet  rs   = null; //2번,3번을 위한 rs 
		PreparedStatement pstmt = null;
		Scanner scanner = new Scanner(System.in);
		
			int fn; //기능번호 (1:데이터입력 | 2:직업명입력 | 3:전체조회 | 0:종료)
			int idx;
			
			try {
				Class.forName(driver);
			} catch (ClassNotFoundException e) {
				System.out.println(e.getMessage());
			}
			
			do {
				
				System.out.println("1:데이터입력 | 2:직업명입력 | 3:전체조회 | 0:종료");
				fn = scanner.nextInt();
				switch(fn) {
				case 1 : //이름, 직업번호, 국어, 영어, 수학점수 입력받기
					System.out.println("이름을 입력하세요 ");
					String pname = scanner.next();
					System.out.println("직업을 입력하세요 ");
					String jname = scanner.next();
					System.out.println("국어점수 입력 ");
					int kor = scanner.nextInt();
					System.out.println("영어점수 입력");
					int eng = scanner.nextInt();
					System.out.println("수학점수 입력");
					int mat = scanner.nextInt();
					String sql = "INSERT INTO PERSON VALUES (PERSON_NO_SQ.NEXTVAL,?,(SELECT jNO FROM JOB WHERE JNAME=?),?,?,?)";	
					//2~7단계
					try {
						conn = DriverManager.getConnection(url,"scott","tiger");
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, pname);
						pstmt.setString(2, jname);
						pstmt.setInt(3, kor);
						pstmt.setInt(4, eng);
						pstmt.setInt(5, mat);
						int result = pstmt.executeUpdate();
						System.out.println(result>0 ? "입력성공" : "입력실패");
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
					// 직업명을 입력받아 등수,이름,직업,국어,영어,수학 ,총점 출력
					String sql2 = "SELECT ROWNUM||'등'GRADE,pNAME,jNAME,KOR,ENG,MAT,(KOR+ENG+MAT)SUM" + 
							" FROM (SELECT pNAME||'('||PNO||'번)' pNAME, jNAME, KOR,ENG,MAT, (KOR+ENG+MAT)SUM" + 
							" FROM PERSON P, JOB J" + 
							" WHERE P.jNO = J.jNO AND JNAME = ? ORDER BY SUM DESC)";
					try {
						conn = DriverManager.getConnection(url,"scott","tiger");
						pstmt = conn.prepareStatement(sql2);
						System.out.println("직업명을 입력하세요 ");
						pstmt.setString(1, scanner.next());
						rs = pstmt.executeQuery();
					
						if(rs.next()) {
							System.out.println("등수\t직업명\t국어\t영어\t수학");
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
							System.out.println("해당 직업의 사람이 존재하지 않습니다");
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
				System.out.println("종료되었습니다");
			
			}
		
}
