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

public class CategoryDAO {

	private static PreparedStatement pstmt;
	private static String sql;
	private static ResultSet rs;
	private static Connection conn;
	
//	카테고리 분류 메서드(도영)
	public static CategoryDTO select(String category1){
			
		CategoryDTO category = null;
		try {
			sql = "SELECT from category where category1=? ";
	
			try {
				conn = ConnectionPool.get();
			} catch (NamingException e) {
				e.printStackTrace();
			}
			
			pstmt = conn.prepareStatement(sql);
	
			pstmt.setString(1, category1);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				category = new CategoryDTO(rs.getString("cNo"),
						rs.getString("category1"),
						rs.getString("category2"));
			}
			
			return category;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null)	pstmt.close();
				if(conn != null)	conn.close();
				if(rs != null)	rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	
		return category;
	
	}
		

	


}
