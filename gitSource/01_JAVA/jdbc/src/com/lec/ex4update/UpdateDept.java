package com.lec.ex4update;
// 수정하고자 하는 부서번호 입력 -> 존재하는 부서번호인지 체크 -> 부서명과 위치를 받아 수정 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

//sql문은 oracle에서 치고 가져와 
public class UpdateDept {

	public static void main(String[] args) {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url 	  = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		
		Scanner scanner = new Scanner(System.in);
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		//select 문 안쓸거라 resultSet 안해줄거임 
		//사용자에게 입력받은 후 sql 생성하자 
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,"scott","tiger");
			stmt = conn.createStatement();
			//사용자에게 입력받은 후 sql 작성 
			System.out.println("수정할 부서번호는 ? ");
			int deptno = scanner.nextInt();
			// 해당 부서번호가 있는지 체크 
			String selectSQL = "SELECT * FROM DEPT WHERE DEPTNO=" + deptno;
			//
			rs = stmt.executeQuery(selectSQL);
			
			if(rs.next()) {
			System.out.println("수정할 부서이름은 ? ");
			String dname = scanner.next();
			System.out.println("수정할 부서위치는 ? ");
			String loc = scanner.next();
			//sql문 만들기 
			String sql = "UPDATE DEPT SET DNAME = '"+dname+"', LOC ='"+loc+"' WHERE DEPTNO =" + deptno;
			int result = stmt.executeUpdate(sql);
			System.out.println(result >0 ? "수정성공" : "해당 부서는 존재 하지 않습니다");	
			}else {
				System.out.println("해당 부서번호는 존재하지 않는 부서번호 입니다 ");
			}
			
			
			
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			
			try { //(7) 닫아주기
				if(rs!=null) rs.close();
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {}
	}
		
	}
}























