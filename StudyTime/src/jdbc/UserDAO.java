package jdbc;

import java.sql.*;

import javax.naming.NamingException;

import util.*;

public class UserDAO {
	
	//회원가입 (완료)
	public static boolean join(String userId, String password, String name, String nickname, String gender, String phone, String image) throws NamingException, SQLException{
		String sql = "INSERT INTO user(userId, password, name, nickname, "
				+ " gender, phone, image) VALUES(?, ?, ?, ?, ?, ?, ?)";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, password);
			pstmt.setString(3, name);
			pstmt.setString(4, nickname);
			pstmt.setString(5, gender);
			pstmt.setString(6, phone);
			pstmt.setString(7, image);
			
			int result = pstmt.executeUpdate();
			if(result == 1) {
				return true;
			}
		} finally {
			if(pstmt!= null) pstmt.close();
			if(conn != null) conn.close();
		}
		return false;
	}
	
	//로그인 (완료)
	public static int login(String id, String userPass) throws NamingException, SQLException {
		
		String sql = "SELECT userId, password FROM user WHERE userId=? ";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = ConnectionPool.get(); //커넥션 풀 사용
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(!rs.next()) return 1; //아이디가 존재하지 않는 경우
			if(!userPass.equals(rs.getString("password"))) return 2;	//아이디는 존재하지만 비밀번호가 다른 경우
			return 0; //아이디와 비밀번호 일치 !! 로그인 성공
			
		}	finally {
			if(rs != null) rs.close();
			if(pstmt!= null) pstmt.close();
			if(conn != null) conn.close();
		}
		
	}
	
	//카카오 로그인(완료)
	public static int kakaoLogin(String id) throws NamingException, SQLException {
		
		String sql = "SELECT userId FROM user WHERE userId=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = ConnectionPool.get();	
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(!rs.next()) return 1;	//DB에 회원정보가 없는 경우
			
			return 0;	// DB에 존재하는 경우
			
		}	finally {
			if(rs != null) rs.close();
			if(pstmt!= null) pstmt.close();
			if(conn != null) conn.close();
		}
		
	}
	
	//아이디 찾기(완료)
	public static String idFind(String name, String phone) throws NamingException, SQLException {
		
		String sql = "SELECT userid FROM user WHERE name=? and phone=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String id = null; // DB에 있는 아이디 찾기
		
		try {
			conn = ConnectionPool.get();	
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, phone);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				id = rs.getString("userId");	//아이디 반환 !
			}
		}	finally {
			if(rs != null) rs.close();
			if(pstmt!= null) pstmt.close();
			if(conn != null) conn.close();
		}
		return id;
	}
	
	//비밀번호 찾기(완료)
		public static int pwFind(String id, String userName) throws NamingException, SQLException {
			
			String sql = "SELECT password FROM user WHERE userId=? and name=? ";
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String password = null;
			
			try {
				conn = ConnectionPool.get();	
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, userName);
				
				rs = pstmt.executeQuery();
				
				if(!id.equals(rs.getString("userId"))) return 1;	//입력한 아이디가 없는 경우
				
			}	finally {
				if(rs != null) rs.close();
				if(pstmt!= null) pstmt.close();
				if(conn != null) conn.close();
			}
		}
	
}
