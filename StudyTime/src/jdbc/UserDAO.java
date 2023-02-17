package jdbc;

import java.sql.*;

import javax.naming.NamingException;

import util.*;

public class UserDAO {
	
	private static PreparedStatement pstmt;
	private static String sql;
	private static ResultSet rs;
	private static Connection con;
	
	
	//회원가입 (완료)
	public static boolean join(String userId, String password, String name, String nickname, String gender, String phone, String image) throws NamingException, SQLException{
		sql = "INSERT INTO user(userid, password, name, nickname, "
				+ " gender, phone, image) VALUES(?, ?, ?, ?, ?, ?, ?)";
		
		try {
			con = ConnectionPool.get();
			pstmt = con.prepareStatement(sql);
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
			if(con != null) con.close();
		}
		return false;
	}
	
	//로그인 (완료)
	public static int login(String id, String userPass) throws NamingException, SQLException {
		
		sql = "SELECT userId, password FROM user WHERE userId=? ";
		
		
		try {
			con = ConnectionPool.get(); //커넥션 풀 사용
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(!rs.next()) return 1; //아이디가 존재하지 않는 경우
			if(!userPass.equals(rs.getString("password"))) return 2;	//아이디는 존재하지만 비밀번호가 다른 경우
			return 0; //아이디와 비밀번호 일치 !! 로그인 성공
			
		}	finally {
			if(rs != null) rs.close();
			if(pstmt!= null) pstmt.close();
			if(con != null) con.close();
		}
		
	}
	
	//카카오 로그인(완료)
	public static int kakaoLogin(String id) throws NamingException, SQLException {
		
		sql = "SELECT userId FROM user WHERE userId=?";
		
		try {
			con = ConnectionPool.get();	
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(!rs.next()) return 1;	//DB에 회원정보가 없는 경우
			
			return 0;	// DB에 존재하는 경우
			
		}	finally {
			if(rs != null) rs.close();
			if(pstmt!= null) pstmt.close();
			if(con != null) con.close();
		}
		
	}
	
	//아이디 찾기(완료)
	public static String idFind(String userName, String userPhone) throws NamingException, SQLException {
		
		sql = "SELECT userid FROM user WHERE name=? and phone=?";
		
		String id = null; // DB에 있는 아이디 찾기
		
		try {
			con = ConnectionPool.get();	
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userName);
			pstmt.setString(2, userPhone);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				id = rs.getString("userId");	//아이디 반환 !
			}
			
		}	finally {
			if(rs != null) rs.close();
			if(pstmt!= null) pstmt.close();
			if(con != null) con.close();
		}
		return id;
	}
	
	//비밀번호 찾기(완료)
	public static String pwFind(String userid, String name, String userPhone) throws NamingException, SQLException {
		
		sql = "SELECT password FROM user WHERE userId=? and name=? and phone=? ";
		String password = null;
		
		try {
			con = ConnectionPool.get();	
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, name);
			pstmt.setString(3, userPhone);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				password = rs.getString("password");
			}
		}	finally {
			if(rs != null) rs.close();
			if(pstmt!= null) pstmt.close();
			if(con != null) con.close();
		}
		return password;
	}
	
	//비밀번호 찾기를 누른 후 임시비밀번호로 변경되는 메서드
	public static boolean updatePw(String id, String pw) throws NamingException, SQLException {
		
		sql = "UPDATE user set password=? WHERE userId=?";
		
	try {
		con = ConnectionPool.get();	
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		
		int result = pstmt.executeUpdate();
		if(result == 1) {
			return true;
		}
	}	finally {
		if(pstmt!= null) pstmt.close();
		if(con != null) con.close();
	}
	return false;
}
	
}
