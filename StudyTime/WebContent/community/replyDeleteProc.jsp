<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/includes/header.jsp" %>    
<%	
	int bNo = Integer.parseInt(request.getParameter("bno"));
	int rno = Integer.parseInt(request.getParameter("rno"));
	ReplyDTO reply = new ReplyDAO().getreply(rno);
	if(sid != null && sid.equals(reply.getUserid())){
	out.print(ReplyDAO.Replydelete(rno));
	ReplyDAO.replyCount(bNo);
	}else{
		out.print(0);
	}
%>
