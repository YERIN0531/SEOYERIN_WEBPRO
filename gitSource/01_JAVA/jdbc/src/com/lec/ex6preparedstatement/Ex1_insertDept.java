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
		
		// 추가할 데이터 받기 (?안에 들어갈  데이터의 변수 생성해주는 것 ) 
		
		System.out.print("추가할 부서번호 ? ");
		int deptno = scanner.nextInt();
		
		//아래 변수들 원래 위에다가 선언하는게 맞지만, 선생님 화면상 잘 보이기 위해서 여기다가 선언 
		
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
				
					System.out.println("이미 존재하는 부서번호입니다");
					
				
			}else {
				pstmt.close();
				System.out.print("추가할 부서이름 ? ");
				String dname = scanner.next();
				System.out.print("추가할 부서위치 ? ");
				String loc = scanner.next();
				String sql = "INSERT INTO DEPT VALUES (?,?,?)";
				pstmt = conn.prepareStatement(sql); // stmt 스타일이랑은 다름. pstmt는 sql문을 넣어줘야됨
				// SQL전송객체 
				pstmt.setInt(1, deptno); // sql의 첫번째 물음표에 int값으로 depno가 들어감
				pstmt.setString(2, dname);
				pstmt.setString(3, loc);
				int result = pstmt.executeUpdate();
				// int result = stmt.executeUpdate(sql);  
				System.out.println(result>0 ? "입력성공" : "입력실패");
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

