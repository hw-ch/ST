<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int bno = Integer.parseInt(request.getParameter("bno"));
	int pageSize = Integer.parseInt((String)request.getParameter("pageSize"));
	int pageNum = Integer.parseInt((String)request.getParameter("currentPage"));


	out.print(ReplyDAO.getListPage(pageNum, pageSize, bno));
	
%>