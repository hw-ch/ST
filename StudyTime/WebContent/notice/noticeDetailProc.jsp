<%@ page import="jdbc.NoticeDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int bNo = Integer.parseInt((String)request.getParameter("bNo"));
	out.print(NoticeDAO.getNotice(bNo));
%>