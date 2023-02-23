<!-- -------------------------------------------------------- -->
<!-- 최초작성자 : 김도영(difbfl4750@naver.com) -->
<!-- 최초작성일 : 2023/02/15 -->

<!-- 버전 기록 : ver1(시작 23/02/15) -->
<!-- -------------------------------------------------------- -->
<%@page import="java.util.*"%>
<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	String userId = request.getParameter("sid");

	ArrayList<StudyDTO> studys = StudyDAO.myStudy(userId);


for(StudyDTO study : studys) {
	String userid = study.getSWriter();
	UserDTO user = UserDAO.getOneList(userid);
%>
 <tr onclick="location.href='/studyCommunity/boardView.jsp?sNo=<%=study.getSNo()%>'" style="cursor : pointer;"><td class="h5"> <%=study.getSTitle()%> </td>
<td class="h5"> <%=study.getCategory1()%> </td>
<td class="h5"> <%=user.getNickName()%> </td>
<td class="h5"> <%=study.getRegDate()%> </td>
<td class="h5"></td></tr>
<%
	}
%>

