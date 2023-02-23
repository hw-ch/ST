<%--작업자: 김남훈 
	작업 내용 : 댓글 등록
	--%>
<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String sid = request.getParameter("sid");
			

	int bNo = Integer.parseInt(request.getParameter("bno"));
	String content = request.getParameter("content");
	UserDTO replyuser = new UserDAO().getOneList(sid);
	
	String nickname = replyuser.getNickName();
	
	if(content.equals("")){
		out.print(0);
	}else{
	out.print(ReplyDAO.Replyinsert(content, nickname, sid, bNo));
	ReplyDAO.replyCount(bNo);
	}
%>	

