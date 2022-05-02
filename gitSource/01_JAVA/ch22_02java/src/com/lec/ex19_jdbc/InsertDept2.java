package com.lec.ex19_jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;
//자바에서 INSERT 실행하면 자동 COMMIT이 됨 
// 부서번호를 입력받아 중복체크 확인 후 입력진행 
// while문 안쓴거 
public class InsertDept2 {

	public static void main(String[] args) {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url 	  = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		
		Connection conn = null;
		Statement  stmt = null;
		ResultSet  rs	= null;
		Scanner scanner = new Scanner(System.in);
		
		System.out.print("입력할 부서번호는 ? ");
		int deptno = scanner.nextInt();
		//부서번호 중복체크
		String selectSQL = "SELECT COUNT(*)CNT FROM DEPT WHERE DEPTNO=" + deptno;
		//1~7단계 까지 
		try {
			Class.forName(driver); //(1)
			conn = DriverManager.getConnection(url,"scott","tiger"); //(2)
			stmt = conn.createStatement(); //(3)
			rs   = stmt.executeQuery(selectSQL); //(4),(5)
			rs.next(); //한번은 실행해야 0이든 1이든 나옴 
			int cnt = rs.getInt("cnt"); // 0과 1을 담을 그릇 
			if(cnt!=0) {
				System.out.println("중복된 부서번호는 입력이 불가합니다.");
			}else {
				System.out.print("입력할 부서이름은? ");
				String dname = scanner.next();
				System.out.print("입력할 부서위치는? ");
				String loc = scanner.next();
				//sql문 만들기
				String sql = "INSERT INTO DEPT VALUES ("+deptno+",'"+dname+"','"+loc+"')";
				sql = String.format("INSERT INTO DEPT VALUES (%d,'%s','%s')", deptno, dname, loc);
				int result = stmt.executeUpdate(sql); // rs 변수 안만들어 줬으니, result라는 정수 변수 만들어줘서 여기다가 sql 넣어주자 
				System.out.println(result>0 ? "입력성공" : "입력실패 "); // 0행이면 실패한거 n행 추가가 되어야 입력성공 

			} //else
			scanner.close();
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println("SQL오류:" + e.getMessage());
		}finally {
			
			try { //(7) 닫아주기
				if(rs  !=null) rs.close();
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {}
	}
		
	}
}
























