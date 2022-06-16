package com.lec.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.lec.dto.BoardDto;

public class BoardDao {
	public final static int SUCCESS = 1; //글등록 성공
	public final static int FAIL    = 0; //글 등록 실패 
	//connection 풀의 connection 객체를 안고 있는 아이가 datasource 임
	private DataSource ds; // 초기화 해주지 않아도 이미 null이 잡혀 있음 
	
	private static BoardDao instance = new BoardDao();
	public static BoardDao getInstance() {
		return instance;
	}

	private BoardDao() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
	}
	
	
//	 1. 글목록(startRow ~ endRow)
	public ArrayList<BoardDto> listboard(int startRow, int endRow){
		ArrayList<BoardDto> dtos = new ArrayList<BoardDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM BOARD ORDER BY BGROUP DESC, BSTEP) A)" + 
				   " WHERE RN BETWEEN ? AND ?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				 int bid = rs.getInt("bid");
				 String bname = rs.getString("bname");
				 String btitle = rs.getString("btitle");
				 String bcontent = rs.getString("bcontent");
				 Date bdate = rs.getDate("bdate"); //date를 조금 더 자주 쓰는 편이긴 하지만 다 자주 씀 
				 int bhit = rs.getInt("bhit");
				 int bgroup = rs.getInt("bgroup");
				 int bstep = rs.getInt("bstep");
				 int bindent = rs.getInt("bindent");
				 String bip = rs.getString("bip"); 
				 dtos.add(new BoardDto(bid, bname, btitle, bcontent, bdate, bhit, bgroup, bstep, bindent, bip));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return dtos;
	}
	
//	 전체 글 갯수
	public int getBoardTotalCnt() {
		int toCnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="SELECT COUNT(*) FROM BOARD";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			toCnt = rs.getInt(1);
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return toCnt;
	}
//	 원글쓰기 (매개변수에 dto 안넣고 직접 매개변수 써도 됨 )
	public int insertBoard(String bname, String btitle, String bcontent, String bip) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql="INSERT INTO BOARD (BID, BNAME, BTITLE, BCONTENT, BGROUP, BSTEP, BINDENT, BIP)" + 
				"    VALUES(BOARD_SEQ.NEXTVAL, ?, ?, ?, BOARD_SEQ.CURRVAL, 0,0,?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bname);
			pstmt.setString(2, btitle);
			pstmt.setString(3, bcontent);
			pstmt.setString(4, bip);
			result = pstmt.executeUpdate();
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
//	bid 조회수 올리기(private)
	private void hitUp(int bid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql="UPDATE BOARD SET BHIT = BHIT + 1 WHERE BID=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bid);
			pstmt.executeUpdate();
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
	}
//	(bid로 dto 가져오기) == 글 상세보기(조회수올리기 포함)
	public BoardDto contentView(int bid) {
		BoardDto dto = null;
		hitUp(bid); //글 상세보기시 자동적으로 hitUp
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="SELECT * FROM BOARD WHERE BID = ?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				 //bid = rs.getInt("bid");
				 String bname = rs.getString("bname");
				 String btitle = rs.getString("btitle");
				 String bcontent = rs.getString("bcontent");
				 Date bdate = rs.getDate("bdate"); //date를 조금 더 자주 쓰는 편이긴 하지만 다 자주 씀 
				 int bhit = rs.getInt("bhit");
				 int bgroup = rs.getInt("bgroup");
				 int bstep = rs.getInt("bstep");
				 int bindent = rs.getInt("bindent");
				 String bip = rs.getString("bip"); 
				 dto = new BoardDto(bid, bname, btitle, bcontent, bdate, bhit, bgroup, bstep, bindent, bip);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return dto;
	}
//	(bid로 dto 가져오기) == 수정하기 + 답변글쓰기 (form, 조회수 올리기 미포함)
	//답변글을 쓰거나 수정하기 위해 들어갈땐 조회수를올리지 않기 위해 추가된 메소드
	public BoardDto modifyView_replyView(int bid) {
		BoardDto dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="SELECT * FROM BOARD WHERE BID = ?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				 //bid = rs.getInt("bid");
				 String bname = rs.getString("bname");
				 String btitle = rs.getString("btitle");
				 String bcontent = rs.getString("bcontent");
				 Date bdate = rs.getDate("bdate"); //date를 조금 더 자주 쓰는 편이긴 하지만 다 자주 씀 
				 int bhit = rs.getInt("bhit");
				 int bgroup = rs.getInt("bgroup");
				 int bstep = rs.getInt("bstep");
				 int bindent = rs.getInt("bindent");
				 String bip = rs.getString("bip"); 
				 dto = new BoardDto(bid, bname, btitle, bcontent, bdate, bhit, bgroup, bstep, bindent, bip);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return dto;
	}
	
	
	
	
//	 답변글 쓰기 전 step A : 1번글의 답변글 쓸 예정 
	public void preStepA(int bgroup, int bstep) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql="UPDATE BOARD SET BSTEP = BSTEP+1 WHERE BGROUP=? AND BSTEP>?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bgroup);
			pstmt.setInt(1, bstep);
			pstmt.executeUpdate();
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
	}
	
	
	
	
	
//	 답변글 쓰기
	// 답변자 : bname, btitile, bcontent, bip
	// 원글 : bgroup, bstep, bindent 
	public int reply(String bname, String btitle, String bcontent,int bgroup, int bstep, int bindent, String bip) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql="INSERT INTO BOARD (BID, BNAME, BTITLE, BCONTENT, BGROUP, BSTEP, BINDENT, BIP)" + 
					"    VALUES(BOARD_SEQ.NEXTVAL, ?, ?,?, ?, ?,?,?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bname);
			pstmt.setString(2, btitle);
			pstmt.setString(3, bcontent);
			pstmt.setInt(4, bgroup);
			pstmt.setInt(5, bstep);
			pstmt.setInt(6, bindent);
			pstmt.setString(7, bip);
			result = pstmt.executeUpdate();
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
	
//	 글 수정
	public int UpdateBoard(String bname, String btitle, String bcontent, String bip, int bid) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql="UPDATE BOARD SET BNAME = ?," + 
				"                 BTITLE =?," + 
				"                 BCONTENT=?," + 
				"                 BIP = ?" + 
				"                 WHERE BID=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bname);
			pstmt.setString(2, btitle);
			pstmt.setString(3, bcontent);
			pstmt.setString(4, bip);
			pstmt.setInt(5, bid);
			result = pstmt.executeUpdate();
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
	
//	 글 삭제 
	public int DeleteBoard(int bid) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql="DELETE FROM BOARD WHERE BID=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bid);
			result = pstmt.executeUpdate();
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
	
	
}
