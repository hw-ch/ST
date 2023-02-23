<%@page import="org.apache.tomcat.jni.Stdlib"%>
<%
/* --------------------------------------------------------
최초작성자 : 최혜원(wone8115@uos.ac.kr)
최초작성일 : 2023/02/20

버전 기록 : ver1(시작 23/02/20)
-------------------------------------------------------- */
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.*"%>

<%
	request.setCharacterEncoding("utf-8");

	int bno = Integer.parseInt((String)request.getParameter("bno"));
	
	String modify = request.getParameter("modify");
	
	if(modify.equals("2")){
		out.print(StudyBoardDAO.getBoard(bno));
	}
	
	if(modify.equals("1")){
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		out.print(StudyBoardDAO.update(bno, title, content));
	}
	
%>