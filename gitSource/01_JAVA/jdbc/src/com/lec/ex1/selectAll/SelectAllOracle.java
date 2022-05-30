package com.lec.ex1.selectAll;
// sql�� ���� �ϴ� �� 
// statement ���� 
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
		
		Connection conn = null; //DB ���� ��ü ����(���߿� �ݾ���ߵ�)
		Statement  stmt = null;	//SQL ���� ��ü ����(���߿� �ݾ���ߵ�)
		ResultSet  rs 	= null; //SELECT�� ��� �޴� ��ü ���� (���߿� �ݾ���ߵ�)
		String query	= "SELECT * FROM EMP";
		
		try {
			Class.forName(driver); //(1) ����̹� �ε� 
			conn = DriverManager.getConnection(url, "scott", "tiger"); //(2) DB ���� 
			stmt = conn.createStatement(); //(3) SQL�� ���� ��ü ����
			//stmt �� ���� query�� ��ǵ� �� ����� rs�� ������ 
			rs = stmt.executeQuery(query); // (4) SQL ���� + (5) SQl ���� ��� �ޱ�  
										   // executeQuery : query�� �����ϴ� �Լ�
			//(6)rs�� ����Ű�� ���� �����Ͱ� ������ "����" ������ �ִ°� �Ѹ��� �� 
			// ��� �޾� ���ϴ� ���� ���� 
			// rs�� ��� �޾Ҵ��� �𸣴� while ���� �� ( ������ ���� �ض�)
			System.out.println("���\t�̸�\t��å\t\t�����\t�Ի���\t\t�޿�\t��\t�μ���ȣ"); //Ÿ��Ʋ���� �Ѹ��� 
			while(rs.next()) { 
				int empno 	 	= rs.getInt("empno"); //getInt() �ȿ��� title ���� 
												// empno�� ������ �Ͷ� 
//				String empno 	= rs.getString("empno"); //String���� ������ ���� �͵� ����  
				String ename 	= rs.getString("ename");
				String job 	 	= rs.getString("job");
				int	   mgr   	= rs.getInt("mgr");
				//hiredate�� date, String , Timestamp �� ��� ���� -> �����ϸ� String�� ���� ����  
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













