package com.lec.ex2selectWhere;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

//사용자에게 원하는 부서번호를 입력받아 부서정보 출력 
public class Ex1_selectDeptno {

	public static void main(String[] args) {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url 	  = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		// sql 문 받기 전, 사용자에게 원하는 내용 먼저 
		Connection conn = null;
		Statement  stmt = null;
		ResultSet  rs	= null;
		Scanner	   sc	= new Scanner(System.in);
		System.out.print("원하는 부서번호는 ?");
		int deptno = sc.nextInt();
		String sql = "SELECT * FROM DEPT WHERE DEPTNO=" + deptno;
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, "scott", "tiger");
			stmt = conn.createStatement(); //3단계
			rs	 = stmt.executeQuery(sql); //4+5단계
			if(rs.next()) { // 해당부서가 있음 //6단계
				System.out.println(deptno+ "번 부서는 다음과 같습니다");
				System.out.println("부서이름 : " + rs.getString("dname"));
				System.out.println("부서위치 : " + rs.getString("loc"));
			}else { //해당부서가 없음 
				System.out.println(deptno + "번 부서는 존재하지 않습니다.");
			}
			
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {//7단계
				if(rs != null) rs.close();
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {}
		}
	}
}
