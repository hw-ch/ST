<!--
--------------------------------------------------------
최초작성자 : 김남훈
최초작성일 : 2023/02/18

버전 기록 :
--------------------------------------------------------
  -->

<%@page import="java.awt.print.Printable"%>
<%@page import="javax.security.auth.Subject"%>
<%@page import="jdbc.BoardDAO"%>
<%@page import="smtp.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8"); //한글 처리
	
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	int bno =  Integer.parseInt(request.getParameter("bNo"));
	
	out.print(bno);
%>	console.log(bno);
