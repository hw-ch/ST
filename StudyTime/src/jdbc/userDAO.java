package jdbc;

import java.sql.*;
import java.util.*;

import javax.naming.NamingException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import util.ConnectionPool;

public class userDAO {

	private static PreparedStatement pstmt;
	private static String sql;
	private static ResultSet rs;
	userDTO udto;
	private static Connection conn;
	
	public static boolean insert(String id, String password, String name, String email, String gender) throws SQLException, NamingException {
			
			try {
				sql = " INSERT INTO user (id, password, name, email, gender) "
						+ " VALUES(?, ?, ?, ?, ?) ";
	
				conn = ConnectionPool.get();
				
				pstmt = conn.prepareStatement(sql);
	
				pstmt.setString(1, id);
				pstmt.setString(2, password);
				pstmt.setString(3, name);
				pstmt.setString(4, email);
				pstmt.setString(5, gender);
	
				int result = pstmt.executeUpdate();
				if (result == 1) {
					return true;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if(pstmt != null)
				pstmt.close();
				if(conn != null)
				conn.close();
			}
	
			return false;
		}
		
	public static ArrayList<userDTO> getAllList() throws SQLException, NamingException{
			
		ArrayList<userDTO> users = new ArrayList<userDTO>();
		
		try {
			sql = " SELECT * FROM user ORDER BY ts ASC ";
	
			conn = ConnectionPool.get();
			
			pstmt = conn.prepareStatement(sql);
	
			rs = pstmt.executeQuery();
			
			
			
			while(rs.next()) {		
				users.add(new userDTO(rs.getString(1),
									rs.getString(2),
									rs.getString(3),
									rs.getString(4),
									rs.getString(5),
									rs.getString(6)));
			}
	
				return users;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)
			pstmt.close();
			if(conn != null)
			conn.close();
		}
	
		return users;
	
		}
	
	public static userDTO getOneList(String id) throws SQLException, NamingException{
		
		userDTO user = new userDTO();
		
		try {
			sql = " SELECT * FROM user where id=? ";
	
			conn = ConnectionPool.get();
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
	
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				user.setId((rs.getString("id")));
				user.setPassword((rs.getString("password")));
				user.setName((rs.getString("name")));
				user.setTs((rs.getString("ts")));
				user.setEmail((rs.getString("email")));
				user.setGender((rs.getString("gender")));
				
			}
			
			return user;
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)
			pstmt.close();
			if(conn != null)
			conn.close();
		}
	
		return user;
	
		}
	
	public static boolean update(userDTO udto, String id) throws NamingException, SQLException {
		
		try {
			
			sql = "UPDATE user SET id=?, name=?, email=?, gender=? "
					+ " WHERE id=? ";

			conn = ConnectionPool.get();
			
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);
			pstmt.setString(2, udto.getName());
			pstmt.setString(3, udto.getEmail());
			pstmt.setString(4, udto.getGender());
			pstmt.setString(5, udto.getId());

			int result = pstmt.executeUpdate();
			if (result == 1) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)
			pstmt.close();
			if(conn != null)
			conn.close();
		}

		return false;

	}
	
	public static boolean delete(String id) throws NamingException, SQLException {
	
	try {
		
		sql = "DELETE from user where id=? ";

		conn = ConnectionPool.get();
		
		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, id);

		int result = pstmt.executeUpdate();
		if (result == 1) {
			return true;
		}
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		if(pstmt != null)
		pstmt.close();
		if(conn != null)
		conn.close();
	}

	return false;

}
	
	//회원가입시 아이디가 이미 존재하는지 여부 확인
		public static boolean exist(String id) throws SQLException{
			
			String sql = "SELECT * FROM user WHERE id=?";
			ResultSet rs = null;
			Connection conn = null;
			PreparedStatement pstmt = null;
			try {
				

			
				conn = ConnectionPool.get();
				
				pstmt = conn.prepareStatement(sql);
		
				pstmt.setString(1, id);
				
				rs = pstmt.executeQuery();
				

				if(rs.next())
					return true;

				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(pstmt != null)
				pstmt.close();
				if(conn != null)
				conn.close();
			}
			
			return false;
		}
	
		public static boolean existTemp(String id) throws SQLException{
			
			String sql = "SELECT * FROM temp WHERE id=?";
			ResultSet rs = null;
			Connection conn = null;
			PreparedStatement pstmt = null;
			try {
				

			
				conn = ConnectionPool.get();
				
				pstmt = conn.prepareStatement(sql);
		
				pstmt.setString(1, id);
				
				rs = pstmt.executeQuery();
				

				if(rs.next())
					return true;

				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(pstmt != null)
				pstmt.close();
				if(conn != null)
				conn.close();
			}
			
			return false;
		}
		
	//회원 로그인
		public static int login(String id, String password) throws SQLException{
			
			String sql = "SELECT * FROM user WHERE id=?";
			try {
				
			int result;
			
			Connection conn = ConnectionPool.get();
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
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
			
//			if(!mpass.equals(rs.getString(2))) return 2; // 비번만 틀린 경우
			
		}
	
		public static int loginTemp(String id, String password) throws SQLException{
			
			String sql = "SELECT * FROM temp WHERE id=?";
			try {
				
			int result;
			
			Connection conn = ConnectionPool.get();
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
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
			
//			if(!mpass.equals(rs.getString(2))) return 2; // 비번만 틀린 경우
			
		}
		
	public static boolean inserttemp(String id, String password, String name, String email, String gender) throws SQLException, NamingException {
				
				try {
					sql = " INSERT INTO temp (id, password, name, email, gender) "
							+ " VALUES(?, ?, ?, ?, ?) ";
		
					conn = ConnectionPool.get();
					
					pstmt = conn.prepareStatement(sql);
		
					pstmt.setString(1, id);
					pstmt.setString(2, password);
					pstmt.setString(3, name);
					pstmt.setString(4, email);
					pstmt.setString(5, gender);
		
					int result = pstmt.executeUpdate();
					if (result == 1) {
						return true;
					}
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					if(pstmt != null)
					pstmt.close();
					if(conn != null)
					conn.close();
				}
		
				return false;
			}
		
	public static ArrayList<userDTO> getAlltemp() throws SQLException, NamingException{
		
		ArrayList<userDTO> users = new ArrayList<userDTO>();
		
		try {
			sql = " SELECT * FROM temp ORDER BY ts ASC ";
	
			conn = ConnectionPool.get();
			
			pstmt = conn.prepareStatement(sql);
	
			rs = pstmt.executeQuery();
			
			
			
			while(rs.next()) {		
				users.add(new userDTO(rs.getString(1),
									rs.getString(2),
									rs.getString(3),
									rs.getString(4),
									rs.getString(5),
									rs.getString(6)));
			}
	
				return users;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)
			pstmt.close();
			if(conn != null)
			conn.close();
		}
	
		return users;
	
		}
	
	
	public static userDTO getOneTemp(String id) throws SQLException, NamingException{
		
		userDTO user = new userDTO();
		
		try {
			sql = " SELECT * FROM temp where id=? ";
	
			conn = ConnectionPool.get();
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
	
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				user.setId((rs.getString("id")));
				user.setPassword((rs.getString("password")));
				user.setName((rs.getString("name")));
				user.setTs((rs.getString("ts")));
				user.setEmail((rs.getString("email")));
				user.setGender((rs.getString("gender")));
				
			}
			
			return user;
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)
			pstmt.close();
			if(conn != null)
			conn.close();
		}
	
		return user;
	
		}
	

	public static boolean deleteTemp(String id) throws NamingException, SQLException {
		
	try {
		
		sql = "DELETE from temp where id=? ";
	
		conn = ConnectionPool.get();
		
		pstmt = conn.prepareStatement(sql);
	
		pstmt.setString(1, id);
	
		int result = pstmt.executeUpdate();
		if (result == 1) {
			return true;
		}
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		if(pstmt != null)
		pstmt.close();
		if(conn != null)
		conn.close();
	}
	
	return false;
	
	}


	
}