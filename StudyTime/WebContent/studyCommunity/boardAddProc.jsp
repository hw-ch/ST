<%
/* --------------------------------------------------------
최초작성자 : 최혜원(wone8115@uos.ac.kr)
최초작성일 : 2023/02/23

버전 기록 : ver1(시작 23/02/23)
-------------------------------------------------------- */
%>

<%@ page import="jdbc.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String sNo = request.getParameter("sNo");
	String userid = request.getParameter("userid");
	
	out.print(StudyBoardDAO.boardinsert(title, content, sNo, userid));
%>