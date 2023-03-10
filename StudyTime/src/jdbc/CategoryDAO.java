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
	private static Connection conn;
	
	public CategoryDAO() {
		try {conn = ConnectionPool.get();} catch (NamingException | SQLException e) {e.printStackTrace();}
	}
	
	//카테고리 드롭다운(지원)
			public static CategoryDTO category(String cNo){	
				sql = "SELECT * FROM category where cNo = ?";
				CategoryDTO cdto = null;
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, cNo);
					rs = pstmt.executeQuery();
					if(rs.next()) {
						return new CategoryDTO(rs.getString(1),rs.getString(2),rs.getString(3));
					}
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					if (pstmt != null) try { pstmt.close(); } catch(Exception e) {e.printStackTrace();}
					if (conn != null) try { conn.close(); } catch(Exception e) {e.printStackTrace();}
					if (rs != null) try { rs.close(); } catch (SQLException e) {e.printStackTrace();}
				}
				return cdto;
			}	
	



	
//	카테고리 분류 메서드(도영)
	public static ArrayList<CategoryDTO> select(String category1){
			
		ArrayList<CategoryDTO> category = new ArrayList<CategoryDTO>();
		try {
			
			if(category1.equals("all")) {
			sql = "SELECT * from category ";
			}else {
			sql = "SELECT * from category where category1=? ";
			}
			
			try {
				conn = ConnectionPool.get();
			} catch (NamingException e) {
				e.printStackTrace();
			}
			
			pstmt = conn.prepareStatement(sql);
			if(!category1.equals("all")) {
				pstmt.setString(1, category1);
			}
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				category.add(new CategoryDTO(rs.getString(1),
									rs.getString(2),
									rs.getString(3)));
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
	
	//카테고리 1 목록(지원)
		public static List<CategoryDTO> category1List(){	
			sql = "SELECT DISTINCT category1 FROM category";
			List<CategoryDTO> categoryList = new ArrayList<>();
			try {
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					categoryList.add(new CategoryDTO(rs.getString(1)));
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
		
	//카테고리 2 목록(지원)
	public static List<CategoryDTO> category2List(){	
		sql = "SELECT * FROM category ORDER BY cNo";
		List<CategoryDTO> categoryList = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql);
			//pstmt.setString(1, category1);
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


