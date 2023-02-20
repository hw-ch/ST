<%-- 2023-02-17 김남훈 보드 업데이트 액션 --%>
<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	String userId= "abc";
	
	UserDTO user = new UserDAO().getOneList(userId);
	
	String content = request.getParameter("content");
	String nickname = request.getParameter("nickname");
	String userid = request.getParameter("userid");
	int bNo = 1;
	
	out.print(ReplyDAO.Replyinsert(content, nickname, userid, bNo));

%>	
