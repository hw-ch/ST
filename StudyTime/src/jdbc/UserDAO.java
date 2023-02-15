package jdbc;

import java.sql.*;

import javax.naming.NamingException;

import util.*;

public class UserDAO {

	private Connection conn;
	private String sql;
    private PreparedStatement pstmt;
    private ResultSet rs;
	
	//회원가입
	public static int join(userDTO uto) throws NamingException, SQLException {
		sql = "INSERT INTO user(userid, password, name, phone, "
				+ " gender, nickname, image VALUES(?, ?, ?, ?, ?, ?, ?)";
		
		
		Connection conn = ConnectionPool.get();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, to);
		pstmt.setString(2, pass);
		pstmt.setString(3, name);
		pstmt.setString(4, content);
		
		int result = pstmt.executeUpdate();
		return result;
	}
	
	//로그인
	public static int login(String userid, String userpass) throws NamingException, SQLException {
		
		String sql = "SELECT mid, mpass FROM member WHERE mid=?";
		
		Connection conn = ConnectionPool.get();		//커넥션 풀 사용
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		
		ResultSet rs = pstmt.executeQuery();
		
		if(!rs.next()) return 1;	//DB에 회원정보가 없는 경우
		if(!userpass.equals(rs.getString(2))) return 2;	//	입력한 비밀번호와 DB에 비밀번호가 같지 않은 경우 즉, 비번만 틀린 경우
		
		return 0;	// 아이디와 비번 모두 일치하는 경우
		
	}
	//카카오 로그인
	public static int exist(String id) throws NamingException, SQLException {
		
		String sql = "SELECT memail FROM member WHERE id=?";
		
		Connection conn = ConnectionPool.get();		//커넥션 풀 사용
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		
		ResultSet rs = pstmt.executeQuery();
		
		if(!rs.next()) return 1;	//DB에 회원정보가 없는 경우
		
		return 0;	// DB에 존재하는 경우
	}
	
	//아이디 찾기
		public static int idFind(String userid) throws NamingException, SQLException {
			
			String sql = "SELECT mid, mpass FROM member WHERE mid=?";
			
			Connection conn = ConnectionPool.get();		//커넥션 풀 사용
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(!rs.next()) return 1;	//DB에 회원정보가 없는 경우
			
			return 0;	// 아이디와 비번 모두 일치하는 경우
			
		}
	
	//비밀번호 찾기
		public static int pwFind(String userid) throws NamingException, SQLException {
			
			String sql = "SELECT mid, mpass FROM member WHERE mid=?";
			
			Connection conn = ConnectionPool.get();		//커넥션 풀 사용
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(!rs.next()) return 1;	//DB에 회원정보가 없는 경우
			
			return 0;	// 아이디와 비번 모두 일치하는 경우
			
		}
	
}
