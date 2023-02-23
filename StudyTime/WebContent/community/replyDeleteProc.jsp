<%--작업자: 김남훈 
	작업 내용 : 댓글 삭제
	--%>


<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/includes/header.jsp" %>    
<%	
	int bNo = Integer.parseInt(request.getParameter("bno"));
	int rno = Integer.parseInt(request.getParameter("rno"));
	out.print(ReplyDAO.Replydelete(rno));
	ReplyDAO.replyCount(bNo);
	
%>
