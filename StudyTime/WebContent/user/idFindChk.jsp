<!-- ---------------------------------------------------------->
<!-- 최초작성자 : 권두현(secure3141@naver.com) -->
<!-- 최초작성일 : 2023/02/15 -->

<!-- 버전 기록 : ver1(시작 23/02/15) -->
<!-- ---------------------------------------------------------->
<%@page import="jdbc.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String id = UserDAO.idFind(name, phone);
	
	if(id != null){	%>
		회원님의 아이디는 <%= id %> 입니다.
<% 	}	else {%>
	이름과 핸드폰 번호가 일치하지 않습니다.
<% } %>

