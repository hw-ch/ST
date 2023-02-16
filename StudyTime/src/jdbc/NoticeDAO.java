package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.NamingException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import util.ConnectionPool;

public class NoticeDAO { 
	
	// 공지사항 리스트 모두 가져오기
	public static String getList(){
<<<<<<< Updated upstream
		String SQL = "SELECT bno, title, content, DATE_FORMAT(regDate, '%y-%m-%d') AS regDate, hit FROM notice ORDER BY bNo DESC";
=======
		String SQL = "SELECT * FROM notice ORDER BY bNo DESC";
>>>>>>> Stashed changes
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		JSONArray noticeList = new JSONArray();
		
		try {
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				JSONObject obj = new JSONObject();
				obj.put("bNo", rs.getString(1));
				obj.put("title", rs.getString(2));
				obj.put("content", rs.getString(3));
				obj.put("regDate", rs.getString(4));
<<<<<<< Updated upstream
				obj.put("hit", rs.getString(5));
=======
				obj.put("uptDate", rs.getString(5));
				obj.put("hit", rs.getString(6));
>>>>>>> Stashed changes
			
				noticeList.add(obj);
				
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!= null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return noticeList.toJSONString();
	}
	
	//공지사항 등록
	public static boolean insert(String title, String content) {
		
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean result = false;
		
		try {
			String sql = "INSERT INTO notice (title, content, hit) values(?,?, 0)";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, title);
			pstmt.setString(2, content);
			
			result = pstmt.execute();
						
		}catch (Exception e) {
			e.printStackTrace();
		
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}
	
	//공지사항 상세보기
	public static String getNotice(int nNo){
		String SQL = "SELECT * FROM notice WHERE nNo = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		JSONObject obj = new JSONObject();
		
		try {
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			rs.next();
			
			obj.put("bNo", rs.getString(1));
			obj.put("title", rs.getString(2));
			obj.put("content", rs.getString(3));
			obj.put("regDate", rs.getString(4));
			obj.put("uptDate", rs.getString(5));
			obj.put("hit", rs.getString(6));
			
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!= null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return obj.toJSONString();
	}
	
	// 공지사항 삭제
	public static int delete(String bno) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			String sql = "DELETE FROM notice WHERE bno = ?";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bno);
			result = pstmt.executeUpdate();
				
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
	
	//공지사항 수정
		public static boolean update(String bno, String title, String content) {
			
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			boolean result = false;
			
			try {
				String sql = "UPDATE notice SET title = ?, content = ? WHERE bno = ? ";
				
				conn = ConnectionPool.get();
				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, title);
				pstmt.setString(2, content);
				pstmt.setString(3, bno);
				
				result = pstmt.execute();
							
			}catch (Exception e) {
				e.printStackTrace();
			
			}finally {
				try {
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			return result;
		}
	
<<<<<<< Updated upstream
}




=======
}
>>>>>>> Stashed changes
