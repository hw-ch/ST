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
	
	
	public static int Boarddelete(String bno) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			String sql = "DELETE FROM Board WHERE bno = ?";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, bno);
			result = pstmt.executeUpdate();
				
			return result;
				
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt!= null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}
	
	public static int Boardupdate(int bno, String subject, String content) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "UPDATE board SET subject= ?, content = ? WHERE bno = ?";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setInt(3, bno);

			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

	private static PreparedStatement pstmt;
	private static String sql;
	private static ResultSet rs;
	BoardDTO bdto;
	private static Connection conn;
	
//	커뮤니티 게시물 등록 메서드
	public static boolean insert(String subject, String content, String nickName, String userId){
			
			try {
				sql = " INSERT INTO board (subject, content, nickName, userId) "
						+ " VALUES(?, ?, ?, ?) ";
	
				try {
					conn = ConnectionPool.get();
				} catch (NamingException e) {
					e.printStackTrace();
				}
				
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
				try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				if(rs != null) rs.close();
					
					
				} catch (Exception e2) {
					e2.printStackTrace();
				}
				}
	
			return false;
		}
		return -1;
	}
}
		

	


}
