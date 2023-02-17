package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import util.ConnectionPool;

public class StudyJoinDAO {

	private static PreparedStatement pstmt;
	private static String sql;
	private static ResultSet rs;
	private static Connection conn;
		
//	스터디 그룹원 추방 메서드(도영)
	public static boolean delete(String userId, String sNo){
		
	try {
		
		sql = "DELETE from studyjoin where userid=? AND sNo=? ";

		try {
			conn = ConnectionPool.get();
		} catch (NamingException e) {
			e.printStackTrace();
		}
		
		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, userId);
		pstmt.setString(2, sNo);

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
	
//	그룹장확인 메서드(도영)
	public static boolean checkManager(String userId){

		StudyJoinDTO studyjoin = null;
		try {
			sql = "SELECT from studyjoin where userid=? ";
	
			try {
				conn = ConnectionPool.get();
			} catch (NamingException e) {
				e.printStackTrace();
			}
			
			pstmt = conn.prepareStatement(sql);
	
			pstmt.setString(1, userId);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				studyjoin = new StudyJoinDTO(rs.getString("sjNo"),
						rs.getString("userid"),
						rs.getString("sNo"),
						rs.getString("approve"),
						rs.getString("regDate"));
			}
			
			if(studyjoin.getApprove().equals("3")) {
				return true;
			}else {
				return false;
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
	
	


}
