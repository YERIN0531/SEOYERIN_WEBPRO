package com.lec.member;

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

public class MemberDaoConn {

	public static final int SUCCESS = 1; //회원가입, 정보 수정시 성공 리턴값
	public static final int FAIL 	= 0; //회원가입, 정보 수정시 실패 리턴값
	public static final int MEMBER_EXISTENT = 0; // 중복된 ID일때 리턴값 
	public static final int MEMBER_NONEXISTENT = 1; // 사용가능한 ID일 때 리턴값 
	public static final int LOGIN_SUCCESS = 1; // 로그인 성공
	public static final int LOGIN_FAIL_ID = -1; // 로그인 오류(ID오류)
	public static final int LOGIN_FAIL_PW = 0;  // 로그인 오류(PW오류) 

	
	// conn 객체 리턴하는 함수 
	private static Connection getConnection() throws SQLException{
		// 커넥션 객체를 생성하는게 아니라, 커넥션 풀에 있는 DataSource안의 conn객체 이용
		// 리턴변수 만들어 놓기 
		Connection conn = null; 
		// 커넥션 풀에 있는 데이터 소스를 가지고오고 커넥션 객체를 가져와야함 
		// 데이터 소스로 매핑되어 있는 커넥션 객체 필요 
		 try {
			// 데이터 소스 가져오기 - Context : 컨텍스트 풀에 있는 애 하나 가져와 
			Context ctx = new InitialContext();//Context 임폴트 : java.naming
			//ctx라는 객체를 통해 소스 가져올 것 
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g"); // 얘 리턴 타입은 object임
			//conn객체 가져오기 
			conn = ds.getConnection(); // 가지고는 왔는데, 내가 drivername,password등을잘못 쳤을수도 있음 thorow 혹은 try-catch해줘야됨
		} catch (NamingException e) {
			System.out.println("커넥션풀이름 오류 : " + e.getMessage());
		} 
		return conn;
	}
	//1. 회원가입시 ID 중복 체크를 위한 SQL : public int confirmID(String id)
	public int confirmID(String id) {
		int result =MEMBER_EXISTENT;
		Connection 			conn  = null;
		PreparedStatement 	pstmt = null;
		ResultSet			rs    = null;
		String sql = "SELECT * FROM MEMBER WHERE ID=?";
		
		try {
			conn  = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs    = pstmt.executeQuery();
			if(rs.next()) {
				result = MEMBER_EXISTENT;
			}else {// 사용자가없을때 
				result = MEMBER_NONEXISTENT;
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
		
		return result;
	}
	//2. 회원가입 SQL : public int joinMember(MemberDto dto)
	public int joinMember(MemberDto dto) {
		int result = FAIL;
		Connection		  conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO MEMBER (ID, PW, NAME, PHONE1, PHONE2, PHONE3, GENDER, EMAIL, BIRTH, RDATE, ADDRESS) " + 
				" VALUES(?,?,?,?,?,?,?,?,?,sysdate,?)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getPhone1());
			pstmt.setString(5, dto.getPhone2());
			pstmt.setString(6, dto.getPhone3());
			pstmt.setString(7, dto.getGender());
			pstmt.setString(8, dto.getEmail());
			pstmt.setTimestamp(9, dto.getBirth());
			pstmt.setString(10, dto.getAddress());
			result=pstmt.executeUpdate();
			if(result==SUCCESS) {
				System.out.println("회원가입 성공");
			}else {
				System.out.println("회원가입 실패");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("회원가입 실패 : " + dto.toString()); //왜 실패했는지 toString 해주면 나옴 
		} finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
		return result;
	}
	//3. 로그인(id/pw) SQL : public int loginCheck (String id, String pw)
	public int loginCheck(String id, String pw) {
		int result = LOGIN_FAIL_ID;
		Connection		  conn = null;
		PreparedStatement pstmt = null;
		ResultSet		  rs    = null;
		String sql = "SELECT ID, PW FROM MEMBER WHERE ID=?";
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs  = pstmt.executeQuery();
			if(rs.next()) { //사용자가 있을 때 (아이디 유무)
				String dbpw = rs.getString("pw");
				if(dbpw.equals(pw)) {
					result=LOGIN_SUCCESS;
				}else {
					result=LOGIN_FAIL_PW;
				}
			}else {// 사용자가없을때 
				result = LOGIN_FAIL_ID;
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
		return result;
	}
	//4. ID로 dto 가져오기  : public MemberDto getMember(String id)
	public MemberDto getMember(String id) {
		MemberDto dto = null;
		Connection 			conn  = null;
		PreparedStatement 	pstmt = null;
		ResultSet			rs    = null;
		String sql = "SELECT * FROM MEMBER WHERE ID=?";
		
		try {
			conn  = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs    = pstmt.executeQuery();
			if(rs.next()) {
				 String pw = rs.getString("pw");
				 String name= rs.getString("name");
				 String phone1= rs.getString("phone1");
				 String phone2= rs.getString("phone2");
				 String phone3= rs.getString("phone3");
				 String gender= rs.getString("gender");
				 String email= rs.getString("email");
				 Timestamp   birth= rs.getTimestamp("birth"); //입력 받는 곳은 편하려면 date형 하지만 우린 timestamp 써볼것 
				 Date   rdate = rs.getDate("rdate"); //rdate는 사용자에게 받는 아이가 아니기 때문에 timestamp로 하던, string으로 하던 date로 하던 상관 없음
				 String address= rs.getString("address");
				 dto = new MemberDto(id, pw, name, phone1, phone2, phone3, gender, email, birth, rdate, address);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
	
		return dto;
	}
	//5. 회원정보 수정 (modify) : public MemberDto modifyMember (MemberDto dto)	
	public int modifyMember (MemberDto dto) {
		int result = FAIL;
		Connection		  conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE MEMBER SET PW=?," + 
				"                  NAME =?," + 
				"                  PHONE1 =?," + 
				"                  PHONE2 =?," + 
				"                  PHONE3 =?," + 
				"                  GENDER =?," + 
				"                  EMAIL =?," + 
				"                  BIRTH =?," + 
				"                  ADDRESS =?" + 
				"                  WHERE ID=?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPw());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getPhone1());
			pstmt.setString(4, dto.getPhone2());
			pstmt.setString(5, dto.getPhone3());
			pstmt.setString(6, dto.getGender());
			pstmt.setString(7, dto.getEmail());
			pstmt.setTimestamp(8, dto.getBirth());
			pstmt.setString(9, dto.getAddress());
			pstmt.setString(10, dto.getId());
			result=pstmt.executeUpdate();
			if(result==SUCCESS) {
				System.out.println("정보수정 성공");
			}else {
				System.out.println("정보수정 실패");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("정보수정 실패 : " + dto.toString()); //왜 실패했는지 toString 해주면 나옴 
		} finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
		return result;
	}

}//MemberDao





