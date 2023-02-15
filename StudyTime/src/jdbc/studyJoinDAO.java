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

public class studyJoinDAO {

	private static PreparedStatement pstmt;
	private static String sql;
	private static ResultSet rs;
	studyDTO sdto;
	private static Connection conn;
		
	
	public static boolean delete(String userId, String sNo) throws NamingException, SQLException {
		
	try {
		
		sql = "DELETE from studyjoin where userid=? AND sNo=? ";

		conn = ConnectionPool.get();
		
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
		if(pstmt != null)
		pstmt.close();
		if(conn != null)
		conn.close();
	}

	return false;

}
	

	
	


}
