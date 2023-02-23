<!--
--------------------------------------------------------
최초작성자 : 김남훈
최초작성일 : 2023/02/18

버전 기록 :
--------------------------------------------------------
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
	
	int bno =  Integer.parseInt(request.getParameter("bno"));
	String modify = request.getParameter("modify");
	BoardDTO content = new BoardDAO().getboard(bno); 
	if(modify.equals("2")){
		out.print(content.getContent());
	}
	if(modify.equals("1")){
	String title = request.getParameter("title");
	String summernote = request.getParameter("summernote");
	BoardDAO.Boardupdate(bno, title, summernote);
	response.sendRedirect("boardview.jsp?bno="+bno);
	}

%>