package com.lec.member;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

public class MemberDao {

	public static final int SUCCESS = 1; //회원가입, 정보 수정시 성공 리턴값
	public static final int FAIL 	= 0; //회원가입, 정보 수정시 실패 리턴값
	public static final int MEMBER_EXISTENT = 0; // 중복된 ID일때 리턴값 
	public static final int MEMBER_NONEXISTENT = 1; // 사용가능한 ID일 때 리턴값 
	public static final int LOGIN_SUCCESS = 1; // 로그인 성공
	public static final int LOGIN_FAIL_ID = -1; // 로그인 오류(ID오류)
	public static final int LOGIN_FAIL_PW = 0;  // 로그인 오류(PW오류) 

	//싱글톤
	private static MemberDao instance; //자기가 자기 클래스 참조 
	public static MemberDao getInstance() {
		if(instance==null) {
			instance= new MemberDao();
		}
		return instance;
	}
	
	private MemberDao() {} //이걸 안쓰면 외부에서 new 해버릴 수 있어서 생성자 만든 것 
	
	//////////////////////////////////////////////////////////////////////////////////////////////////////
	// conn 객체 리턴하는 함수 
	public static Connection getConnection() throws Exception{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");
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





