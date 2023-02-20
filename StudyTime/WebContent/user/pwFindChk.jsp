<%@page import="smtp.PasswordMail"%>
<%@page import="jdbc.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String userId = request.getParameter("userId");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String password = UserDAO.pwFind(userId, name, phone);
	
	if(password != null){	
		PasswordMail.sending(userId, name, phone); 
		out.print("이메일을 확인해주세요.");
 	}	else {
	out.print("회원 정보가 일치하지 않습니다. 다시 확인해주세요.");
 }
%>