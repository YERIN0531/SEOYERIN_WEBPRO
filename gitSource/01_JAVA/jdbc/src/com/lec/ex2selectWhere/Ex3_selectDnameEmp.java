package com.lec.ex2selectWhere;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

/* 1. 사용자에게 부서명을 입력받아 
 * 	1-1. 부서명이 존재하는 경우 : 부서정보와 사원정보(사번, 이름, 급여, 급여등급)를 출력
 * 	1-2. 부서가 존재하지 않는 경우 : 없다고 출력   */
// 요구사항 파악후 query를 먼저 작성 
public class Ex3_selectDnameEmp {

	public static void main(String[] args) {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url 	  = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		
		Connection 	conn = null; //DB 연결 객체 변수 
		Statement 	stmt = null; //SQL 전송 객체 변수
		ResultSet 	rs 	 = null; //SELECT 결과 받을 변수 (select 전송받을 거 아니면 필요 없음)
		Scanner 	sc = new Scanner(System.in);
		System.out.print("원하는 부서명은 ? ");
		String dname = sc.next();
		String sql1 = "SELECT * FROM DEPT WHERE DNAME = UPPER('"+dname+"')";
		sql1 = String.format("SELECT * FROM DEPT WHERE DNAME = UPPER('%s')", dname);
		String sql2 = String.format("SELECT EMPNO, ENAME, SAL, GRADE" + 
				" FROM EMP E, SALGRADE, DEPT D" + 
				" WHERE SAL BETWEEN LOSAL AND HISAL AND E.DEPTNO=D.DEPTNO AND DNAME = UPPER('%s')", dname);
		
		try {
			Class.forName(driver);//(1)
			conn = DriverManager.getConnection(url,"scott","tiger"); //(2)
			stmt = conn.createStatement(); //(3)
			rs	 = stmt.executeQuery(sql1); //(4)+(5)
			if(rs.next()) {//(6) 해당부서명이 있는 경우 
				System.out.println("부서번호 : " + rs.getInt("deptno"));
				System.out.println("부서이름 : " + dname);
				System.out.println("부서위치 : " + rs.getString("loc"));
				rs.close();
				rs = stmt.executeQuery(sql2);
				if(rs.next()) { //해당부서명의 사원이 있는 경우 
					System.out.println("사번\t이름\t급여\t등급");
					System.out.println("============================");
					do {
						int empno = rs.getInt("empno");
						String ename = rs.getString("ename");
						int sal = rs.getInt("sal");
						int grade = rs.getInt("grade");
						//출력 
						System.out.println(empno+"\t"+ename+"\t"+sal+"\t"+grade+"등급");
					}while(rs.next());
				}else {// 해당부서명의 사원이 없는 경우 
					System.out.println(dname + "부서에는 사원이 존재하지 않습니다.");
				}
			}else {// 해당부서명이 없는 경우 
				System.out.println(dname + "은 없는 부서명입니다.");
			}
			
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			
				try {
					if(rs!=null) rs.close();
					if(stmt!=null) stmt.close();
					if(conn!=null) conn.close();
				} catch (SQLException e) {}
		}
	}
}















