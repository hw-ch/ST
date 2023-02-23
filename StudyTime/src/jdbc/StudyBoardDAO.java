/*
--------------------------------------------------------
최초작성자 : 최혜원(wone8115@uos.ac.kr)
최초작성일 : 2023/02/23

버전 기록 : ver1(시작 23/02/23)
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

public class StudyBoardDAO { 
	
	private static PreparedStatement pstmt;
    private static String sql;
    private static ResultSet rs;
    private static Connection conn;
    
    //스터디 번호 확인(혜원)
    public static String sNoCheck(String bno) {
		
		String result = "";
		
		try {
			String sql = "select sNo from studyboard where bNo = ?";
			
			try {
				conn = ConnectionPool.get();
			} catch (NamingException | SQLException e){
				e.printStackTrace();
			}
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, bno);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getString(1);
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch(Exception e) {e.printStackTrace();}
            if (conn != null) try { conn.close(); } catch(Exception e) {e.printStackTrace();}
		}
		
		return result;
	}
    
    //작성자 확인 (혜원)
    public static String wirterCheck(String bno) {
		
		String result = "";
		
		try {
			String sql = "select userid from studyboard where bNo = ?";
			
			try {
				conn = ConnectionPool.get();
			} catch (NamingException | SQLException e){
				e.printStackTrace();
			}
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, bno);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getString(1);
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch(Exception e) {e.printStackTrace();}
            if (conn != null) try { conn.close(); } catch(Exception e) {e.printStackTrace();}
		}
		
		return result;
	}
    
	
	
	
	
	//커뮤니티 게시물 등록(혜원)
	public static int boardinsert(String title, String content, String sNo, String userid) {
		
		int result = 0;
		
		
		try {
			String sql = "INSERT INTO studyboard (subject, content, hit, sNo, userid, nickname) values(?,?, 0, ?, ?, (select nickname from user where userid= ?))";
			
			try {
				conn = ConnectionPool.get();
			} catch (NamingException | SQLException e){
				e.printStackTrace();
			}
			
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, sNo);
			pstmt.setString(4, userid);
			pstmt.setString(5, userid);
			
			result = pstmt.executeUpdate();
						
		}catch (Exception e) {
			e.printStackTrace();
		
		}finally {
			if (pstmt != null) try { pstmt.close(); } catch(Exception e) {e.printStackTrace();}
            if (conn != null) try { conn.close(); } catch(Exception e) {e.printStackTrace();}
		}
		
		return result;
	}
	
	//커뮤니티 게시물 상세보기(혜원)
	public static String getBoard(int bNo){
		sql = "select subject, content, nickname, hit from studyboard where bNo = ?";
		JSONObject obj = new JSONObject();
		
		try {
			try {
				conn = ConnectionPool.get();
			} catch (NamingException | SQLException e){
				e.printStackTrace();
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bNo);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				obj.put("subject", rs.getString(1));
				obj.put("content", rs.getString(2));
				obj.put("nickname", rs.getString(3));
				obj.put("hit", rs.getString(4));
			}
			
			
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
			String sql = "DELETE FROM studyboard WHERE bno = ?";
			
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
	
	//커뮤니티 게시물 수정(혜원)
		public static int update(int bno, String title, String content) {
			int result = 0;
			
			try {
				String sql = "UPDATE studyboard SET subject = ?, content = ? WHERE bno = ? ";
				
				try {
					conn = ConnectionPool.get();
				} catch (NamingException | SQLException e){
					e.printStackTrace();
				}
				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, title);
				pstmt.setString(2, content);
				pstmt.setInt(3, bno);
				
				result = pstmt.executeUpdate();
							
			}catch (Exception e) {
				e.printStackTrace();
			
			}finally {
	            if (pstmt != null) try { pstmt.close(); } catch(Exception e) {e.printStackTrace();}
	            if (conn != null) try { conn.close(); } catch(Exception e) {e.printStackTrace();}
			}
			
			return result;
		}
		
		
		//조회수 추가(혜원)
		public static int updateHit(String bno) {
			int result = 0;
			
			try {
				String sql = "UPDATE studyboard SET hit = hit+1 where bno = ?";
				
				try {
					conn = ConnectionPool.get();
				} catch (NamingException | SQLException e){
					e.printStackTrace();
				}
				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, bno);
				
				result = pstmt.executeUpdate();
							
			}catch (Exception e) {
				e.printStackTrace();
			
			}finally {
	            if (pstmt != null) try { pstmt.close(); } catch(Exception e) {e.printStackTrace();}
	            if (conn != null) try { conn.close(); } catch(Exception e) {e.printStackTrace();}
			}
			
			return result;
		}
		
		// 게시판 리스트 page(혜원)
		public static String getListPage(int pageNum, int pageSize, String sNo){
			sql = "select a.* " + 
					"from (select @rownum := @rownum + 1 rownum, t.bNo, t.subject, t.content, t.nickname, t.userid, t.hit, t.good, t.bad, DATE_FORMAT(t.regDate, '%y-%m-%d') AS regDate, t.uptDate, t.replyNum, t.sNo from studyboard t where(@rownum := 0) = 0 and sNo=? order by bno desc) as a " + 
					"where rownum between (?-1)*?+1 and (?*?)";
			JSONArray boardList = new JSONArray();
			
			try {
				try {
					conn = ConnectionPool.get();
				} catch (NamingException | SQLException e){
					e.printStackTrace();
				}
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, sNo);
				pstmt.setInt(2, pageNum);
				pstmt.setInt(3, pageSize);
				pstmt.setInt(4, pageNum);
				pstmt.setInt(5, pageSize);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					JSONObject obj = new JSONObject();
					obj.put("bNo", rs.getString(2));
					obj.put("subject", rs.getString(3));
					obj.put("nickname", rs.getString(5));
					obj.put("regDate", rs.getString(10));
				
					boardList.add(obj);
					
				}
				
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
	            if (rs != null) try { rs.close(); } catch (SQLException e) {e.printStackTrace();}
				if (pstmt != null) try { pstmt.close(); } catch(Exception e) {e.printStackTrace();}
	            if (conn != null) try { conn.close(); } catch(Exception e) {e.printStackTrace();}
			}
			return boardList.toJSONString();
		}
		
		//전체 게시물 개수 확인
		public static int count(String sNo){
			sql = "select count(*) as total from studyboard where sNo = ?";
			int total = 0;
			
			try {
				try {
					conn = ConnectionPool.get();
				} catch (NamingException | SQLException e){
					e.printStackTrace();
				}
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, sNo);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					total = rs.getInt(1);
					
				}
				
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
	            if (rs != null) try { rs.close(); } catch (SQLException e) {e.printStackTrace();}
				if (pstmt != null) try { pstmt.close(); } catch(Exception e) {e.printStackTrace();}
	            if (conn != null) try { conn.close(); } catch(Exception e) {e.printStackTrace();}
			}
			return total;
		}
}



