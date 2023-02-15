package jdbc;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import util.ConnectionPool;

public class StudyDAO {
	private String sql;
	private PreparedStatement pstmt;
	private Connection conn;
	private ResultSet rs;
	public StudyDAO() {
		try {conn = ConnectionPool.get();} catch (NamingException | SQLException e) {e.printStackTrace();}
	}
	//테스트
	public void test(){
		
	}
	
	
	//스터디목록(지원)
	public List<StudyDTO> studyList() {	
		sql = "SELECT * FROM study ORDER BY regDate DESC";
		List<StudyDTO> studyList = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				studyList.add(new StudyDTO(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),
					rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10),
					rs.getString(11),rs.getString(12),rs.getString(13),rs.getString(14),rs.getString(15)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch(Exception e) {e.printStackTrace();}
			if (conn != null) try { conn.close(); } catch(Exception e) {e.printStackTrace();}
			if (rs != null) try { rs.close(); } catch (SQLException e) {e.printStackTrace();}
		}
		return studyList;
	}	
	
	//스터디 상세보기(지원)
	public StudyDTO studyView(String sNo) {	
		sql = "SELECT * FROM study WHERE sNo=?";
		StudyDTO sdto = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return new StudyDTO(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),
						rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10),
						rs.getString(11),rs.getString(12),rs.getString(13),rs.getString(14),rs.getString(15));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch(Exception e) {e.printStackTrace();}
			if (conn != null) try { conn.close(); } catch(Exception e) {e.printStackTrace();}
			if (rs != null) try { rs.close(); } catch (SQLException e) {e.printStackTrace();}
		}
		return sdto;
	}
	
	//스터디생성(미완성)지원>>  cno 조인하기
	public boolean studyCreate(String sTitle, String sWriter, int cNo, String category1,
			String category2,String address, int recruitCnt, int joinCnt, String expDate,
			String startDate, String scontent,String process){
		sql = "INSERT INTO study(stitle,swriter,cNo,category1,category2,address,recruitCnt,joinCnt,expDate,"
				+ "startDate,scontent,process) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sTitle);
			pstmt.setString(2, sWriter);
			pstmt.setInt(3, cNo);
			pstmt.setString(4, category1);
			pstmt.setString(5, category2);
			pstmt.setString(6, address);
			pstmt.setInt(7, recruitCnt);
			pstmt.setInt(8, joinCnt);
			pstmt.setString(9, expDate);
			pstmt.setString(10, startDate);
			pstmt.setString(11, scontent);
			pstmt.setString(12, process);
			if(pstmt.executeUpdate()==1) return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			 if (pstmt != null) try { pstmt.close(); } catch(Exception e) {e.printStackTrace();}
	         if (conn != null) try { conn.close(); } catch(Exception e) {e.printStackTrace();}
		}
		return false;		
	}
	//스터디 수정(미완성)지원
	public static boolean studyUpdate(String sTitle, String sWriter, int cNo, String category1,
			String category2,String address, int recruitCnt, int joinCnt, String expDate,
			String startDate, String scontent,String process) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			boolean result = false;
			
			try {
				String sql = "UPDATE study SET sTitle = ?, sContent = ? WHERE sNo = ? ";
				
				conn = ConnectionPool.get();
				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, sTitle);
				
				
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
	// 스터디 삭제
			public static int studyDelete(String sNo) {
				
				Connection conn = null;
				PreparedStatement pstmt = null;
				int result = 0;
				
				try {
					String sql = "DELETE FROM study WHERE sNo = ?";
					
					conn = ConnectionPool.get();
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, sNo);
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
	
}
