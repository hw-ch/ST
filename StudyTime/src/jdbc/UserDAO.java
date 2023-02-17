package jdbc;

import java.sql.*;
import java.util.*;

import javax.naming.NamingException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import util.ConnectionPool;

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

			try {
				conn = ConnectionPool.get();
			} catch (NamingException e) {
				e.printStackTrace();
			}
			
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, userId);
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
	public static boolean delete(String userId){
	
	try {
		
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
		}
	
		return user;
	
	}
	

	
}