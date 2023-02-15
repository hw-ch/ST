package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import util.ConnectionPool;

public class StudyJoinDAO {
	
	// 특정 스터디 가입 신청 목록 보기
	public static String getList(String sNo){
		String SQL = "SELECT sj.sNo u.userid, u.nickname, u.name, u.gender FROM studyJoin sj " + 
				"JOIN user u ON sj.userid = u.userid " + 
				"WHERE sj.sNo = ? " + 
				"ORDER BY sj.regDate DESC";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		JSONArray userList = new JSONArray();
		
		try {
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, sNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				JSONObject obj = new JSONObject();
				obj.put("sNo", rs.getString(1));
				obj.put("userid", rs.getString(2));
				obj.put("nickname", rs.getString(3));
				obj.put("name", rs.getString(4));
				obj.put("gender", rs.getString(5));
			
				userList.add(obj);
				
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!= null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return userList.toJSONString();
	}
	

}
