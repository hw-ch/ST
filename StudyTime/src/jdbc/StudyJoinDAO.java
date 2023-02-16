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
	StudyDTO sdto;
	private static Connection conn;
		
//	스터디 그룹원 추방 메서드
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
