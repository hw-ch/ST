package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import java.util.*;

import javax.naming.NamingException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import util.ConnectionPool;

import util.*;


public class UserDAO {

	private static PreparedStatement pstmt;
	private static String sql;
	private static ResultSet rs;
	private static Connection conn;
	
//	회원정보 수정 메서드(도영)
	public static boolean update(String userId, String nickName, String name, String gender, String image, String phone){
		
		try {
			sql = "UPDATE user SET userId=?, nickName=?, name=?, gender=?, image=?, phone=? "
					+ " WHERE userId=? ";


	
	//My Study
	public static String myList(String sWriter)  {
		JSONArray study = new JSONArray();
		try {
			String sql = "SELECT sTitle, sWriter, joinCnt, startDate FROM study WHERE sWriter = ? ORDER BY ts DESC";
			

			try {
				conn = ConnectionPool.get();
			} catch (NamingException e) {
				e.printStackTrace();
			}
			
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, userId);
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
		finally {
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
			pstmt.setString(3, name);
			pstmt.setString(4, gender);
			pstmt.setString(5, image);
			pstmt.setString(6, phone);
			int result = pstmt.executeUpdate();
			if (result == 1) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null)	pstmt.close();
				if(conn != null)	conn.close();
				if(rs != null)	rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return false;

	}
	
//	회원정보 삭제 메서드(도영)
	public static boolean dropout(String userId){
	
	try {
	//로그인 (완료)
	public static int login(String id, String userPass) throws NamingException, SQLException {
		
		sql = "SELECT userId, password FROM user WHERE userId=? ";
		
		
		sql = "DELETE from user where userid=? ";

		try {
			conn = ConnectionPool.get();
		} catch (NamingException e) {
			e.printStackTrace();
		}
		
		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, userId);

		int result = pstmt.executeUpdate();
		if (result == 1) {
			return true;
		}
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		try {
			if(pstmt != null)	pstmt.close();
			if(conn != null)	conn.close();
			if(rs != null)	rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	return false;

}
	
//	회원정보 가져오기 메서드(도영)
	public static UserDTO getOneList(String userId){

		UserDTO user = null;
		try {
			sql = "SELECT from user where userid=? ";
	
			try {
				conn = ConnectionPool.get();
			} catch (NamingException e) {
				e.printStackTrace();
			}
			
			pstmt = conn.prepareStatement(sql);
	
			pstmt.setString(1, userId);
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
			
			if (rs.next()) {
					user = new UserDTO(rs.getString("userid"),
						rs.getString("password"),
						rs.getString("nickname"),
						rs.getString("name"),
						rs.getString("ts"),
						rs.getString("gender"),
						rs.getString("image"),
						rs.getString("phone"));
			}
			
			return user;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null)	pstmt.close();
				if(conn != null)	conn.close();
				if(rs != null)	rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}	finally {
			if(rs != null) rs.close();
			if(pstmt!= null) pstmt.close();
			if(con != null) con.close();
		}
	
		return user;
	
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
