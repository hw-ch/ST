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


public class UserDAO {

	private static PreparedStatement pstmt;
	private static Connection conn;
	private static ResultSet rs;
	
	//My Study
	public static String myList(String sWriter)  {
		JSONArray study = new JSONArray();
		try {
			String sql = "SELECT sTitle, sWriter, joinCnt, startDate FROM study WHERE sWriter = ? ORDER BY ts DESC";
			
			try {
				conn = ConnectionPool.get();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sWriter);

			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				JSONObject obj = new JSONObject();
				obj.put("sTitle", rs.getString(1));
				obj.put("sWriter", rs.getString(2));
				obj.put("joinCnt", rs.getString(3));
				obj.put("startDate", rs.getString(4));
			
				study.add(obj);
			}
			
			} catch (NamingException | SQLException e) {
				e.printStackTrace();
			}
		}finally {
			  if (pstmt != null) try { pstmt.close(); } 
			  	catch(Exception e) {e.printStackTrace();}
			  if (conn != null) try { conn.close(); } 
	            catch(Exception e) {e.printStackTrace();}
	          if (rs != null) try { rs.close(); } 
	            catch (SQLException e) {e.printStackTrace();}
	        
		}
		return study.toJSONString();  
	}
	
	//스터디 조회
	public static String myView(String sWriter) 
			throws NamingException, SQLException {
		
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
			  if (pstmt != null) try { pstmt.close(); } 
			  	catch(Exception e) {e.printStackTrace();}
			  if (conn != null) try { conn.close(); } 
	            catch(Exception e) {e.printStackTrace();}
		}
		
	}
	
	
	//스터디 탈퇴
	public static int studyDelete(String userId, String sNo) 
			throws NamingException, SQLException {
				
				try {
					String sql = "DELETE FROM studyJoin WHERE userId = ? AND sNo = ? ";
					
					conn = ConnectionPool.get();
					pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, userId);
						pstmt.setString(2, sNo);
						
					int result = pstmt.executeUpdate();
					
					return result;
					
				}finally {
					  if (pstmt != null) try { pstmt.close(); } 
					  	catch(Exception e) {e.printStackTrace();}
					  if (conn != null) try { conn.close(); } 
			            catch(Exception e) {e.printStackTrace();}
				}
			}
	
	//내 정보
		public static String myInfo(String userId) 
				throws NamingException, SQLException {
			
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
				if (pstmt != null) try { pstmt.close(); } 
			  	catch(Exception e) {e.printStackTrace();}
			  if (conn != null) try { conn.close(); } 
	            catch(Exception e) {e.printStackTrace();}
			}
			
		}
		
	
	//본인 정보 수정
	public static int myEdit(String userId, String password, String nickName, String image, String phone) throws NamingException, SQLException {
		
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
			if (pstmt != null) try { pstmt.close(); } 
		  	catch(Exception e) {e.printStackTrace();}
		  if (conn != null) try { conn.close(); } 
            catch(Exception e) {e.printStackTrace();}
		}
	}
	
	//회원 탈퇴
	public static int withdrawal(String userId) 
			throws NamingException, SQLException {
				
				try {
					String sql = "DELETE FROM user WHERE userId = ? ";
					
					conn = ConnectionPool.get();
					pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, userId);
						
					int result = pstmt.executeUpdate();
					
					return result;
					
				}finally {
					if (pstmt != null) try { pstmt.close(); } 
				  	catch(Exception e) {e.printStackTrace();}
				  if (conn != null) try { conn.close(); } 
		            catch(Exception e) {e.printStackTrace();}
				}
			}
	
		//회원 로그인
			public static int login(String userId, String password) throws SQLException{
				
				String sql = "SELECT * FROM user WHERE userId=?";
				try {
					
				int result;
				
				Connection conn = ConnectionPool.get();
				
				PreparedStatement pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, userId);
				
				ResultSet rs = pstmt.executeQuery();
				

				
				if(!rs.next()) {
					result = 1; //아이디가 존재하지 않는 경우
				}else if (!password.equals(rs.getString("password"))) { //아이디는 존재하지만 비번이 일치하지 않는 경우
					result = 2;
				}else {
					result = 0; //로그인 성공
				}
				
				return result;
				
				
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					if(pstmt != null)
					pstmt.close();
					if(conn != null)
					conn.close();
				}
				
				return 3;
	
}
}
