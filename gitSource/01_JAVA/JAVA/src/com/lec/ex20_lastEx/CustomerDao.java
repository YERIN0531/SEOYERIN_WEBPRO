package com.lec.ex20_lastEx;
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
	
	public static final int SUCCESS= 1;
	public static final int FAIL = 0;

	private static CustomerDao INSTANCE = null;
	
	public  static CustomerDao getInstance() {
		if(INSTANCE==null) {
			INSTANCE = new CustomerDao();	
		}
		return INSTANCE;
		
	}
	//driver 연결하기 
	private CustomerDao() {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		}
	}
	
	//0. 콤보박스에 고객등급리스트 넣어놓기
	public Vector<String> getLevelName(){
		Vector<String> lnamelist = new Vector<String>();
		lnamelist.add("");
		Connection conn = null;
		Statement  stmt = null;
		ResultSet  rs   = null;
		String sql = "SELECT LNAME FROM CUS_LEVEL";
		
		try {
			conn = DriverManager.getConnection(url,"scott","tiger");
			stmt = conn.createStatement();
			rs   = stmt.executeQuery(sql);
			while(rs.next()) {
				lnamelist.add(rs.getString("lname"));				
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs!=null) rs.close();
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return lnamelist;
	}
	
	//1. 아이디 검색 (if쓰자) cid
	public CustomerDto cidGetCustomer(int cid) {
		CustomerDto dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
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
				String ctel = rs.getString("ctel");
				String cname = rs.getString("cname");
				int point = rs.getInt("point");
				int amount = rs.getInt("amount");
				String lname = rs.getString("lname");
				int forlevelup = rs.getInt("forlevelup");
				dto = new CustomerDto(cid,ctel,cname,point,amount,lname,forlevelup);
			}
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		
		return dto;
	}
	
	//2. 폰4자리 검색
	public ArrayList<CustomerDto> ctelGetCustomer(String ctel){
		ArrayList<CustomerDto> dto = new ArrayList<CustomerDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT CID, CTEL, CNAME, POINT, AMOUNT, LNAME," + 
				" (SELECT HIGH-AMOUNT+1 FROM CUSTOMER WHERE CID=C.CID AND LNO!=5)forlevelUp" + 
				" FROM CUSTOMER C, CUS_LEVEL L" + 
				" WHERE C.LNO=L.LNO AND CTEL LIKE '%'||?";
		
		try {
			conn = DriverManager.getConnection(url,"scott","tiger");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ctel);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int 	cid = rs.getInt("cid");
				        ctel = rs.getString("ctel");
				String  cname = rs.getString("cname");
				int     point = rs.getInt("point");
				int amount = rs.getInt("amount");
				String lname = rs.getString("lname");
				int forlevelup = rs.getInt("forlevelup");
				dto.add(new CustomerDto(cid, ctel, cname, point, amount, lname, forlevelup));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		
		return dto;
	}
	
	//3. 고객이름검색
	public ArrayList<CustomerDto> cnameGetCustomer(String cname){
		ArrayList<CustomerDto> dto = new ArrayList<CustomerDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT CID, CTEL, CNAME, POINT, AMOUNT, LNAME," + 
				" (SELECT HIGH-AMOUNT+1 FROM CUSTOMER WHERE CID=C.CID AND LNO!=5) forlevelup" + 
				" FROM CUSTOMER C, CUS_LEVEL L" + 
				" WHERE C.LNO=L.LNO AND CNAME = ? ORDER BY AMOUNT DESC";
		
		try {
			conn = DriverManager.getConnection(url,"scott","tiger");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cname);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int 	cid = rs.getInt("cid");
				
				String  ctel = rs.getString("ctel");
//				  	    cname = rs.getString("cname");
				int     point = rs.getInt("point");				
				int amount = rs.getInt("amount");
				String lname = rs.getString("lname");
				int forlevelup = rs.getInt("forlevelup");
				dto.add(new CustomerDto(cid, ctel, cname, point, amount, lname, forlevelup));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return dto;
	}
	
	//4. 포인트로만 구매 //camount는 구매금액 말하는거 
	public int buyWithPoint(int cid, int camount) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE CUSTOMER" + 
				"    SET POINT = (POINT - ?)" + 
				"    WHERE CID=?";
		
		try {
			conn = DriverManager.getConnection(url,"scott","tiger");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, camount);
			pstmt.setInt(2, cid);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		
		return result;
	}
	//5. 물품구매
	public int buy (int cid, int camount) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE CUSTOMER SET POINT = POINT +(?*0.5)," + 
				"                    AMOUNT = AMOUNT +?," + 
				"                    LNO = (SELECT L.LNO" + 
				"                    FROM CUSTOMER C, CUS_LEVEL L" + 
				"                    WHERE AMOUNT+? BETWEEN LOW AND HIGH AND CID=?)" + 
				"    WHERE CID=?";
		
		try {
			conn = DriverManager.getConnection(url,"scott","tiger");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, camount);
			pstmt.setInt(2, camount);
			pstmt.setInt(3, camount);
			pstmt.setInt(4, cid);
			pstmt.setInt(5, cid);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		
		return result;
	}
	//6. 등급별출력
	public ArrayList<CustomerDto> lnameGetCustomer(String lname){
		ArrayList<CustomerDto> dto = new ArrayList<CustomerDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT CID, CTEL, CNAME, POINT, AMOUNT , LNAME," + 
				" (SELECT HIGH-AMOUNT+1 FROM CUSTOMER WHERE CID=C.CID AND LNO!=5)forlevelup" + 
				" FROM CUSTOMER C, CUS_LEVEL L" + 
				" WHERE C.LNO=L.LNO AND LNAME = ?";
		
		try {
			conn = DriverManager.getConnection(url,"scott","tiger");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, lname);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int 	cid = rs.getInt("cid");
				String  ctel = rs.getString("ctel");
				String  cname = rs.getString("cname");
				int     point = rs.getInt("point");
				int amount = rs.getInt("amount");
				lname = rs.getString("lname");
				int forlevelup = rs.getInt("forlevelup");
				dto.add(new CustomerDto(cid, ctel, cname, point, amount, lname, forlevelup));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return dto;
	}
	//7. 전체출력
	public ArrayList<CustomerDto> getCustomer(){
		ArrayList<CustomerDto> dto = new ArrayList<CustomerDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT CID, CTEL, CNAME, POINT, AMOUNT, LNAME," + 
				" (SELECT HIGH-AMOUNT+1 FROM CUSTOMER WHERE CID=C.CID AND LNO!=5)forlevelup" + 
				" FROM CUSTOMER C, CUS_LEVEL L" + 
				" WHERE C.LNO=L.LNO";
		
		try {
			conn = DriverManager.getConnection(url,"scott","tiger");
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int 	cid = rs.getInt("cid");
				String  ctel = rs.getString("ctel");
				String  cname = rs.getString("cname");
				int     point = rs.getInt("point");
				int amount = rs.getInt("amount");
				String lname = rs.getString("lname");
				int forlevelup = rs.getInt("forlevelup");
				dto.add(new CustomerDto(cid, ctel, cname, point, amount, lname, forlevelup));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return dto;
		
	}
	//8. 회원가입
	public int insertCustomer (String ctel, String cname) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO CUSTOMER (CID,CTEL,CNAME)" + 
				"    VALUES(CUS_SEQ.NEXTVAL,?,?)";
		
		try {
			conn = DriverManager.getConnection(url,"scott","tiger");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ctel);
			pstmt.setString(2, cname);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		
		
		
		
		
		
		return result;
	}
	//9. 번호수정
	public int updateCustomer (int cid, String ctel) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE CUSTOMER SET CTEL = ? WHERE CID=?";
		
		try {
			conn = DriverManager.getConnection(url,"scott","tiger");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ctel);
			pstmt.setInt(2, cid);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		
		return result;
	}
	//10.회원탈퇴 
	public int deleteCustomer (String ctel) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM CUSTOMER WHERE CTEL = ?";
		
		try {
			conn = DriverManager.getConnection(url,"scott","tiger");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ctel);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		
		return result;
	}
	
		
}//class























