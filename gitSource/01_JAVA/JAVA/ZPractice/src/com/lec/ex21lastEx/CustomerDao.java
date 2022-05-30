package com.lec.ex21lastEx;
//입력용 
//수정용
//출력용

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Vector;

public class CustomerDao {

	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url 	  = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	
	public static final int SUCCESS = 1;
	public static final int FAIL = 0;
	
	
	private static CustomerDao INSTANCE = new CustomerDao();
	public static CustomerDao getInstance() {
		return INSTANCE;
	}
	
	private CustomerDao() {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		}
	}
		
		//0 레벨이름들 검색하기 
		public Vector<String> getLevelNames(){
			Vector<String> lname = new Vector<String>();
			lname.add("");
			Connection conn = null;
			Statement  stmt = null;
			ResultSet  rs   = null;
			
			String sql = "SELECT LNAME FROM CUS_LEVEL";
			
			try {
				conn = DriverManager.getConnection(url,"scott","tiger");
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				while(rs.next()) {
					lname.add(rs.getString("lname"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				try {
					if(rs  !=null) rs.close();
					if(stmt!=null) stmt.close();
					if(conn!=null) conn.close();
				} catch (SQLException e2) {
					// TODO: handle exception
				}
			}//
			return lname;
		}
		//1 아이디 검색 
		public CustomerDto cidGetCustomer(int cid) {
			CustomerDto dto = null;
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet  rs   = null;
			
			String sql = "SELECT  CID, CTEL, CNAME, POINT, AMOUNT, LNAME," + 
					" (SELECT HIGH+1-AMOUNT FROM CUSTOMER WHERE CID=C.CID AND LNO!=5) forLevelUp" + 
					" FROM CUS_LEVEL L, CUSTOMER C" + 
					" WHERE C.LNO=L.LNO AND CID=?";
			
			try {
				conn = DriverManager.getConnection(url,"scott","tiger");
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, cid);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					String ctel     = rs.getString("ctel");
					String cname    = rs.getString("cname");
					int    cpoint   = rs.getInt("cpoint");
					int    camount  = rs.getInt("camount");
					String levelName= rs.getString("levelName");
					int    forLevelUp=rs.getInt("forLevelUp");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				try {
					if(rs  !=null) rs.close();
					if(pstmt!=null) pstmt.close();
					if(conn!=null) conn.close();
				} catch (SQLException e2) {
					// TODO: handle exception
				}
			}//
			return dto;
		}
		
		// 2. 폰 4자리 검색 
		public ArrayList<CustomerDto> ctelGetCustomer(String ctel){
			ArrayList<CustomerDto> dtos = new ArrayList<CustomerDto>();
			
			
			
			
			
			
			return dtos;
		}
		
}//class























