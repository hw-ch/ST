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
	
	ArrayList<UserDTO> users = UserDAO.getAllList();


for(UserDTO user : users) {
%>
 <tr><td onclick="location.href='/user/myInfo.jsp?userId=<%=user.getUserId()%>'" style="cursor : pointer;" class="h5 tempTitle1" id="<%=user.getUserId()%>"> <%=user.getNickName()%> </td>
<td onclick="location.href='/user/myInfo.jsp?userId=<%=user.getUserId()%>'" style="cursor : pointer;" class="h5"> <%=user.getName()%> </td>
<td onclick="location.href='/user/myInfo.jsp?userId=<%=user.getUserId()%>'" style="cursor : pointer;" class="h5"> <%=user.getGender()%> </td>
<td onclick="location.href='/user/myInfo.jsp?userId=<%=user.getUserId()%>'" style="cursor : pointer;" class="h5"> <%=user.getTs()%> </td>
<td class="h5"></td></tr>
<%
	}
%>


