<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	int rno = Integer.parseInt(request.getParameter("rno"));
	out.print(rno);
	out.print(ReplyDAO.getList());
%>
