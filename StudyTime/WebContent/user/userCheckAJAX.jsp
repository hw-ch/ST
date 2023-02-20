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
String sNo = request.getParameter("sNo");
	
	ArrayList<StudyJoinDTO> studyJoins = StudyJoinDAO.getAllList(sNo);

for(StudyJoinDTO studyJoin : studyJoins) {
	String userid = studyJoin.getUserId();
	UserDTO user = UserDAO.getOneList(userid);
%>
 <tr><td onclick="location.href='/user/myInfo.jsp?userId=<%=user.getUserId()%>'" style="cursor : pointer;" class="h5 tempTitle1" id="<%=user.getUserId()%>"> <%=user.getNickName()%> </td>
<td onclick="location.href='/user/myInfo.jsp?userId=<%=user.getUserId()%>'" style="cursor : pointer;" class="h5"> <%=user.getName()%> </td>
<td onclick="location.href='/user/myInfo.jsp?userId=<%=user.getUserId()%>'" style="cursor : pointer;" class="h5"> <%=user.getGender()%> </td>
<td onclick="location.href='/user/myInfo.jsp?userId=<%=user.getUserId()%>'" style="cursor : pointer;" class="h5"> <%=studyJoin.getRegDate()%> </td>
<td class="h5"> <h5 class="badge bg-danger delBtn" style="cursor : pointer;"><b>추방</b></h5> </td></tr>
<%
	}
%>

__TEMP__

<%
ArrayList<StudyJoinDTO> delStudyJoins = StudyJoinDAO.getAllList2(sNo);

	for(StudyJoinDTO delStudyJoin : delStudyJoins) {
	String userid = delStudyJoin.getUserId();
	UserDTO user = UserDAO.getOneList(userid);
%>
 <tr><td onclick="location.href='/user/myInfo.jsp?userId=<%=user.getUserId()%>'" style="cursor : pointer;" class="h5 tempTitle2" id="<%=user.getUserId()%>"> <%=user.getNickName()%> </td>
<td onclick="location.href='/user/myInfo.jsp?userId=<%=user.getUserId()%>'" style="cursor : pointer;" class="h5"> <%=user.getName()%> </td>
<td onclick="location.href='/user/myInfo.jsp?userId=<%=user.getUserId()%>'" style="cursor : pointer;" class="h5"> <%=user.getGender()%> </td>
<td onclick="location.href='/user/myInfo.jsp?userId=<%=user.getUserId()%>'" style="cursor : pointer;" class="h5"> <%=delStudyJoin.getRegDate()%> </td>
<td class="h5"> <h5 class="badge bg-primary regBtn" style="cursor : pointer;"><b>재가입</b></h5> </td></tr>

<%} %>


