package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;


import javax.naming.NamingException;

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
	public static boolean apply(String tempTitle){

			sql = "UPDATE study SET apply='승인' "
					+ " WHERE sTitle=? ";

			try {
			
				try {
					conn = ConnectionPool.get();
				} catch (NamingException e) {
					e.printStackTrace();
				}

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, tempTitle);

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
	public static boolean deny(String tempTitle){

			sql = "UPDATE study SET apply='거절' "
					+ " WHERE sTitle=? ";

			try {
				
				try {
					conn = ConnectionPool.get();
				} catch (NamingException e) {
					e.printStackTrace();
				}

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, tempTitle);

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
	public static StudyDTO getOneList(String sTitle) {

		StudyDTO study = null;
		try {
			sql = "SELECT * from study where sTitle=? ";

			try {
				conn = ConnectionPool.get();
			} catch (NamingException e) {
				e.printStackTrace();
			}

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, sTitle);

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
	public static boolean studyCreate(String sTitle, String sWriter, int cNo, String category1,
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


	//스터디 수정 (지원)
	 public static boolean studyUpdate(String sTitle, String sWriter, int cNo, String category1,
	            String category2,String address, int recruitCnt, int joinCnt, String expDate,
	            String startDate, String scontent,String process,String sNo) {

	            sql = "UPDATE study A INNER JOIN category B ON A.cno = B.cno SET A.sTitle=?,A.sWriter=?,B.cNo=?,B.category1=?,B.category2=?,"
	                    + "A.address=?,A.recruitCnt=?,A.joinCnt=?,A.expDate=?,A.startDate=?,A.scontent=?,A.process=? where A.sNo = ?";
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
	                pstmt.setString(13, sNo);

	                if(pstmt.executeUpdate()==1) return true;

	            }catch (Exception e) {
	                e.printStackTrace();
	            }finally {
	                 if (pstmt != null) try { pstmt.close(); } catch(Exception e) {e.printStackTrace();}
	                 if (conn != null) try { conn.close(); } catch(Exception e) {e.printStackTrace();}
	            }

	            return false;
	        }

	// 스터디 삭제
	   public static boolean studyDelete(String sNo) {
           sql = "DELETE FROM study WHERE sNo = ?";
           try {
               pstmt = conn.prepareStatement(sql);
               pstmt.setString(1, sNo);
               if(pstmt.executeUpdate()==1) return true;;

           } catch (Exception e) {
               e.printStackTrace();
           }finally {
                if (pstmt != null) try { pstmt.close(); } catch(Exception e) {e.printStackTrace();}
                if (conn != null) try { conn.close(); } catch(Exception e) {e.printStackTrace();}
           }
           return false;
       }

}
