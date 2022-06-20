package com.lec.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.lec.dto.MemberDto;

public class MemberDao {
	//회원가입 회원정보 수정 
	public final static int SUCCESS = 1;
	public final static int FAIL = 0;
	
	//로그인 성공시
	public final static int LOGIN_SUCCESS = 1;
	public final static int LOGIN_FAIL = 0;
	
	//중복된 아이디 체크 
	public static final int MEMBER_EXISTENT = 0; // 중복된 ID일때 리턴값 
	public static final int MEMBER_NONEXISTENT = 1; // 사용가능한 ID일 때 리턴값 
	
	private static MemberDao instance; //자기가 자기 클래스 참조 
	public static MemberDao getInstance() {
		if(instance==null) {
			instance= new MemberDao();
		}
		return instance;
	}

	private Connection getConnection() throws SQLException {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/Oracle11g");
			conn = ds.getConnection();
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}

//	 1. 회원가입 중복 확인
	public int confirmId(String mid) {
		int result = MEMBER_EXISTENT;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM MVC_MEMBER WHERE MID=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = MEMBER_EXISTENT;
			}else {
				result = MEMBER_NONEXISTENT;
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt !=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
//	 2. 회원가입
	public int JoinMember(MemberDto dto) {
		int result=FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO MVC_MEMBER(MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)" + 
				"    VALUES(?, ?, ?, ?,?,?,?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMid());
			pstmt.setString(2, dto.getMpw());
			pstmt.setString(3, dto.getMname());
			pstmt.setString(4, dto.getMemail());
			pstmt.setString(5, dto.getMphoto());
			pstmt.setDate(6, dto.getMbirth());
			pstmt.setString(7, dto.getMaddress());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt !=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}		
		return result;
	}
//	 3. 로그인(ID,PW)
	public int loginCheck(String mid, String mpw) {
		int result = LOGIN_FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM MVC_MEMBER WHERE MID=? AND MPW=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, mpw);
			rs = pstmt.executeQuery();
			if(rs.next()) {
			 result = LOGIN_SUCCESS;
			}else {
				result=LOGIN_FAIL;
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt !=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
//	 4. 회원목록LIST
		public ArrayList<MemberDto> listMember(int startRow, int endRow){
			ArrayList<MemberDto> dtos = new ArrayList<MemberDto>();
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "SELECT * FROM (SELECT ROWNUM RN, A.*" + 
					" FROM (SELECT * FROM MVC_MEMBER ORDER BY MRDATE DESC)A)" + 
					" WHERE RN BETWEEN ? AND ?";
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					 String mid = rs.getString("mid");
					 String mpw = rs.getString("mpw");
					 String mname = rs.getString("mname");
					 String memail = rs.getString("memail");
					 String mphoto = rs.getString("mphoto");
					 Date mbirth = rs.getDate("mbirth");
					 String maddress = rs.getString("maddress");
					 Date mrdate = rs.getDate("mrdate");
					dtos.add(new MemberDto(mid, mpw, mname, memail, mphoto, mbirth, maddress, mrdate));
				}
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}finally {
				try {
					if(rs!=null)rs.close();
					if(pstmt !=null)pstmt.close();
					if(conn!=null)conn.close();
				} catch (SQLException e) {
					System.out.println(e.getMessage());
				}
			}
			return dtos;
		}
//	 5. ID로 DTO 가져오기
		public MemberDto getMember(String mid) {
			MemberDto member = null;
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "SELECT * FROM MVC_MEMBER WHERE MID=?";
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mid);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					 String mpw = rs.getString("mpw");
					 String mname = rs.getString("mname");
					 String memail = rs.getString("memail");
					 String mphoto = rs.getString("mphoto");
					 Date mbirth = rs.getDate("mbirth");
					 String maddress = rs.getString("maddress");
					 Date mrdate = rs.getDate("mrdate");
					member = new MemberDto(mid, mpw, mname, memail, mphoto, mbirth, maddress, mrdate);
				}
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}finally {
				try {
					if(rs!=null)rs.close();
					if(pstmt !=null)pstmt.close();
					if(conn!=null)conn.close();
				} catch (SQLException e) {
					System.out.println(e.getMessage());
				}
			}
			
			return member;
		}
//	 6. 회원정보 수정
		public int deleteMember(MemberDto dto) {
			int result=FAIL;
			Connection conn = null;
			PreparedStatement pstmt = null;
			String sql = "UPDATE MVC_MEMBER SET MPW=?," + 
					"                      MNAME=?," + 
					"                      MEMAIL=?," +
					"                      MBIRTH=?," + 
					"                      MADDRESS=?," + 
					"                      MPHOTO=?" +
					"                      WHERE MID = ?";
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dto.getMpw());
				pstmt.setString(2, dto.getMname());
				pstmt.setString(3, dto.getMemail());
				pstmt.setDate(4, dto.getMbirth());
				pstmt.setString(5, dto.getMaddress());
				pstmt.setString(6, dto.getMphoto());
				pstmt.setString(7, dto.getMid());
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}finally {
				try {
					if(pstmt !=null)pstmt.close();
					if(conn!=null)conn.close();
				} catch (SQLException e) {
					System.out.println(e.getMessage());
				}
			}		
			return result;
		}
//	 7. 등록된 회원수
		public int getMemberToCnt(){
			int toCnt = 0;
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "SELECT COUNT(*) CNT FROM MVC_MEMBER";
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				rs.next();
				toCnt = rs.getInt("cnt");
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}finally {
				try {
					if(rs!=null)rs.close();
					if(pstmt !=null)pstmt.close();
					if(conn!=null)conn.close();
				} catch (SQLException e) {
					System.out.println(e.getMessage());
				}
			}
			
			return toCnt;
		}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
