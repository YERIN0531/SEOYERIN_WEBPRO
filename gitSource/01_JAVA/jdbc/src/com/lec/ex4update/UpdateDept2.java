package com.lec.ex4update;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

//sql문은 oracle에서 치고 가져와 
public class UpdateDept2 {

	public static void main(String[] args) {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url 	  = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		
		Scanner scanner = new Scanner(System.in);
		Connection conn = null;
		Statement stmt = null;
		//select 문 안쓸거라 resultSet 안해줄거임 
		//사용자에게 입력받은 후 sql 생성하자 
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,"scott","tiger");
			stmt = conn.createStatement();
			
			//사용자에게 입력받은 후 sql 작성 
			System.out.println("수정할 부서번호는 ? ");
			int deptno = scanner.nextInt();
			
			//입력한 부서번호가 있는지 없는지 체크 - 이번예제는 안할거  
			System.out.println("수정할 부서이름은 ? ");
			String dname = scanner.next();
			System.out.println("수정할 부서위치는 ? ");
			String loc = scanner.next();
			
			//sql문 만들기 
			String sql = "UPDATE DEPT SET DNAME = '"+dname+"', LOC ='"+loc+"' WHERE DEPTNO =" + deptno;
			int result = stmt.executeUpdate(sql);
			System.out.println(result >0 ? "수정성공" : "해당 부서는 존재 하지 않습니다");
			
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			
			try { //(7) 닫아주기
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {}
	}
		
	}
}























