package jdbc;

<<<<<<< HEAD
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
	public static int login(String id, String userpass) throws NamingException, SQLException {
		
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
			if(!userpass.equals(rs.getString("password"))) return 2;	//아이디는 존재하지만 비밀번호가 다른 경우
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
		public static String pwFind(String userid, String name) throws NamingException, SQLException {
			
			String sql = "SELECT password FROM user WHERE userid=? and name=? ";
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String password = null;
			
			try {
				conn = ConnectionPool.get();	
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userid);
				pstmt.setString(2, name);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					password = rs.getString("password");
				}
			}	finally {
				if(rs != null) rs.close();
				if(pstmt!= null) pstmt.close();
				if(conn != null) conn.close();
			}
			return password;
		}
=======
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.NamingException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import util.ConnectionPool;

//최초작성자 : 정소영
//최초작성일 : 2023/02/15
//
//버전  기록 : 0.1(시작 23/02/15) 


public class UserDAO {

	//My Study
	public static String myList(String sWriter) 
			throws NamingException, SQLException {
		
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT sTitle, sWriter, joinCnt, startDate FROM study WHERE sWriter = ? ORDER BY ts DESC";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sWriter);

			rs = pstmt.executeQuery();
			
			JSONArray study = new JSONArray();
			
			while(rs.next()) {
				JSONObject obj = new JSONObject();
				obj.put("sTitle", rs.getString(1));
				obj.put("sWriter", rs.getString(2));
				obj.put("joinCnt", rs.getString(3));
				obj.put("startDate", rs.getString(4));
			
				study.add(obj);
			}
				
			return study.toJSONString();
			
		}finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		
	}
	
	//스터디 조회
	public static String myView(String sWriter) 
			throws NamingException, SQLException {
		
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT sTitle, sWriter, joinCnt, startDate, process, expDate, cNo  FROM study WHERE sWriter = ? ORDER BY ts DESC";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sWriter);

			rs = pstmt.executeQuery();
			
			JSONArray study = new JSONArray();
			
			while(rs.next()) {
				JSONObject obj = new JSONObject();
				obj.put("sTitle", rs.getString(1));
				obj.put("sWriter", rs.getString(2));
				obj.put("joinCnt", rs.getString(3));
				obj.put("startDate", rs.getString(4));
				obj.put("process", rs.getString(5));
				obj.put("expDate", rs.getString(6));
				obj.put("cNo", rs.getString(7));
			
				study.add(obj);
			}
				
			return study.toJSONString();
			
		}finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		
	}
	
	
	//스터디 탈퇴
	public static int studyDelete(String userId, String sNo) 
			throws NamingException, SQLException {
				
				Connection conn = null;
				PreparedStatement pstmt = null;
				
				try {
					String sql = "DELETE FROM studyJoin WHERE userId = ? AND sNo = ? ";
					
					conn = ConnectionPool.get();
					pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, userId);
						pstmt.setString(2, sNo);
						
					int result = pstmt.executeUpdate();
					
					return result;
					
				}finally {
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				}
			}
	
	//내 정보
		public static String myInfo(String userId) 
				throws NamingException, SQLException {
			
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				String sql = "SELECT * FROM user WHERE userId = ? ORDER BY ts DESC";
				
				conn = ConnectionPool.get();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userId);

				rs = pstmt.executeQuery();
				
				JSONArray study = new JSONArray();
				
				while(rs.next()) {
					JSONObject obj = new JSONObject();
					obj.put("userId", rs.getString(1));
					obj.put("nickName", rs.getString(2));
					obj.put("name", rs.getString(3));
					obj.put("gender", rs.getString(4));
					obj.put("phone", rs.getString(5));
					obj.put("ts", rs.getString(6));
				
					study.add(obj);
				}
					
				return study.toJSONString();
				
			}finally {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}
			
		}
		
	
	//본인 정보 수정
	public static int edit(String userId, String password, String nickName, String image, String phone) throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
		String sql = "UPDATE user SET password = ?, nickName = ?, image=?, phone=? WHERE userId = ?";
		
		conn = ConnectionPool.get();
		pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, password);
			pstmt.setString(2, nickName);
			pstmt.setString(3, phone);
			pstmt.setString(4, image);
			pstmt.setString(5, userId);
			 
		return pstmt.executeUpdate(); //성공 1, 실패 0을 가지고 나간다.
		} finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
	
	//회원 탈퇴
	public static int delete(String userId) 
			throws NamingException, SQLException {
				
				Connection conn = null;
				PreparedStatement pstmt = null;
				
				try {
					String sql = "DELETE FROM user WHERE userId = ? ";
					
					conn = ConnectionPool.get();
					pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, userId);
						
					int result = pstmt.executeUpdate();
					
					return result;
					
				}finally {
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				}
			}
>>>>>>> 60b979c496b30773dfc42ee5a079ef3fed35c1dd
	
}
