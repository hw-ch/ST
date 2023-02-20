<!-- -------------------------------------------------------- -->
<!-- 최초작성자 : 김도영(difbfl4750@naver.com) -->
<!-- 최초작성일 : 2023/02/15 -->

<!-- 버전 기록 : ver1(시작 23/02/15) -->
<!-- -------------------------------------------------------- -->
<%@page import="java.util.*"%>
<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

request.setCharacterEncoding("UTF-8");
String subject = request.getParameter("subject");
String content = request.getParameter("content");
String nickName = request.getParameter("nickName");
String userId = request.getParameter("userId");




if(BoardDAO.insert(subject, content, nickName, userId)){
	response.sendRedirect("/community/boardList.jsp");
}else{%>
	<script type="text/javascript">
	alert("입력 오류");
</script>
<%
}
%>