<%@page import="jdbc.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");

	String id = UserDAO.idFind(name, phone);
%>
회원가입때 등록했던 아이디는 <%= id %> 입니다.
	