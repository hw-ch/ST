<!-- 스터디 탈퇴 Check -->
<!-- -------------------------------------------------------- -->
<!-- 최초작성자 : 정소영(jungsoyy@gmail.com) -->
<!-- 최초작성일 : 2023/02/15 -->

<!-- 버전 기록 : ver1(시작 23/02/15) -->
<!-- -------------------------------------------------------- -->
<%@page import="javax.websocket.SendResult"%>
<%@page import="jdbc.StudyDAO"%>
<%@page import="jdbc.StudyDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String sno = request.getParameter("sNo");
	String userid = (String) session.getAttribute("sid");
	boolean study = StudyDAO.studyDelete(userid, sno); 	 
/* 	System.out.println(sno);
	 System.out.println(userid);  */
 /* 	out.print(StudyDAO.studyDelete(sno)); */
 	response.sendRedirect("myStudy.jsp");
%>

