package com.lec.friend;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class FriendDao {

	public static final int SUCCESS = 1;
	public static final int FAIL = 0;
	
	private static FriendDao instance; //자기가 자기 클래스 참조 
	
	public static FriendDao getInstance() {
		if(instance==null) {
			instance = new FriendDao();
		}
		return instance;
	}
	
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
	
	
	//1.다 뿌려주는거 
	public ArrayList<FriendDto> getFriend() {
		ArrayList<FriendDto> friend = new ArrayList<FriendDto>(); 
		Connection conn = null;
		Statement  stmt = null;
		ResultSet  rs = null;
		String sql = "SELECT * FROM FRIEND";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs   = stmt.executeQuery(sql);
			while(rs.next()) {
				int no = rs.getInt("num");
				String name = rs.getString("name");
				String tel = rs.getString("tel");
				friend.add(new FriendDto(no, name, tel));
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
		return friend;
	}
	
	//2.추가 해주는 것 
	
	public int insertFriend(String name, String tel) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO FRIEND(NUM,NAME,TEL) VALUES(FRIEND_SEQ.NEXTVAL,?,?)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, tel);
			result = pstmt.executeUpdate();
			if(result==SUCCESS) { //추가 성공
				System.out.println("추가 실패");
			}else { //추가 실패 
				System.out.println("추가성공");
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
	
	//3.검색하는 것 
	public ArrayList<FriendDto> searchFriend(String name, String tel){
		ArrayList<FriendDto> dto = new ArrayList<FriendDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet  rs = null;
		String sql = "SELECT * FROM FRIEND WHERE NAME LIKE '%'||?||'%' AND TEL LIKE '%'||?||'%'";
		
		try {
			conn= getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, tel);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int num = rs.getInt("num");
				name = rs.getString("name");
				tel  = rs.getString("tel");
				dto.add(new FriendDto(num, name, tel));
			}
			
		} catch (SQLException e) {
		
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
	
}









