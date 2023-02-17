package jdbc;

import java.sql.*;

import javax.naming.NamingException;

import util.*;

public class UserDAO {
	
	private static PreparedStatement pstmt;
	private static String sql;
	private static ResultSet rs;
	private static Connection conn;
	
	
	//회원가입 (두현)
	public static boolean join(String userId, String password, String name, String nickname, String gender, String phone, String image){
		sql = "INSERT INTO user(userid, password, name, nickname, "
				+ " gender, phone, image) VALUES(?, ?, ?, ?, ?, ?, ?)";
		
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
		}	catch (Exception e) {
			e.printStackTrace();
		}  finally {
			try {
				if(pstmt!= null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}
	
	//로그인 (두현)
	public static int login(String id, String userPass) {
		
		sql = "SELECT userId, password FROM user WHERE userId=? ";
		
		try {
			conn = ConnectionPool.get(); //커넥션 풀 사용
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(!rs.next()) return 1; //아이디가 존재하지 않는 경우
			if(!userPass.equals(rs.getString("password"))) return 2;	//아이디는 존재하지만 비밀번호가 다른 경우
			return 0; //아이디와 비밀번호 일치 !! 로그인 성공
			
		}	catch (Exception e) {
			e.printStackTrace();
		} 
		finally {
			try {
				if(rs != null) rs.close();
				if(pstmt!= null) pstmt.close();
				if(conn != null) conn.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return -1;
	}
	
	//카카오 로그인(두현)
	public static int kakaoLogin(String id) {
		
		sql = "SELECT userId FROM user WHERE userId=?";
		
		try {
			conn = ConnectionPool.get();	
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(!rs.next()) return 1;	//DB에 회원정보가 없는 경우
			
			return 0;	// DB에 존재하는 경우
			
		} catch (Exception e) {
			e.printStackTrace();
		} 	
		finally {
			try {
				if(rs != null) rs.close();
				if(pstmt!= null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return -1;
	}
	
	//아이디 찾기(두현)
	public static String idFind(String userName, String userPhone) {
		
		sql = "SELECT userid FROM user WHERE name=? and phone=?";
		
		String id = null; // DB에 있는 아이디 찾기
		
		try {
			conn = ConnectionPool.get();	
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userName);
			pstmt.setString(2, userPhone);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				id = rs.getString("userId");	//아이디 반환 !
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(rs != null) rs.close();
				if(pstmt!= null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return id;
	}
	
	//비밀번호 찾기(두현)
	public static String pwFind(String userid, String name, String userPhone) {
		
		sql = "SELECT password FROM user WHERE userId=? and name=? and phone=? ";
		String password = null;
		
		try {
			conn = ConnectionPool.get();	
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, name);
			pstmt.setString(3, userPhone);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				password = rs.getString("password");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		finally {
			try {
				if(rs != null) rs.close();
				if(pstmt!= null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return password;
	}
	
	//비밀번호 찾기를 누른 후 임시비밀번호로 변경되는 메서드(두현)
	public static boolean updatePw(String id, String pw) {
		
		sql = "UPDATE user set password=? WHERE userId=?";
		
	try {
		conn = ConnectionPool.get();	
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		
		int result = pstmt.executeUpdate();
		if(result == 1) {
			return true;
		}
	} catch (Exception e) {
		e.printStackTrace();
	}	
	finally {
		try {
			if(pstmt!= null) pstmt.close();
			if(conn != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	return false;
}
	
	
}
