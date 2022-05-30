package com.lec.ex1.selectAll;
// sql문 전송 하는 것 
// statement 생성 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;

public class SelectAllOracle {

	public static void main(String[] args) {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url 	  = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		
		Connection conn = null; //DB 연결 객체 변수(나중에 닫아줘야됨)
		Statement  stmt = null;	//SQL 전송 객체 변수(나중에 닫아줘야됨)
		ResultSet  rs 	= null; //SELECT문 결과 받는 객체 변수 (나중에 닫아줘야됨)
		String query	= "SELECT * FROM EMP";
		
		try {
			Class.forName(driver); //(1) 드라이버 로드 
			conn = DriverManager.getConnection(url, "scott", "tiger"); //(2) DB 연결 
			stmt = conn.createStatement(); //(3) SQL문 전송 객체 생성
			//stmt 를 통해 query를 쏠건데 그 결과를 rs에 보낼것 
			rs = stmt.executeQuery(query); // (4) SQL 전송 + (5) SQl 전송 결과 받기  
										   // executeQuery : query를 전송하는 함수
			//(6)rs가 가르키는 곳에 데이터가 없으면 "없음" 있으면 있는걸 뿌리면 됨 
			// 결과 받아 원하는 로직 수행 
			// rs가 몇개를 받았는지 모르니 while 문을 써 ( 끝날때 까지 해라)
			System.out.println("사번\t이름\t직책\t\t상사사번\t입사일\t\t급여\t상여\t부서번호"); //타이틀먼저 뿌리기 
			while(rs.next()) { 
				int empno 	 	= rs.getInt("empno"); //getInt() 안에는 title 쓰자 
												// empno를 가지고 와라 
//				String empno 	= rs.getString("empno"); //String으로 가지고 오는 것도 가능  
				String ename 	= rs.getString("ename");
				String job 	 	= rs.getString("job");
				int	   mgr   	= rs.getInt("mgr");
				//hiredate는 date, String , Timestamp 형 모두 가능 -> 웬만하면 String은 쓰지 말자  
//				Date   hiredate = rs.getDate("hiredate");
//				String hiredate = rs.getString("hiredate");
				Timestamp hiredate = rs.getTimestamp("hiredate");
				int	   sal		= rs.getInt("sal");
				int	   comm		= rs.getInt("comm");
				int	   deptno	= rs.getInt("deptno");
				if(job.length()>=8) {
					System.out.printf("%d\t%s\t%s\t%d\t%TF\t%d\t%d\t%d\n",
							  empno, ename, job, mgr, hiredate, sal, comm, deptno);
				}else {
					System.out.printf("%d\t%s\t%s\t\t%d\t%TF\t%d\t%d\t%d\n",
							  empno, ename, job, mgr, hiredate, sal, comm, deptno);	
				}
				
				
			}// while
			
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs  !=null) rs.close();
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {}
		} // try- catch
	}//main
}//class













