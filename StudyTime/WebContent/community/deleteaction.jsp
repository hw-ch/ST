<!-- 2023-02-17 김남훈 보드 업데이트 액션 -->


<%@page import="java.awt.print.Printable"%>
<%@page import="javax.security.auth.Subject"%>
<%@page import="jdbc.BoardDAO"%>
<%@page import="smtp.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8"); //한글 처리

	int bno = 1;
	
	BoardDAO.Boarddelete(bno);

	out.print("삭제 성공");
		%>



