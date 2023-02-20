
<%@page import="jdbc.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String id = UserDAO.idFind(name, phone);
	
	if(id != null){	%>
	 회원님의 아이디는<span style="color:red"> <%= id %></span>입니다.
	<% 	}	else {%>
	이름과 전화번호가 일치하지 않습니다.
<% }
%>	


