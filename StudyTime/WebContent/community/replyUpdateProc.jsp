<%@page import="javax.swing.text.AbstractDocument.Content"%>
<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/includes/header.jsp" %>
    
<%	
	int rno = Integer.parseInt(request.getParameter("rno"));
	String content = request.getParameter("content");
	String referer = request.getHeader("referer");
	
	ReplyDTO reply = new ReplyDAO().getreply(rno);
	ReplyDAO.replyupdate(content, rno);
	response.sendRedirect(referer);
	
%>