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

public class StudyDAO {
	private static Connection conn;
	private static PreparedStatement pstmt;
	private static String sql;
	private static ResultSet rs;
	public StudyDAO() {
		try {conn = ConnectionPool.get();} catch (NamingException | SQLException e) {e.printStackTrace();}
	}

	
//	승인된 스터디 전체 목록 메서드(도영)
	public static ArrayList<StudyDTO> getAllList(){

		ArrayList<StudyDTO> studys = new ArrayList<StudyDTO>();

		try {
			sql = " SELECT * FROM study WHERE apply='승인' AND recruitCnt != joinCnt ORDER BY sNo DESC ";

			try {
				conn = ConnectionPool.get();
			} catch (NamingException e) {
				e.printStackTrace();
			}

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
			try {
				if(pstmt != null)	pstmt.close();
				if(conn != null)	conn.close();
				if(rs != null)	rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return studys;

		}
	
//	신청중인 스터디 전체 목록 메서드(도영)
	public static ArrayList<StudyDTO> gettempList2(){

		ArrayList<StudyDTO> studys = new ArrayList<StudyDTO>();

		try {
			sql = " SELECT * FROM study WHERE apply='신청중' ORDER BY sNo DESC ";

			try {
				conn = ConnectionPool.get();
			} catch (NamingException e) {
				e.printStackTrace();
			}

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
			try {
				if(pstmt != null)	pstmt.close();
				if(conn != null)	conn.close();
				if(rs != null)	rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return studys;

		}

//	승인된 스터디 전체 목록 메서드(도영)
	public static ArrayList<StudyDTO> getAllList2(){

		ArrayList<StudyDTO> studys = new ArrayList<StudyDTO>();

		try {
			sql = " SELECT * FROM study WHERE apply='승인' ORDER BY sNo DESC ";

			try {
				conn = ConnectionPool.get();
			} catch (NamingException e) {
				e.printStackTrace();
			}

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
			try {
				if(pstmt != null)	pstmt.close();
				if(conn != null)	conn.close();
				if(rs != null)	rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return studys;

		}
	
//	스터디 참여인원 증가 메서드(도영)
	public static boolean updateJoinCnt1(String sNo) {

		try {
			sql = "UPDATE study SET joinCnt=joinCnt+1 " + " WHERE sNo=? ";

			try {
				conn = ConnectionPool.get();
			} catch (NamingException e) {
				e.printStackTrace();
			}

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sNo);
			
			int result = pstmt.executeUpdate();
			if (result == 1) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return false;

	}
	
//	스터디 삭제 메서드(도영)
	public static boolean dropout(String userId) {

		try {

			sql = "DELETE from study where sWriter=? ";

			try {
				conn = ConnectionPool.get();
			} catch (NamingException e) {
				e.printStackTrace();
			}

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, userId);

			int result = pstmt.executeUpdate();
			if (result == 1) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return false;

	}
	
	// study joincnt update 메소드 (혜원)
    public static int cntUpdate(String sNo) {


        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int result = 0;

        try {
            String sql = "UPDATE study SET joinCnt = (SELECT count(sjNo) FROM studyjoin WHERE sno = ? AND approve='승인') WHERE sNo = ?";

            conn = ConnectionPool.get();
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, sNo);
            pstmt.setString(2, sNo);

            result = pstmt.executeUpdate();

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
	
//	스터디 참여인원 감소 메서드(도영)
	public static boolean updateJoinCnt2(String sNo) {

		try {
			sql = "UPDATE study SET joinCnt=joinCnt-1 " + " WHERE sNo=? ";

			try {
				conn = ConnectionPool.get();
			} catch (NamingException e) {
				e.printStackTrace();
			}

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sNo);
			
			int result = pstmt.executeUpdate();
			if (result == 1) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return false;

	}
	
//	참여가능한 신청중인 스터디 전체 목록 메서드(도영)
	public static ArrayList<StudyDTO> gettempList(){

		ArrayList<StudyDTO> studys = new ArrayList<StudyDTO>();

		try {
			sql = " SELECT * FROM study WHERE apply='신청중' AND recruitCnt != joinCnt ORDER BY sNo DESC ";

			try {
				conn = ConnectionPool.get();
			} catch (NamingException e) {
				e.printStackTrace();
			}

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
			try {
				if(pstmt != null)	pstmt.close();
				if(conn != null)	conn.close();
				if(rs != null)	rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return studys;

		}
	
//	참여가능한 승인된 스터디 카테고리 목록 메서드(도영)
	public static ArrayList<StudyDTO> getAllList(String category1){

		ArrayList<StudyDTO> studys = new ArrayList<StudyDTO>();

		try {
			sql = " SELECT * FROM study where category1=? AND apply='승인' AND recruitCnt != joinCnt ORDER BY sNo DESC ";

			try {
				conn = ConnectionPool.get();
			} catch (NamingException e) {
				e.printStackTrace();
			}

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, category1);

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
			try {
				if(pstmt != null)	pstmt.close();
				if(conn != null)	conn.close();
				if(rs != null)	rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return studys;

		}
	
//	승인된 스터디 카테고리2 목록 메서드(도영)
	public static ArrayList<StudyDTO> getAllCategoryList(String category2){

		ArrayList<StudyDTO> studys = new ArrayList<StudyDTO>();

		try {
			sql = " SELECT * FROM study where category2=? AND apply='승인' AND recruitCnt != joinCnt ORDER BY sNo DESC ";

			try {
				conn = ConnectionPool.get();
			} catch (NamingException e) {
				e.printStackTrace();
			}

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, category2);

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
			try {
				if(pstmt != null)	pstmt.close();
				if(conn != null)	conn.close();
				if(rs != null)	rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return studys;

		}

//	스터디 승인 메서드(도영)
	public static boolean apply(String sNo){

			sql = "UPDATE study SET apply='승인' "
					+ " WHERE sNo=? ";

			try {
			
				try {
					conn = ConnectionPool.get();
				} catch (NamingException e) {
					e.printStackTrace();
				}

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, sNo);

			int result = pstmt.executeUpdate();
			if (result == 1) {
				return true;
			}
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

		return false;
	}
	
//	스터디 거절 메서드(도영)
	public static boolean deny(String sNo){

			sql = "UPDATE study SET apply='거절' "
					+ " WHERE sNo=? ";

			try {
				
				try {
					conn = ConnectionPool.get();
				} catch (NamingException e) {
					e.printStackTrace();
				}

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, sNo);

			int result = pstmt.executeUpdate();
			if (result == 1) {
				return true;
			}
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

		return false;
	}
	
//	회원정보 가져오기 메서드(도영)
	public static StudyDTO getOneList(String sNo) {

		StudyDTO study = null;
		try {
			sql = "SELECT * from study where sNo=? ";

			try {
				conn = ConnectionPool.get();
			} catch (NamingException e) {
				e.printStackTrace();
			}

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, sNo);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				study = new StudyDTO(rs.getString(1),
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
						rs.getString(15));
			}

			return study;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return study;

	}
	
	
	//스터디목록(지원)
	public static List<StudyDTO> studyList(){
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
	public static StudyDTO studyView(String sNo) {
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

	//스터디생성(등록) 지원
	public static boolean studyCreate(String sTitle, String sWriter, String cNo, String category1,
			String category2,String address, String recruitCnt, String joinCnt, String expDate,
			String startDate, String sContent,String process){
		sql = "INSERT INTO study(stitle,swriter,cNo,category1,category2,address,recruitCnt,joinCnt,expDate,"
				+ "startDate,scontent,apply,process) VALUES(?,?,?,?,?,?,?,?,?,?,?,'신청중',?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sTitle);
			pstmt.setString(2, sWriter);
			pstmt.setString(3, cNo);
			pstmt.setString(4, category1);
			pstmt.setString(5, category2);
			pstmt.setString(6, address);
			pstmt.setString(7, recruitCnt);
			pstmt.setString(8, joinCnt);
			pstmt.setString(9, expDate);
			pstmt.setString(10, startDate);
			pstmt.setString(11, sContent);
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


	//스터디 수정 (지원)
	 public static boolean studyUpdate(String sTitle, String category1,
	            String category2,String address, String recruitCnt, String expDate,
	            String startDate, String sContent,String process,String sNo) {

	            sql = "UPDATE study SET sTitle=?,category1=?,category2=?,"
	                    + "address=?,recruitCnt=?,expDate=?,startDate=?,scontent=?,process=? where sNo = ?";
	            try {

	                pstmt = conn.prepareStatement(sql);
	                pstmt.setString(1, sTitle);
	                pstmt.setString(2, category1);
	                pstmt.setString(3, category2);
	                pstmt.setString(4, address);
	                pstmt.setString(5, recruitCnt);
	                pstmt.setString(6, expDate);
	                pstmt.setString(7, startDate);
	                pstmt.setString(8, sContent);
	                pstmt.setString(9, process);
	                pstmt.setString(10, sNo);
	             
	                if(pstmt.executeUpdate()==1) return true;

	            }catch (Exception e) {
	                e.printStackTrace();
	            }finally {
	                 if (pstmt != null) try { pstmt.close(); } catch(Exception e) {e.printStackTrace();}
	                 if (conn != null) try { conn.close(); } catch(Exception e) {e.printStackTrace();}
	            }

	            return false;
	        }

	// 스터디 삭제(지원)
	   public static boolean studyDelete(String sNo) {
           sql = "DELETE FROM study WHERE sNo = ?";
           try {
               pstmt = conn.prepareStatement(sql);
               pstmt.setString(1, sNo);
               if(pstmt.executeUpdate()==1) return true;

         } catch (Exception e) {
             e.printStackTrace();
         }finally {
              if (pstmt != null) try { pstmt.close(); } catch(Exception e) {e.printStackTrace();}
              if (conn != null) try { conn.close(); } catch(Exception e) {e.printStackTrace();}
         }
         return false;
     }
	
	// 스터디 탈퇴(소영)
	   public static boolean studyDelete(String userid, String sNo) {
           try {
        	   String sql = "DELETE FROM studyjoin WHERE userid = ? AND sNo = ? ";
        	   
       		try {
				conn = ConnectionPool.get();
			} catch (NamingException e) {
				e.printStackTrace();
			}

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, userid);
			pstmt.setString(2, sNo);

			int result = pstmt.executeUpdate();
			if (result == 1) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
           return false;
       }
	   
	   
	// 그룹장 스터디 모두 가져오기(혜원)
		public static String leaderGetList(String userid){
			sql = "select s.sNo, s.sTitle, s.category1, u.nickname, DATE_FORMAT(s.regDate, '%y-%m-%d') AS regDate from study s INNER JOIN user u on (s.sWriter = u.userid) where s.sNo in (select sj.sNo from studyJoin sj where sj.userid= ? and sj.approve = '그룹장')";
			JSONArray studyList = new JSONArray();
			
			try {
				try {
					conn = ConnectionPool.get();
				} catch (NamingException | SQLException e){
					e.printStackTrace();
				}
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userid);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					JSONObject obj = new JSONObject();
					obj.put("sNo", rs.getString(1));
					obj.put("sTitle", rs.getString(2));
					obj.put("category1", rs.getString(3));
					obj.put("nickname", rs.getString(4));
					obj.put("regDate", rs.getString(5));
				
					studyList.add(obj);
					
				}
				
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
	            if (rs != null) try { rs.close(); } catch (SQLException e) {e.printStackTrace();}
				if (pstmt != null) try { pstmt.close(); } catch(Exception e) {e.printStackTrace();}
	            if (conn != null) try { conn.close(); } catch(Exception e) {e.printStackTrace();}
			}
			return studyList.toJSONString();
		}

	   
	// 스터디 조회(소영)
		public static StudyDTO myView(String sNo) {
			StudyDTO study = null;
			try {
				String sql = "SELECT * FROM study WHERE sNo = ? ";

				try {
					conn = ConnectionPool.get();

					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, sNo);

					rs = pstmt.executeQuery();

					while (rs.next()) {
						study = new StudyDTO(rs.getString("sNo"),
								rs.getString("sTitle"), 
								rs.getString("sWriter"), 
								rs.getString("cNo"),
								rs.getString("category1"),
								rs.getString("category2"), 
								rs.getString("address"),
								rs.getString("recruitCnt"),
								rs.getString("joinCnt"), 
								rs.getString("regDate"),
								rs.getString("expDate"),
								rs.getString("startDate"), 
								rs.getString("sContent"),
								rs.getString("apply"),
								rs.getString("process"));
					}
						
						return study;

				} catch (NamingException | SQLException e) {
					e.printStackTrace();
				}
			} finally {
				try {
					if(pstmt != null)pstmt.close();
					if(conn != null)conn.close();
					if(rs != null)rs.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
			}
			return study;
		}

		// myStudy(소영)
		public static ArrayList<StudyDTO> myStudy(String userid) {

			ArrayList<StudyDTO> study = new ArrayList<StudyDTO>();
			
			try {
				String sql = "SELECT study.* FROM study WHERE sNo IN (SELECT sNo FROM studyjoin WHERE userid=?) ";
				try {
					conn = ConnectionPool.get();
				} catch (NamingException e) {
					e.printStackTrace();
				}
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userid);

				rs = pstmt.executeQuery();

				while(rs.next()) {
					study.add(new StudyDTO(rs.getString(1),
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

					return study;

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
			return study;
		}
}
