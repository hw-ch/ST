<!-- 2023-02-18 작업자: 김남훈 
	작업 내용 : 게시글 삭제
	-->


<%@page import="jdbc.BoardDTO"%>
<%@page import="java.awt.print.Printable"%>
<%@page import="javax.security.auth.Subject"%>
<%@page import="jdbc.BoardDAO"%>
<%@page import="smtp.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8"); //한글 처리

	int bNo = Integer.parseInt(request.getParameter("bNo"));
	BoardDTO board = new BoardDAO().getboard(bNo);
	
	if(request.getParameter("bNo") != null && bNo == Integer.parseInt(board.getBNo())){
	BoardDAO.Replydelete(bNo);
	BoardDAO.Boarddelete(bNo);
	response.sendRedirect("boardList.jsp");
	}
%>