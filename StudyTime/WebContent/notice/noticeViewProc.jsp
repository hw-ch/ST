<%
/* --------------------------------------------------------
최초작성자 : 최혜원(wone8115@uos.ac.kr)
최초작성일 : 2023/02/16

버전 기록 : ver1(시작 23/02/16)
-------------------------------------------------------- */
%>

<%@ page import="jdbc.NoticeDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int pageSize = Integer.parseInt((String)request.getParameter("pageSize"));
	int pageNum = Integer.parseInt((String)request.getParameter("currentPage"));
	out.print(NoticeDAO.getListPage(pageNum, pageSize));
	/* out.print(NoticeDAO.getList()); */
%>