<%@page import="javax.swing.text.AbstractDocument.Content"%>
<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	int rno = Integer.parseInt(request.getParameter("rno"));
	String content = request.getParameter("content");
	String referer = request.getHeader("referer");
	
	ReplyDTO reply = new ReplyDAO().getreply(rno);
	if(sid != null && sid.equals(reply.getUserid())){
	ReplyDAO.replyupdate(content, rno);
		 response.sendRedirect(referer);
	} else{
		 response.sendRedirect(referer);
	}
%>