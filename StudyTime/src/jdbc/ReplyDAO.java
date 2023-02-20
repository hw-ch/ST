/*
--------------------------------------------------------
최초작성자 : 김남훈
최초작성일 : 2023/02/15

버전 기록 : ver1(시작 23/02/15)
		  ver2(23/02/16)
		  ver3(23/02/17)
--------------------------------------------------------
*/

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

public class ReplyDAO {
	
	private static PreparedStatement pstmt;
    private static String sql;
    private static ResultSet rs;
    private static Connection conn;

	// 댓글 리스트 모두 가져오기(남훈)
	public static String getList(){
		sql = "SELECT rNo, bNo, content, nickname, userid, DATE_FORMAT(regDate, '%Y-%m-%d %H:%i') AS regDate FROM reply ORDER BY rNo DESC";
		JSONArray Replylist = new JSONArray();

		try {
			try {
				conn = ConnectionPool.get();
			} catch (NamingException | SQLException e){
				e.printStackTrace();
			}
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				JSONObject obj = new JSONObject();
				obj.put("rNo", rs.getString(1));
				obj.put("bNo", rs.getString(2));
				obj.put("content", rs.getString(3));
				obj.put("nickname", rs.getString(4));
				obj.put("userid", rs.getString(5));
				obj.put("regDate", rs.getString(6));


				Replylist.add(obj);

			}

		} catch(Exception e) {
			e.printStackTrace();
		} finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) {e.printStackTrace();}
			if (pstmt != null) try { pstmt.close(); } catch(Exception e) {e.printStackTrace();}
            if (conn != null) try { conn.close(); } catch(Exception e) {e.printStackTrace();}
		}
		return Replylist.toJSONString();
	}
	
	//댓글 추가 (남훈)
	public static int Replyinsert(String content, String nickname, String userid, int bno) {

		int result = 0;

		try {
			String sql = "INSERT INTO reply (content, nickname, userid, bno) values(?, ?, ?, ?)";

			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, content);
			pstmt.setString(2, nickname);
			pstmt.setString(3, userid);
			pstmt.setInt(4, bno);

			result = pstmt.executeUpdate();
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	// 댓글 삭제(남훈)
	public static int Replydelete(String rno) {

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
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return result;
	}

	
	
	// 댓글 수정(남훈)
	public static boolean replyupdate(String rno, String content) {

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
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return result;
	}
}