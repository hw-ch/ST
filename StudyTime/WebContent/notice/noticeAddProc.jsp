<%
/* --------------------------------------------------------
최초작성자 : 최혜원(wone8115@uos.ac.kr)
최초작성일 : 2023/02/17

버전 기록 : ver1(시작 23/02/17)
-------------------------------------------------------- */
%>

<%@ page import="jdbc.NoticeDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	out.print(NoticeDAO.Noticeinsert(title, content));
%>