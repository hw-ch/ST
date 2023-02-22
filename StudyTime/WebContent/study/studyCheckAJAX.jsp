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
	ArrayList<StudyDTO> studys = StudyDAO.getAllList2();
ArrayList<StudyDTO> temps = StudyDAO.gettempList2();


for(StudyDTO study : studys) {
	String userid = study.getSWriter();
	UserDTO user = UserDAO.getOneList(userid);
%>
 <tr onclick="location.href='/study/studyView.jsp?sNo=<%=study.getSNo()%>'" style="cursor : pointer;"><td class="h5"> <%=study.getSTitle()%> </td>
<td class="h5"> <%=study.getCategory1()%> </td>
<td class="h5"> <%=user.getNickName()%> </td>
<td class="h5"> <%=study.getRegDate()%> </td>
<td class="h5"></td></tr>
<%
	}
%>

__TEMP__

<%
	for(StudyDTO temp : temps) {
	String userid = temp.getSWriter();
	UserDTO user = UserDAO.getOneList(userid);
%>
 <tr><td onclick="location.href='/study/studyView.jsp?sNo=<%=temp.getSNo()%>'" style="cursor : pointer;" class="h5"> <%=temp.getSTitle() %> </td>
<td onclick="location.href='/study/studyView.jsp?sNo=<%=temp.getSNo()%>'" style="cursor : pointer;" class="h5"> <%=temp.getCategory1() %> </td>
<td onclick="location.href='/study/studyView.jsp?sNo=<%=temp.getSNo()%>'" style="cursor : pointer;" class="h5"> <%=user.getNickName()%> </td>
<td class="h5"> <h5 class="badge bg-primary regBtn" style="cursor : pointer;"><b>승인</b></h5> <h5 class="badge bg-danger delBtn" style="cursor : pointer;"><b>거절</b></h5></td>
<td class="h5"></td></tr>
<input type="hidden" value="<%=temp.getSNo()%>"  id="tempSNo"/>
<%} %>


