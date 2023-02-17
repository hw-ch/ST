package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import util.ConnectionPool;

public class CategoryDAO { 
	private static PreparedStatement pstmt;
	private static String sql;
	private static ResultSet rs;
	StudyDTO sdto;
	private static Connection conn;
	public CategoryDAO() {
		try {conn = ConnectionPool.get();} catch (NamingException | SQLException e) {e.printStackTrace();}
	}
	//카테고리 드롭다운 목록(지원)
			public static List<CategoryDTO> categoryList(){	
				sql = "SELECT * FROM category ORDER BY cNo";
				List<CategoryDTO> categoryList = new ArrayList<>();
				try {
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()) {
						categoryList.add(new CategoryDTO(rs.getString(1),rs.getString(2),rs.getString(3)));
					}
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					if (pstmt != null) try { pstmt.close(); } catch(Exception e) {e.printStackTrace();}
					if (conn != null) try { conn.close(); } catch(Exception e) {e.printStackTrace();}
					if (rs != null) try { rs.close(); } catch (SQLException e) {e.printStackTrace();}
				}
				return categoryList;
			}	
	
}



