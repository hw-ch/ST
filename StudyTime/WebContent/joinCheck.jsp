<%@page import="smtp.SendMail"%>
<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("password");
	String name = request.getParameter("name");
	String nickname = request.getParameter("nickname");
	String gender = request.getParameter("gender");
	String phone = request.getParameter("phone");
	String image = "";
	
	boolean result = userDAO.join(id, pw, name, nickname, gender, phone, image);
	
	if(result == true){
		SendMail.sending(id, name);	//메일 보내기
		out.print("회원가입 성공");
	}	else{
		out.print("회원가입 실패");
	}
%>	