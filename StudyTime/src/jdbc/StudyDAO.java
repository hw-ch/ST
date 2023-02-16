package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import util.ConnectionPool;

public class StudyDAO {

	private static PreparedStatement pstmt;
	private static String sql;
	private static ResultSet rs;
	StudyDTO sdto;
	private static Connection conn;
		
	public static ArrayList<StudyDTO> getAllList() throws SQLException, NamingException{
			
		ArrayList<StudyDTO> studys = new ArrayList<StudyDTO>();
		
		try {
			sql = " SELECT * FROM study ORDER BY sNo DESC ";
	
			conn = ConnectionPool.get();
			
			pstmt = conn.prepareStatement(sql);
	
			rs = pstmt.executeQuery();
			
			
			
			while(rs.next()) {		
				studys.add(new StudyDTO(rs.getString(1),
									rs.getString(2),
									rs.getString(3),
									rs.getString(4),
									rs.getString(5),
									rs.getString(6),
									rs.getString(7),
									rs.getString(8),
									rs.getString(9),
									rs.getString(10),
									rs.getString(11),
									rs.getString(12),
									rs.getString(13),
									rs.getString(14),
									rs.getString(15)));
			}
	
				return studys;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)
			pstmt.close();
			if(conn != null)
			conn.close();
		}
	
		return studys;
	
		}
	
	public static boolean apply(String sNo) throws NamingException, SQLException {
		
		try {
			
			sql = "UPDATE study SET apply=? "
					+ " WHERE sNo=? ";

			conn = ConnectionPool.get();
			
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, "승인");
			pstmt.setString(2, sNo);

			int result = pstmt.executeUpdate();
			if (result == 1) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)
			pstmt.close();
			if(conn != null)
			conn.close();
		}

		return false;

	}
	

	
	


}
