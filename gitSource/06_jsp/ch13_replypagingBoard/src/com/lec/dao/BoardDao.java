package com.lec.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.lec.dto.BoardDto;

public class BoardDao {

	public static final int SUCCESS = 1;
	public static final int FAIL    = 0;
	
	private static BoardDao instance = new BoardDao();
	public static BoardDao getInstance() {
		return instance;
	}
	
	private BoardDao() {}
	
	//Connection 객체를 받아오는 getConnection()함수
	private Connection getConnection() throws SQLException {
		Connection conn = null;
		try {
			//connection 객체에 있는 데이터 소스 받아오기 
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/Oracle11g");
			conn = ds.getConnection();
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}
	
	// 1. 글 갯수 가져오는애
	public int getBoardTotalCnt() {
		int toCnt = 0;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM BOARD";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs   = stmt.executeQuery(sql);
			rs.next();
			toCnt = rs.getInt(1); //1열의 데이터를 int값으로 받아옴
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs!=null)rs.close();
				if(stmt!=null)stmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return toCnt;
	}
	
	// 2. 글 목록 public Arrayist<BoardDto> listBoard();
	public ArrayList<BoardDto> listBoard(){
		ArrayList<BoardDto> dtos = new ArrayList<BoardDto>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM BOARD ORDER BY REF DESC";
		
		try {
			conn=getConnection();
			stmt=conn.createStatement();
			rs  = stmt.executeQuery(sql);
			while(rs.next()) {
				int num = rs.getInt("num");
				String writer = rs.getString("writer");
				String subject = rs.getString("subject");
				String content = rs.getString("content");
				String email = rs.getString("email");
				int readcount = rs.getInt("readcount");
				String pw = rs.getString("pw");
				int ref = rs.getInt("ref");
				int re_step = rs.getInt("re_step");
				int re_indent = rs.getInt("re_indent");
				String ip = rs.getString("ip");
				Timestamp rdate = rs.getTimestamp("rdate");
				dtos.add(new BoardDto(num, writer, subject, content, email, readcount, pw, ref, re_step, re_indent, ip, rdate));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs!=null)rs.close();
				if(stmt!=null)stmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return dtos;
	}
	//2-2페이징기법 LIST
	public ArrayList<BoardDto> listBoard(int startRow, int endRow){
		ArrayList<BoardDto> dtos = new ArrayList<BoardDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM BOARD ORDER BY REF DESC, RE_STEP) A)" + 
				" WHERE RN BETWEEN ? AND ?";
		
		try {
			conn=getConnection();
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int num = rs.getInt("num");
				String writer = rs.getString("writer");
				String subject = rs.getString("subject");
				String content = rs.getString("content");
				String email = rs.getString("email");
				int readcount = rs.getInt("readcount");
				String pw = rs.getString("pw");
				int ref = rs.getInt("ref");
				int re_step = rs.getInt("re_step");
				int re_indent = rs.getInt("re_indent");
				String ip = rs.getString("ip");
				Timestamp rdate = rs.getTimestamp("rdate");
				dtos.add(new BoardDto(num, writer, subject, content, email, readcount, pw, ref, re_step, re_indent, ip, rdate));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return dtos;
	}
	// 3. 글쓰기(답변 말고 원글쓰기) public int inserBoard(BoardDto dto);
	public int inserBoard(BoardDto dto) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO BOARD(NUM, WRITER, SUBJECT, CONTENT, EMAIL, PW, REF, RE_STEP, RE_INDENT, IP)" + 
				" VALUES ((SELECT NVL(MAX(NUM),0)+1 FROM BOARD), ?, ?, ?, ?, ?, (SELECT NVL(MAX(NUM),0)+1 FROM BOARD)," + 
				"        0,0,?)";
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getPw());
			pstmt.setString(6, dto.getIp());
			result = pstmt.executeUpdate();
			if(result == BoardDao.SUCCESS) {
				System.out.println("글쓰기 성공");
			}else {
				System.out.println("글쓰기 실패");
			}
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
	
	// 4. 글번호로 글(DTO) 가져오기 (글 상세보기) public BorderDto getBoardOneLine(int num)
	public BoardDto getBoardOneLine(int num) {
		BoardDto dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM BOARD WHERE NUM=?";
		
		try {
			conn=getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				//int num = rs.getInt("num"); 
				String writer = rs.getString("writer");
				String subject = rs.getString("subject");
				String content = rs.getString("content");
				String email = rs.getString("email");
				int readcount = rs.getInt("readcount");
				String pw = rs.getString("pw");
				int ref = rs.getInt("ref");
				int re_step = rs.getInt("re_step");
				int re_indent = rs.getInt("re_indent");
				String ip = rs.getString("ip");
				Timestamp rdate = rs.getTimestamp("rdate");
				dto =new BoardDto(num, writer, subject, content, email, readcount, pw, ref, re_step, re_indent, ip, rdate);
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
	// 4. 글번호로 글(DTO) 가져오기 (글 상세보기) public BorderDto getBoardOneLine(String num)
	public BoardDto getBoardOneLine(String num) {
		BoardDto dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM BOARD WHERE NUM=?";
		
		try {
			conn=getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				//int num = rs.getInt("num"); 
				String writer = rs.getString("writer");
				String subject = rs.getString("subject");
				String content = rs.getString("content");
				String email = rs.getString("email");
				int readcount = rs.getInt("readcount");
				String pw = rs.getString("pw");
				int ref = rs.getInt("ref");
				int re_step = rs.getInt("re_step");
				int re_indent = rs.getInt("re_indent");
				String ip = rs.getString("ip");
				Timestamp rdate = rs.getTimestamp("rdate");
				dto =new BoardDto(Integer.parseInt(num), writer, subject, content, email, readcount, pw, ref, re_step, re_indent, ip, rdate);
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
	//    -- int num 이라고 써야 하지만 어차피 getParameter로 받아 형변환 해야하니 처음부터 String이라고 써주기 
	
	// 5. 조회수 올리기 public void readCountUp(int num) // 4번에서 int num 하면 여기도 int num, String num 하면 여기도 String num
	public void readCountUp(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE BOARD SET READCOUNT = READCOUNT+1 WHERE NUM=?";
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
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
	// 5. 조회수 올리기 public void readCountUp(String num) // 4번에서 int num 하면 여기도 int num, String num 하면 여기도 String num
	public void readCountUp(String num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE BOARD SET READCOUNT = READCOUNT+1 WHERE NUM=?";
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
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
	// 6. 글 수정 public int updateBoard(BoardDto dto);
	public int updateBoard(BoardDto dto) {//글제목, 글내용, 비밀번호, 이메일
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE BOARD SET SUBJECT = ?," + 
				"                  CONTENT = ?," + 
				"                  EMAIL = ?," + 
				"                  PW    = ?," + 
				"                  IP    = ? " + 
				"                  WHERE NUM=?";
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getSubject());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getEmail());
			pstmt.setString(4, dto.getPw());
			pstmt.setString(5, dto.getIp());
			pstmt.setInt(6, dto.getNum());
			result = pstmt.executeUpdate();
			if(result == BoardDao.SUCCESS) {
				System.out.println("글쓰기 성공");
			}else {
				System.out.println("글쓰기 실패");
			}
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
	
	// 7. 글 삭제(비밀번호 입력해야 삭제가 되도록) public int deleteBoard(int num, String pwChk)
	
	public int deleteBoard(int num, String pw) {//글제목, 글내용, 비밀번호, 이메일
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM BOARD WHERE NUM= ? AND PW=?";
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, pw);
			result = pstmt.executeUpdate();
			if(result == BoardDao.SUCCESS) {
				System.out.println("글쓰기 성공");
			}else {
				System.out.println("글쓰기 실패");
			}
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
	///////////////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////
	
	//8. 답변글 저장전 step ⓐ 스텝 :  UPDATE BOARD SET RE_STEP = RE_STEP+1 WHERE REF=150 AND RE_STEP>1;
	private void preReplyStepA(int ref, int re_step) {// reply라는 함수 내에서 호출할거기 때문에 private로 사용 
		Connection conn = null;
		PreparedStatement pstmt=null;
		String sql="UPDATE BOARD SET RE_STEP = RE_STEP+1 WHERE REF=? AND RE_STEP>?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, re_step);
			int result = pstmt.executeUpdate();
			System.out.println(result + "개 조정");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}//try
		}//finally
	}//preReplyStepA
	
	//9. 답변글 저장 
	public int reply(BoardDto dto) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		// num,  writer, subject, content, email, pw, ref, re_step, re_indent, ip
		// 사용자로부터 입력받을 답변글 내용 : writer, subject, content, email, pw
		// 원글에 대한 정보 : ref, re-step, re_indent
		// 시스템으로부터 구현되어 저장될 정보 : ip
		String sql = " INSERT INTO BOARD (NUM, WRITER, SUBJECT, CONTENT, EMAIL, PW, REF, RE_STEP, RE_INDENT, IP)" + 
					 " VALUES ((SELECT NVL(MAX(NUM),0)+1 FROM BOARD), ?, ?, ?, ?,?,?,?, ?, ?)";
		
		//try 들어가기 전에 a스텝 먼저 호출해서 사용해야함
		//답변글 저장전 step A
		preReplyStepA(dto.getRef(), dto.getRe_step()); // 매개변수로 들어온 애가 없기 때문에 dto에 들어가 있는 정보 땡겨옴 
		
		try {
			conn=getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getPw());
			pstmt.setInt(6, dto.getRef());
			pstmt.setInt(7, dto.getRe_step()+1); //원글 re_step +1
			pstmt.setInt(8, dto.getRe_indent()+1); //원글 더하기 1이어야 하니깐 반드시 + 1
			pstmt.setString(9, dto.getIp()); 
			result = pstmt.executeUpdate();
			//DB에 저장될 dto 내용 
			// 원래 매개변수로 저장된 dto가 날라오는데 re_step,re_indent만 좀 바꾸기 
			dto.setRe_step(dto.getRe_step()+1);
			dto.setRe_indent(dto.getRe_indent()+1);
			System.out.println(result==SUCCESS ? "답변글 성공 - " + dto : "답변글 실패-" + dto);
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "답변글 실패 - " + dto);
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}//try
		}//finally
		return result;
	}
	
	
	
	
	
	
	
	
	
	
}//class















