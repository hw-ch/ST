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

import com.mysql.cj.xdevapi.JsonString;

import lombok.ToString;
import util.ConnectionPool;

public class ReplyDAO {
	
	private static PreparedStatement pstmt;
    private static String sql;
    private static ResultSet rs;
    private static Connection conn;

	// 댓글 리스트 모두 가져오기(남훈)
	public static String getList(int bno){
		sql = "SELECT rNo, bNo, content, nickname, userid, DATE_FORMAT(regDate, '%Y-%m-%d %H:%i') AS regDate FROM reply WHERE bno = ? ORDER BY rNo DESC";
		
		JSONArray Replylist = new JSONArray();

		try {
			try {
				conn = ConnectionPool.get();
			} catch (NamingException | SQLException e){
				e.printStackTrace();
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
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
	
	// 수정할 댓글 내용 가져오기(남훈) * 임시
	public static ReplyDTO getUpdateReply(int rno){
		String sql = "SELECT content FROM reply WHERE rno = ?";

	try {
				conn = ConnectionPool.get();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, rno);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					ReplyDTO reply = new ReplyDTO();
					reply.setContent(rs.getString(1));

					return reply;
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
			return null;
		}
	
	//댓글 개수(남훈)
	public static int replyCount(int bno) {

		int result = 0;

		try {
			String sql = "UPDATE board SET replyNum =(SELECT COUNT(*) FROM reply WHERE bno = ? ) WHERE bno = ?;";

			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			pstmt.setInt(2, bno);

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
	public static int Replydelete(int rno) {

		int result = 0;

		try {
			String sql = "DELETE FROM Reply WHERE rno = ?";

			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rno);
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
	public static int replyupdate(String content, int rno) {

		int result = 0;

		try {
			String sql = "UPDATE reply SET content = ? WHERE rno = ?";

			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, content);
			pstmt.setInt(2, rno);

			result = pstmt.executeUpdate();
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
	
	//댓글 페이징 처리(남훈)
	public static String getListPage(int pageNum, int pageSize, int bno){
		sql = "select a.* FROM (select @rownum := @rownum + 1 rownum, r.rNo, r.bNo, r.content, r.nickname, r.userid, DATE_FORMAT(regDate, '%Y-%m-%d %H:%i')"
			+  "AS regDate from reply r where(@rownum := 0) = 0 and bno = ? order by rno DESC ) as a where rownum BETWEEN (?-1)*?+1 and (?*?)";
		JSONArray replyList = new JSONArray();
		
		try {
			try {
				conn = ConnectionPool.get();
			} catch (NamingException | SQLException e){
				e.printStackTrace();
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			pstmt.setInt(2, pageNum);
			pstmt.setInt(3, pageSize);
			pstmt.setInt(4, pageNum);
			pstmt.setInt(5, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				JSONObject obj = new JSONObject();
				obj.put("rowNum", rs.getString(1));
				obj.put("rNo", rs.getString(2));
				obj.put("bNo", rs.getString(3));
				obj.put("content", rs.getString(4));
				obj.put("nickname", rs.getString(5));
				obj.put("userid", rs.getString(6));
				obj.put("regDate", rs.getString(6));

				replyList.add(obj);
				
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) {e.printStackTrace();}
			if (pstmt != null) try { pstmt.close(); } catch(Exception e) {e.printStackTrace();}
            if (conn != null) try { conn.close(); } catch(Exception e) {e.printStackTrace();}
		}
		return replyList.toJSONString();
	}
	
}