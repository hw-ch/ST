<%-- 2023-02-17 김남훈 보드 업데이트 액션 --%>
<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	String sid = request.getParameter("sid");
	int bNo = Integer.parseInt(request.getParameter("bno"));
	String content = request.getParameter("content");

	UserDTO user = new UserDAO().getOneList(sid);
	
	String nickname = user.getNickName();
	String userid = user.getUserId();
	out.print(ReplyDAO.Replyinsert(content, nickname, userid, bNo));
	ReplyDAO.replyCount(bNo);

%>	
