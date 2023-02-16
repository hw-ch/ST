/*
--------------------------------------------------------
최초작성자 : 최혜원(wone8115@uos.ac.kr)
최초작성일 : 2023/02/15

버전 기록 : ver1(시작 23/02/15)
--------------------------------------------------------
*/

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
	
	private static PreparedStatement pstmt;
    private static String sql;
    private static ResultSet rs;
    private static Connection conn;
	
	
	// 공지사항 리스트 모두 가져오기(혜원)
	public static String getList(){
		sql = "SELECT bno, title, content, DATE_FORMAT(regDate, '%y-%m-%d') AS regDate, hit FROM notice ORDER BY bNo DESC";
		JSONArray noticeList = new JSONArray();
		
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
				obj.put("bNo", rs.getString(1));
				obj.put("title", rs.getString(2));
				obj.put("content", rs.getString(3));
				obj.put("regDate", rs.getString(4));
				obj.put("hit", rs.getString(5));
			
				noticeList.add(obj);
				
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) {e.printStackTrace();}
			if (pstmt != null) try { pstmt.close(); } catch(Exception e) {e.printStackTrace();}
            if (conn != null) try { conn.close(); } catch(Exception e) {e.printStackTrace();}
		}
		return noticeList.toJSONString();
	}
	
	//공지사항 등록(혜원)
	public static boolean insert(String title, String content) {
		
		boolean result = false;
		
		try {
			String sql = "INSERT INTO notice (title, content, hit) values(?,?, 0)";
			
			try {
				conn = ConnectionPool.get();
			} catch (NamingException | SQLException e){
				e.printStackTrace();
			}
			
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, title);
			pstmt.setString(2, content);
			
			result = pstmt.execute();
						
		}catch (Exception e) {
			e.printStackTrace();
		
		}finally {
			if (pstmt != null) try { pstmt.close(); } catch(Exception e) {e.printStackTrace();}
            if (conn != null) try { conn.close(); } catch(Exception e) {e.printStackTrace();}
		}
		
		return result;
	}
	
	//공지사항 상세보기(혜원)
	public static String getNotice(int bNo){
		sql = "SELECT * FROM notice WHERE bNo = ?";
		JSONObject obj = new JSONObject();
		
		try {
			try {
				conn = ConnectionPool.get();
			} catch (NamingException | SQLException e){
				e.printStackTrace();
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(bNo, 1);
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
            if (pstmt != null) try { pstmt.close(); } catch(Exception e) {e.printStackTrace();}
            if (conn != null) try { conn.close(); } catch(Exception e) {e.printStackTrace();}
            if (rs != null) try { rs.close(); } catch (SQLException e) {e.printStackTrace();}
        }
		return obj.toJSONString();
	}
	
	// 공지사항 삭제(혜원)
	public static int delete(String bno) {
		
		int result = 0;
		
		try {
			String sql = "DELETE FROM notice WHERE bno = ?";
			
			try {
				conn = ConnectionPool.get();
			} catch (NamingException | SQLException e){
				e.printStackTrace();
			}
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, bno);
			result = pstmt.executeUpdate();
				
			return result;
				
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch(Exception e) {e.printStackTrace();}
            if (conn != null) try { conn.close(); } catch(Exception e) {e.printStackTrace();}
		}
		
		return result;
	}
	
	//공지사항 수정(혜원)
		public static boolean update(String bno, String title, String content) {
			boolean result = false;
			
			try {
				String sql = "UPDATE notice SET title = ?, content = ? WHERE bno = ? ";
				
				try {
					conn = ConnectionPool.get();
				} catch (NamingException | SQLException e){
					e.printStackTrace();
				}
				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, title);
				pstmt.setString(2, content);
				pstmt.setString(3, bno);
				
				result = pstmt.execute();
							
			}catch (Exception e) {
				e.printStackTrace();
			
			}finally {
	            if (pstmt != null) try { pstmt.close(); } catch(Exception e) {e.printStackTrace();}
	            if (conn != null) try { conn.close(); } catch(Exception e) {e.printStackTrace();}
			}
			
			return result;
		}
	
}



