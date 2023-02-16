<%@page import="java.awt.print.Printable"%>
<%@page import="javax.security.auth.Subject"%>
<%@page import="jdbc.BoardDAO"%>
<%@page import="smtp.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8"); //한글 처리

	String subject = "테스트";
	String content = "테스트";
	int bno = 1;
	
	BoardDAO.Boardupdate(bno, subject, content);

	out.print("수정 성공");
		%>



