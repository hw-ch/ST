package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import util.ConnectionPool;

public class ReplyDAO {
	
	// 댓글 리스트 모두 가져오기
	public static String ReplygetList(){
		String SQL = "SELECT * FROM Reply ORDER BY rNo DESC";
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
				obj.put("rNo", rs.getString(1));
				obj.put("content", rs.getString(2));
				obj.put("nickname", rs.getString(3));
				obj.put("userid", rs.getString(4));
				obj.put("regDate", rs.getString(5));
			
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
	
	public static boolean Replyinsert(ReplyDTO reply) {
		
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean result = false;
		
		try {
			String sql = "INSERT INTO reply (content, nickname, userid, bNo) values(?,?,?,?)";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, reply.getContent());
			pstmt.setString(2, reply.getNickname());
			pstmt.setString(3, reply.getUserid());
			pstmt.setString(4, reply.getBNo());
			
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
	
	// 댓글 삭제
	public static int Replydelete(String rno) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			String sql = "DELETE FROM Reply WHERE rno = ?";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, rno);
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
	
	// 댓글 수정
	public static boolean replyupdate(String rno, String content) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean result = false;
		
		try {
			String sql = "UPDATE reply SET content = ? WHERE rno = ?";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, content);
			pstmt.setString(2, rno);

			result = pstmt.execute();
								
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
}