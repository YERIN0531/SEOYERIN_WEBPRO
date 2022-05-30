package com.lec.ex2selectWhere;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

/* 1. 사용자에게 부서번호 입력받아 
 * 	1-1. 해당부서번호가 존재할 경우 : 해당부서정보와 해당부서 사원(사번,이름,급여,상사명)을 출력 
 * 	1-2. 해당부서번호가 존재하지 않을 경우 : 없다고 출력 */
public class Ex2_selectDeptnoEmp {

	public static void main(String[] args) {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url 	  = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		
		Connection conn = null;
		Statement  stmt = null;
		ResultSet  rs	= null;
		Scanner	   sc	= new Scanner(System.in);
		System.out.print("원하는 부서번호는 ?");
		int deptno = sc.nextInt();
		String sql1 = "SELECT * FROM DEPT WHERE DEPTNO=" + deptno;
		String sql2 = "SELECT W.EMPNO, W.ENAME, W.SAL, M.ENAME MANAGER" + 
				" FROM EMP W, EMP M" + 
				" WHERE W.MGR = M.EMPNO AND W.DEPTNO=" + deptno;
		
		try {
			Class.forName(driver); //(1)
			conn = DriverManager.getConnection(url, "scott","tiger"); //(2)
			stmt = conn.createStatement();//(3)
			rs	 = stmt.executeQuery(sql1); //1번쿼리 실행 (4)+(5)
			
			if(rs.next()) {// 해당 부서번호가 있음 : 부서정보 출력, 해당부서 사원정보 출력   // 얘는 while 안쓰는 이유 : 한 행만 출력할거라 
				System.out.println("부서번호 : " + deptno);
				System.out.println("부서이름 : " + rs.getString("dname"));
				System.out.println("부서위치 : " + rs.getString("loc"));
				rs.close(); // rs 또 받으려고 앞 전 rs를 클로즈 해주는 것 : 안해도 되긴 함 
				rs = stmt.executeQuery(sql2); //empno, ename, sal, manager 
				if(rs.next()) {
					System.out.println("사번\t이름\t급여\t상사명");
					do {
						int empno		= rs.getInt("empno");
						String ename	= rs.getString("ename");
						int sal			= rs.getInt("sal");
						String manager	= rs.getString("manager");
						//출력
						System.out.println(empno+"\t"+ename+"\t"+sal+"\t"+manager);
					}while(rs.next());
				}else {
					System.out.println(deptno + "번 부서 사원은 없습니다.");
				}// sql2 else 
				
				
			}else {// 해당 부서번호가 없음 
				System.out.println(deptno + "번 부서는 유효하지 않습니다.");
			}
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {//7단계
				if(rs != null) rs.close();
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {}
		}
		
	}
}

















