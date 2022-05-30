package com.lec.ex3insert;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;
//자바에서 INSERT 실행하면 자동 COMMIT이 됨 

public class InsertDept {

	public static void main(String[] args) {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url 	  = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		
		Scanner scanner = new Scanner(System.in);
		System.out.print("입력할 부서번호는 ? ");
		int deptno = scanner.nextInt();
		System.out.print("입력할 부서이름은? ");
		String dname = scanner.next();
		System.out.print("입력할 부서위치는? ");
		String loc = scanner.next();
		//sql문 만들기
		String sql = "INSERT INTO DEPT VALUES ("+deptno+",'"+dname+"','"+loc+"')";
		sql = String.format("INSERT INTO DEPT VALUES (%d,'%s','%s')", deptno, dname, loc);
		
		Connection conn = null;
		Statement  stmt = null;
		//select 아니니까 resultSet 안해줘도됨 
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,"scott","tiger");
			stmt = conn.createStatement();
			int result = stmt.executeUpdate(sql); // rs 변수 안만들어 줬으니, result라는 정수 변수 만들어줘서 여기다가 sql 넣어주자 
			System.out.println(result>0 ? "입력성공" : "입력실패 "); // 0행이면 실패한거 n행 추가가 되어야 입력성공 
		
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println("SQL오류:" + e.getMessage());
		}finally {
			
			try { //(7) 닫아주기 
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {}
	}
		
	}
}
























