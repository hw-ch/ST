<%
/* --------------------------------------------------------
최초작성자 : 최혜원(wone8115@uos.ac.kr)
최초작성일 : 2023/02/22

버전 기록 : ver1(시작 23/02/22)
-------------------------------------------------------- */
%>

<%@ page import="jdbc.StudyDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sid = request.getParameter("sid");
	out.print(StudyDAO.leaderGetList(sid));
%>