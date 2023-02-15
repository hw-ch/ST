package jdbc;

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
	
}
