<%-- 2023-02-17 김남훈 보드 업데이트 액션 --%>
<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/includes/header.jsp" %>    
<%
	request.setCharacterEncoding("utf-8");

	int bNo = Integer.parseInt(request.getParameter("bno"));
	String content = request.getParameter("content");

	UserDTO replyuser = new UserDAO().getOneList(sid);
	
	String nickname = replyuser.getNickName();
	String userid = replyuser.getUserId();
	
	if( sid == null & sid.equals(userid)){
	out.print(ReplyDAO.Replyinsert(content, nickname, userid, bNo));
	ReplyDAO.replyCount(bNo);
	} else {
		out.print(0);
	}
%>	
