package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.NamingException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import util.ConnectionPool;

public class userDAO {

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
	public static int studyDelete(String sNo) 
			throws NamingException, SQLException {
				
				Connection conn = null;
				PreparedStatement pstmt = null;
				
				try {
					String sql = "DELETE FROM study WHERE sNo = ? ";
					
					conn = ConnectionPool.get();
					pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, sNo);
						
					int result = pstmt.executeUpdate();
					
					return result;
					
				}finally {
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				}
			}
	
	//내 정보
		public static String myInfo(String userid) 
				throws NamingException, SQLException {
			
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				String sql = "SELECT * FROM user WHERE userid = ? ORDER BY ts DESC";
				
				conn = ConnectionPool.get();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userid);

				rs = pstmt.executeQuery();
				
				JSONArray study = new JSONArray();
				
				while(rs.next()) {
					JSONObject obj = new JSONObject();
					obj.put("userid", rs.getString(1));
					obj.put("nickname", rs.getString(2));
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
	public static int edit(String userid, String password, String nickname, String image, String phone) throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
		String sql = "UPDATE user SET password = ?, nickname = ?, image=?, phone=? WHERE userid = ?";
		
		conn = ConnectionPool.get();
		pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, password);
			pstmt.setString(2, nickname);
			pstmt.setString(3, phone);
			pstmt.setString(4, image);
			pstmt.setString(5, userid);
			 
		return pstmt.executeUpdate(); //성공 1, 실패 0을 가지고 나간다.
		} finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
	
	
	
	
	//회원 탈퇴
	public static int delete(String userid) 
			throws NamingException, SQLException {
				
				Connection conn = null;
				PreparedStatement pstmt = null;
				
				try {
					String sql = "DELETE FROM user WHERE userid = ? ";
					
					conn = ConnectionPool.get();
					pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, userid);
						
					int result = pstmt.executeUpdate();
					
					return result;
					
				}finally {
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				}
			}
	
	
	
	
}
