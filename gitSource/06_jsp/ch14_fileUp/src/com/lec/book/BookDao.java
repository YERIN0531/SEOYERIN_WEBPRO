package com.lec.book;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BookDao {

	//책 등록 성공하면 success, 실패하면 fail을 리턴 
	public final static int SUCCESS = 1;
	public final static int FAIL    = 0;
	
	private static BookDao instance = new BookDao();
	public static BookDao getInstance() {
		return instance;
	}

	private BookDao() {}
	
	//Connection 객체 얻어오는 함수 
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
	
	
	// 1. 책등록
	public int insertBook(BookDto book) {
	 int result = FAIL;
	 Connection conn = null;
	 PreparedStatement pstmt = null;
	 String sql = "INSERT INTO BOOK (BID, BTITLE, BPRICE, BIMAGE1, BIMAGE2, BCONTENT, BDISCOUNT)" + 
	 		"    VALUES(BOOK_SEQ.NEXTVAL, ?, ?, ?,?,?,?)";
	 
	 try {
		conn = getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, book.getBtitle());
		pstmt.setInt(2, book.getBprice());
		pstmt.setString(3, book.getBimage1());
		pstmt.setString(4, book.getBimage2());
		pstmt.setString(5, book.getBcontent());
		pstmt.setInt(6, book.getBdiscount());
		result = pstmt.executeUpdate();
		/*
		 * System.out.println(result==SUCCESS ? "책등록 성공" : "책등록 실패"); 여기서는 실패로 갈 수가 없음.
		 * 손님이 잘못 등록하면 어차피 catch절로 떨어지기 때문에 위에구문이 의미가 없음
		 */
		System.out.println("책등록 성공");
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
	
	
	// 2. 책목록(전체 LIST)
	public ArrayList<BookDto> listBook(){
		ArrayList<BookDto> dtos = new ArrayList<BookDto>();
		Connection conn = null;
		Statement  stmt = null;
		//선생님은 pstmt로 받으셨음 
		ResultSet rs = null;
		String sql = "SELECT * FROM BOOK ORDER BY BRDATE DESC";
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs   = stmt.executeQuery(sql);
		while(rs.next()) {
			 int 	bid = rs.getInt("bid");
			 String btitle = rs.getString("btitle");
			 int 	bprice = rs.getInt("bprice");
			 String bimage1 = rs.getString("bimage1");
			 String bimage2 = rs.getString("bimage2");
			 String bcontent = rs.getString("bcontent");
			 int 	bdiscount = rs.getInt("bdiscount");
			 Date	brdate = rs.getDate("brdate");
			dtos.add(new BookDto(bid, btitle, bprice, bimage1, bimage2, bcontent, bdiscount, brdate));
		}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs!=null) rs.close();
				if(stmt!=null)stmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return dtos;
	}
	// **********페이징 처리 하기위해 필요한구문 
	// 3. 책목록(top-n구문)
	public ArrayList<BookDto> listBook(int startRow, int endRow){
		ArrayList<BookDto> books = new ArrayList<BookDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		//선생님은 pstmt로 받으셨음 
		ResultSet rs = null;
		String sql = "SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM BOOK ORDER BY BRDATE DESC) A)" + 
				" WHERE RN BETWEEN ? AND ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
			 int 	bid = rs.getInt("bid");
			 String btitle = rs.getString("btitle");
			 int 	bprice = rs.getInt("bprice");
			 String bimage1 = rs.getString("bimage1");
			 String bimage2 = rs.getString("bimage2");
			 String bcontent = rs.getString("bcontent");
			 int 	bdiscount = rs.getInt("bdiscount");
			 Date	brdate = rs.getDate("brdate");
			books.add(new BookDto(bid, btitle, bprice, bimage1, bimage2, bcontent, bdiscount, brdate));
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
		return books;
	}
	// 4.  등록된 책 갯수
	public int getBookTotCnt() {
		int totalCnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) CNT FROM BOOK";
		
		try {
			conn = getConnection();
			pstmt =conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			totalCnt = rs.getInt("cnt");
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
		return totalCnt;
		
	}
	// **********
	// 5. 책 상세보기(BDI로 DTO 가져오기)
	public BookDto getBook(int bid) {
		BookDto dtos = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM BOOK WHERE BID=?";
		
		try {
			conn = getConnection();
			pstmt =conn.prepareStatement(sql);
			pstmt.setInt(1, bid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				 String btitle = rs.getString("btitle");
				 int 	bprice = rs.getInt("bprice");
				 String bimage1 = rs.getString("bimage1");
				 String bimage2 = rs.getString("bimage2");
				 String bcontent = rs.getString("bcontent");
				 int 	bdiscount = rs.getInt("bdiscount");
				 Date	brdate = rs.getDate("brdate");
				dtos = new BookDto(bid, btitle, bprice, bimage1, bimage2, bcontent, bdiscount, brdate);
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
		return dtos;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}//class
