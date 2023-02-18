<!-- 2023-02-17 김남훈 보드 업데이트 액션 -->


<%@page import="java.awt.print.Printable"%>
<%@page import="javax.security.auth.Subject"%>
<%@page import="jdbc.BoardDAO"%>
<%@page import="smtp.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8"); //한글 처리
	
	int bNo = 0;
	if(request.getParameter("bNo") != null){
	int bno = Integer.parseInt(request.getParameter("bNo"));
	if(BoardDAO.Boarddelete(bno) == 1){
		 response.sendRedirect("boardview.jsp");
	}
	}
%>