package com.lec.test0428;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.spi.DirStateFactory.Result;

public class CustomerDao {

	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url 	  = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	
	public static final int SUCCESS= 1;
	public static final int FAIL = 0;

	private static CustomerDao INSTANCE = null;
	
	public  static CustomerDao getInstance() {
		if(INSTANCE==null) {
			INSTANCE = new CustomerDao();	
		}
		return INSTANCE;
	}
	
	private CustomerDao() {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		}
	} // Class.forname
	
	//1. 가입하기(회원가입)
	public int insertCustomer (String ctel, String cname) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO CUSTOMER (CNO, CTEL, CNAME) VALUES (CUS_SEQ.NEXTVAL,?,?)";
		
		try {
			conn = DriverManager.getConnection(url,"scott","tiger");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ctel);
			pstmt.setString(2, cname);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(pstmt != null)pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		
		return result;
	}
	
	//2. 폰조회
	public ArrayList<CustomerDto> ctelGetCustomer(String ctel){
		ArrayList<CustomerDto> dtos = new ArrayList<CustomerDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM CUSTOMER WHERE CTEL LIKE '%'||?";
		
		try {
			conn = DriverManager.getConnection(url,"scott","tiger");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ctel);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int cno = rs.getInt("cno");
				    ctel = rs.getString("ctel");
				String cname = rs.getString("cname");
				int point = rs.getInt("point");
				dtos.add(new CustomerDto(cno, ctel, cname, point));
			}	
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt != null)pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return dtos;
	}
	//3. 출력버튼
	public ArrayList<CustomerDto> getCustomer(){
		ArrayList<CustomerDto> dtos = new ArrayList<CustomerDto>();
		Connection conn = null;
		Statement  stmt = null;
		ResultSet  rs   = null;
		String sql = "SELECT * FROM CUSTOMER";
		
		try {
			conn = DriverManager.getConnection(url,"scott","tiger");
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				int cno = rs.getInt("cno");
				String ctel = rs.getString("ctel");
				String cname = rs.getString("cname");
				int point = rs.getInt("point");
				dtos.add(new CustomerDto(cno, ctel, cname, point));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs!=null) rs.close();
				if(stmt != null)stmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		
		
		return dtos;
	}
	//4. 종료버튼 
	
	
	
	
	
	
	
	
	
	
	
	
	
}













