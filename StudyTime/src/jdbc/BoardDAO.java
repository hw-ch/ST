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

public class BoardDAO {

	private static PreparedStatement pstmt;
	private static String sql;
	private static ResultSet rs;
	BoardDTO bdto;
	private static Connection conn;
	
//	커뮤니티 게시물 등록 메서드
	public static boolean insert(String subject, String content, String nickName, String userId) throws SQLException, NamingException {
			
			try {
				sql = " INSERT INTO board (subject, content, nickName, userId) "
						+ " VALUES(?, ?, ?, ?) ";
	
				conn = ConnectionPool.get();
				
				pstmt = conn.prepareStatement(sql);
	
				pstmt.setString(1, subject);
				pstmt.setString(2, content);
				pstmt.setString(3, nickName);
				pstmt.setString(4, userId);
	
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
