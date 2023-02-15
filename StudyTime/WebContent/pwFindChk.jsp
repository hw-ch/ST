<%@page import="jdbc.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userId = request.getParameter("userId");
	String name = request.getParameter("name");

	String password = UserDAO.pwFind(userId, name);
%>
<%= password %>