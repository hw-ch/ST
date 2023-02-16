package jdbc;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.ConnectionPool;

public class StudyDAO {
	//스터디 수정
		public static boolean update(String sNo, String sTitle, String sContent) {
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				boolean result = false;
				
				try {
					String sql = "UPDATE study SET sTitle = ?, sContent = ? WHERE sNo = ? ";
					
					conn = ConnectionPool.get();
					pstmt = conn.prepareStatement(sql);

					pstmt.setString(1, sTitle);
					pstmt.setString(2, sContent);
					pstmt.setString(3, sNo);
					
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
		public static int delete(String sNo) {
			
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
