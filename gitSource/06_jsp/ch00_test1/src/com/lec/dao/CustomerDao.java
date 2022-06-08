package com.lec.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.lec.dto.CustomerDto;

public class CustomerDao {
	
	//회원가입 , 정보수정
	public static final int SUCCESS = 1;
	public static final int FAIL = 0;
	
	//로그인 성공 로그인 실패 
	public static final int LOGIN_SUCCESS = 1;
	public static final int LOGIN_FAIL = 0;
	
	//중복된 아이디 체크 
	public static final int CUSTOMER_NONEXIST = 1;
	public static final int CUSTOMER_EXIST = 0;
	
	private static CustomerDao instance;  
	public static CustomerDao getInstance() {
		if(instance==null) {
			instance= new CustomerDao();
		}
		return instance;
	}
	
	private CustomerDao() {} 
	
	private static Connection getConnection() throws SQLException{
		Connection conn = null; 
		 try {
			Context ctx = new InitialContext();//Context 임폴트 : java.naming
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
			conn = ds.getConnection(); 
		} catch (NamingException e) {
			System.out.println("커넥션풀이름 오류 : " + e.getMessage());
		} 
		return conn;
	}
	
	
	//1. 회원가입시 ID 중복 체크를 위한 SQL : public int confirmID(String cid)
	public int confirmId(String cid) {
		int result = CUSTOMER_EXIST;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="SELECT cID, CPW FROM CUSTOMER WHERE cID=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = CUSTOMER_EXIST;
			}else {
				result = CUSTOMER_NONEXIST;
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	
	//2. 회원가입 SQL : public int joinCustomer(CustomerDto dto)
	public int joinCustomer(CustomerDto dto) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO CUSTOMER (cID, CPW, cNAME, cTEL, cMAIL, cADDRESS, cGENDER, cBIRTH, cRDATE)" + 
				" VALUES(?,?,?,?,?,?,?,?,SYSDATE)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getCid());
			pstmt.setString(2, dto.getCpw());
			pstmt.setString(3, dto.getCname());
			pstmt.setString(4, dto.getCtel());
			pstmt.setString(5, dto.getCmail());
			pstmt.setString(6, dto.getCaddress());
			pstmt.setString(7, dto.getCgender());
			pstmt.setTimestamp(8, dto.getCbirth());
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS?"회원가입성공":"회원가입실패");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	//3. 로그인(id/pw) SQL : public int loginCheck (String cid, String cpw) 
	public int loginCheck(String cid, String cpw) {
		int result = LOGIN_FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT cID, CPW FROM CUSTOMER WHERE cID=?";
		
		try {
			conn=getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cid);
			rs = pstmt.executeQuery();
			if(rs.next()) { //유효한 아이디와 비밀번호
				 String pwDB = rs.getString("cpw"); 
				 if(pwDB.equals(cpw)) { 
					 result =LOGIN_SUCCESS; 
				 }else { //로그인 실패 - 데이터베이스에 존재하지 않음  
				result = LOGIN_FAIL; }
				 
			}else {//로그인 실패 - 데이터베이스에 존재하지 않음 
				result = LOGIN_FAIL;
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
		
	//4. ID로 dto 가져오기  : public CustomerDto getCustomer(String cid)
		public CustomerDto getCustomer(String cid) {
			CustomerDto dto = null;
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "SELECT * FROM CUSTOMER WHERE cID=?";
			
			try {
				conn =getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, cid);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					String cpw = rs.getString("cpw");
					String cname = rs.getString("cname");
					String ctel = rs.getString("ctel");
					String cmail = rs.getString("cmail");
					String caddress = rs.getString("caddress");
					String cgender = rs.getString("cgender");
					Timestamp cbirth = rs.getTimestamp("cbirth");
					Date crdate = rs.getDate("crdate");
					dto = new CustomerDto(cid, cpw, cname, ctel, cmail, caddress, cgender, cbirth, crdate);
				}
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}finally {
				try {
					if(rs!=null) rs.close();
					if(pstmt!=null)pstmt.close();
					if(conn!=null)conn.close();
				} catch (SQLException e) {
					System.out.println(e.getMessage());
				}
			}
			return dto;
		}
	//5. 회원정보 수정 (modify) : public CustomerDto modifyCustomer (CustomerDto dto)
		public int modifyCustomer(CustomerDto dto) {
			int result = FAIL;
			Connection conn = null;
			PreparedStatement pstmt = null;
			String sql = "UPDATE CUSTOMER SET CPW=?," + 
					"                  cNAME =?," + 
					"                  cTEL = ?," + 
					"                  cGENDER =?," + 
					"                  cMAIL =?," + 
					"                  cBIRTH =?," + 
					"                  cADDRESS =?" + 
					"                  WHERE cID=?";
			
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dto.getCpw());
				pstmt.setString(2, dto.getCname());
				pstmt.setString(3, dto.getCtel());
				pstmt.setString(4, dto.getCgender());
				pstmt.setString(5, dto.getCmail());
				pstmt.setTimestamp(6, dto.getCbirth());
				pstmt.setString(7, dto.getCaddress());
				pstmt.setString(8, dto.getCid());
				result = pstmt.executeUpdate();
				System.out.println(result==SUCCESS?"정보수정성공":"정보수정실패");
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}finally {
				try {
					if(pstmt!=null)pstmt.close();
					if(conn!=null)conn.close();
				} catch (SQLException e) {
					System.out.println(e.getMessage());
				}
			}
			return result;
		}
	
	
	
	
	
}//class
