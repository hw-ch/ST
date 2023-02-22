<%
/* --------------------------------------------------------
최초작성자 : 최혜원(wone8115@uos.ac.kr)
최초작성일 : 2023/02/21

버전 기록 : ver1(시작 23/02/21)
-------------------------------------------------------- */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.*" %>
<%
	String sNo = request.getParameter("sNo");
	String state = request.getParameter("state");
	if(state.equals("list")){
		out.print(StudyJoinDAO.getList(sNo));
		return;
	}
	
	if(state.equals("approve")){
		String sjNo = request.getParameter("sjNo");
		out.print(StudyJoinDAO.approve(sjNo));
		StudyJoinDAO.cntUpdate(sNo);
		return;
	}
	
	if(state.equals("reject")){
		String sjNo = request.getParameter("sjNo");
		out.print(StudyJoinDAO.reject(sjNo));
		StudyJoinDAO.cntUpdate(sNo);
		return;
	}

%>