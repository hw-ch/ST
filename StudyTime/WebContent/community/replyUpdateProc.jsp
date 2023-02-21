<%@page import="javax.swing.text.AbstractDocument.Content"%>
<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	int rno = Integer.parseInt(request.getParameter("rno"));
	String content = request.getParameter("modifycontent");

	out.print(ReplyDAO.replyupdate(content, rno));
%>
	console.log(rno,content);