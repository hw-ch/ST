<!-- 2023-02-17 김남훈 보드 업데이트 액션 -->
<%@page import="jdbc.*"%>
<%@page import="java.awt.print.Printable"%>
<%@page import="javax.security.auth.Subject"%>
<%@page import="jdbc.BoardDAO"%>
<%@page import="smtp.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8"); //한글 처리

	String content = request.getParameter("content");
	String nickname = "테스트";
	String userid = "테스트";
	int bno = 1;

	ReplyDTO reply = new ReplyDTO();
	
	ReplyDAO.Replyinsert(content, nickname, userid, bno);
	
	out.print("등록 성공");
		%>



