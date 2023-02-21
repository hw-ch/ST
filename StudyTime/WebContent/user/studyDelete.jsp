<!-- 스터디 탈퇴하기 -->
<!-- -------------------------------------------------------- -->
<!-- 최초작성자 : 정소영(jungsoyy@gmail.com) -->
<!-- 최초작성일 : 2023/02/15 -->

<!-- 버전 기록 : ver1(시작 23/02/15) -->
<!-- -------------------------------------------------------- -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="jdbc.StudyDAO"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>STUDY TIME</title>
</head>
<body>
<%@ include file="/includes/header.jsp" %>

<% 
/* sid = (String) session.getAttribute("sid"); */
/* 		session.setAttribute("userid", sid); */
		
		
	
%>	

<main>
<hr class="featurette-divider">
<%
ArrayList<StudyDTO> study = StudyDAO.myStudy(sid);
for(StudyDTO studyinfo : study){

%>	
<form action="studyDeleteCheck.jsp" method="post">
<div class="container">
<ul class="list-unstyled">
<li><div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
<div class="card border-dark mb-3" style="max-width: 18rem;">
  <h5 class="card-header"><%=studyinfo.getSTitle() %> </h5>
  <div class="card-body">
    <p class="card-text">스터디 장 : <%=studyinfo.getSWriter() %></p>
    <p class="card-text">회원수 : <%=studyinfo.getCNo() %></p>
    <p class="card-text">시작일시 : <%=studyinfo.getStartDate() %></p>
    <input type="hidden" name="sno" value="<%=studyinfo.getSNo() %>">
    
    
    <input type="submit" class="btn btn-secondary" value="스터디 탈퇴">
   	<a href="myStudy.jsp" class="btn btn-secondary">My Study</a>
    
    
  </div>
</div>
</div></li>
</ul>
</div> 
</form>
<%
	}
%>
</main>
</body>
</html>