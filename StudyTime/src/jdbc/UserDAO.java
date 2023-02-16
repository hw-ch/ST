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
	UserDTO udto;
	private static Connection conn;
	
//	회원정보 수정 메서드
	public static boolean update(String userId, String nickName, String name, String gender, String image, String phone) throws NamingException, SQLException {
		
		try {
			sql = "UPDATE user SET userId=?, nickName=?, name=?, gender=?, image=?, phone=? "
					+ " WHERE userId=? ";

			conn = ConnectionPool.get();
			
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
			if(pstmt != null)
			pstmt.close();
			if(conn != null)
			conn.close();
		}

		return false;

	}
	
//	회원정보 삭제 메서드
	public static boolean delete(String userId) throws NamingException, SQLException {
	
	try {
		
		sql = "DELETE from user where userid=? ";

		conn = ConnectionPool.get();
		
		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, userId);

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