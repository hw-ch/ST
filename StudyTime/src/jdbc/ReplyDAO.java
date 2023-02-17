package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.ConnectionPool;

public class ReplyDAO {
	
	// 댓글 리스트 모두 가져오기
	public static ArrayList<ReplyDTO> ReplygetList(int bno){
		String sql = "SELECT * FROM Reply WHERE bno = ? ORDER BY rNo DESC";
		ArrayList<ReplyDTO> list = new ArrayList<ReplyDTO>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, bno);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ReplyDTO reply = new ReplyDTO();
				reply.setContent(rs.getString(1));
				reply.setNickname(rs.getString(2));
				reply.setUserid(rs.getString(3));
				reply.setRegDate(rs.getString(4));
				list.add(reply);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; //데이터베이스 오류
	}
	
	public static boolean Replyinsert(String content, String nickname, String userid, int bno) {
		
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean result = false;
		
		try {
			String sql = "INSERT INTO reply (content, nickname, userid, bno) values(?, ?, ?, ?)";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, content);
			pstmt.setString(2, nickname);
			pstmt.setString(3, userid);
			pstmt.setInt(4, bno);

			
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