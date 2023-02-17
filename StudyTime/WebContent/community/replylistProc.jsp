<%@page import="jdbc.ReplyDAO"%>
<%@ page import="jdbc.NoticeDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	out.print(ReplyDAO.getList());
%>