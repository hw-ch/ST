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

public class productDAO {

	private static PreparedStatement pstmt;
	private static String sql;
	private static ResultSet rs;
	productDTO pdto;
	private static Connection conn;
	
	public static boolean insert(String pid, String pname, String price, String description, String maker, String category, String pimage) throws SQLException, NamingException {
			
			try {
				sql = " INSERT INTO product (pid, pname, price, description, maker, category, pimage) "
						+ " VALUES(?, ?, ?, ?, ?, ?, ?) ";
	
				conn = ConnectionPool.get();
				
				pstmt = conn.prepareStatement(sql);
	
				pstmt.setString(1, pid);
				pstmt.setString(2, pname);
				pstmt.setString(3, price);
				pstmt.setString(4, description);
				pstmt.setString(5, maker);
				pstmt.setString(6, category);
				pstmt.setString(7, pimage);
	
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
		
	public static ArrayList<productDTO> getAllList() throws SQLException, NamingException{
			
		ArrayList<productDTO> products = new ArrayList<productDTO>();
		
		try {
			sql = " SELECT * FROM product ORDER BY pno DESC ";
	
			conn = ConnectionPool.get();
			
			pstmt = conn.prepareStatement(sql);
	
			rs = pstmt.executeQuery();
			
			
			
			while(rs.next()) {		
				products.add(new productDTO(rs.getString(1),
									rs.getString(2),
									rs.getString(3),
									rs.getString(4),
									rs.getString(5),
									rs.getString(6),
									rs.getString(7),
									rs.getString(8)));
			}
	
				return products;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)
			pstmt.close();
			if(conn != null)
			conn.close();
		}
	
		return products;
	
		}
	
	public static productDTO getOneList(String pid) throws SQLException, NamingException{
		
		productDTO product = new productDTO();
		
		try {
			sql = " SELECT * FROM product where pid=? ";
	
			conn = ConnectionPool.get();
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, pid);
	
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				product.setPid((rs.getString("pno")));
				product.setPid((rs.getString("pid")));
				product.setPname((rs.getString("pname")));
				product.setPrice((rs.getString("price")));
				product.setDescription((rs.getString("description")));
				product.setMaker((rs.getString("maker")));
				product.setCategory((rs.getString("category")));
				product.setPimage((rs.getString("pimage")));
				
			}
			
			return product;
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)
			pstmt.close();
			if(conn != null)
			conn.close();
		}
	
		return product;
	
		}
	
	public static boolean update(productDTO pdto) throws NamingException, SQLException {
		
		try {
			
			sql = "UPDATE product SET pid=?, pname=?, description=?, maker=?, category=?, pimage=? "
					+ " WHERE pno=? ";

			conn = ConnectionPool.get();
			
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, pdto.getPid());
			pstmt.setString(2, pdto.getPname());
			pstmt.setString(3, pdto.getDescription());
			pstmt.setString(4, pdto.getMaker());
			pstmt.setString(5, pdto.getCategory());
			pstmt.setString(6, pdto.getPimage());
			pstmt.setString(7, pdto.getPno());

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
	
	public static boolean delete(String pno) throws NamingException, SQLException {
	
	try {
		
		sql = "DELETE FROM product where pno=? ";

		conn = ConnectionPool.get();
		
		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, pno);

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
