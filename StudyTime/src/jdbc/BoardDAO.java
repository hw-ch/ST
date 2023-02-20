/*
--------------------------------------------------------
최초작성자 : 김남훈
최초작성일 : 2023/02/15

버전 기록 : ver1(시작 23/02/15)
		  ver2(23/02/18) 게시글 내 댓글 삭제 메소드 추가
--------------------------------------------------------
*/
package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import javax.naming.NamingException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import util.ConnectionPool;

public class BoardDAO {
	
	private static PreparedStatement pstmt;
	private static String sql;
	private static ResultSet rs;
	private static Connection conn;
	
	//게시글 수 가져오기 (남훈)
	public int getBoardCount(){
		int count = 0;

		try {
			sql = "select count(*) from board";
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				count = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} 
		return count;
	}
	
	//게시물 목록가져오기(남훈)
	public static ArrayList<BoardDTO> getallList(int startRow, int pageSize) {
		ArrayList<BoardDTO> boards = new ArrayList<BoardDTO>();

		try {
			sql = "SELECT * FROM board ORDER BY bno DESC limit ?,?";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				boards.add(new BoardDTO(rs.getString(1),
										rs.getString(2),
										rs.getString(3),
										rs.getString(4),
										rs.getString(5),
										rs.getString(6),
										rs.getString(7),
										rs.getString(8),
										rs.getString(9),
										rs.getString(10),
										rs.getString(11)));
			}
			return boards;
	
	}catch(Exception e) {
		e.printStackTrace();
	} 
		return boards;
	}
	
//	게시물 보기(남훈)
	public static BoardDTO getboard(int bNo){
		String sql = "SELECT bNo, subject, content, nickname, userid, hit, good, bad, DATE_FORMAT(regDate, '%Y-%m-%d') AS regDate, replyNum from board WHERE bNo = ?";
		try {
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				BoardDTO board = new BoardDTO();
				board.setBNo(rs.getString(1));
				board.setSubject(rs.getString(2));
				board.setContent(rs.getString(3));
				board.setNickName(rs.getString(4));
				board.setUserId(rs.getString(5));
				board.setHit(rs.getString(6));
				board.setGood(rs.getString(7));
				board.setBad(rs.getString(8));
				board.setRegDate(rs.getString(9));
				board.setReplyNum(rs.getString(10));

				return board;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
//	게시물 삭제(남훈)
	public static void Boarddelete(int bno) {
		
		try {
			String sql = "DELETE FROM Board WHERE bno = ?";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			pstmt.executeUpdate();
			
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
	}
	
	//게시글 안에 댓글 삭제(남훈)
	public static void Replydelete(int bno) {

		try {
			String sql = "DELETE FROM Reply WHERE bno = ?";

			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			pstmt.executeUpdate();
	
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

	}
	
//	게시물 수정(남훈)	
	public static int Boardupdate(int bno, String subject, String content) {
		
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
			try {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
			if(rs != null) rs.close();
				
				
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return -1;
	}
	
//	커뮤니티 게시물 등록 메서드(도영)
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

		

	


}
