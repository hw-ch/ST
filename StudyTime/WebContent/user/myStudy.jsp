<!-- My Study -->
<!-- -------------------------------------------------------- -->
<!-- 최초작성자 : 정소영(jungsoyy@gmail.com) -->
<!-- 최초작성일 : 2023/02/15 -->

<!-- 버전 기록 : ver1(시작 23/02/15) -->
<!-- -------------------------------------------------------- -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="jdbc.StudyDTO.*"%>
<%@page import="jdbc.StudyDAO.*"%>
<%@page import="jdbc.StudyJoinDTO.*"%>
<%@page import="jdbc.StudyJoinDAO.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>STUDY TIME</title>
<link href="carousel.css" rel="stylesheet">
</head>
<body>
<%@ include file="/includes/header.jsp" %>


 <% 
		sid = (String) session.getAttribute("sid");
/* 		session.setAttribute("userid", sid); */
		String sNo = request.getParameter("sNo");
		
%>		
  
<main>
<hr class="featurette-divider">
<%
	ArrayList<StudyDTO> study = StudyDAO.myStudy(sid);
	for(StudyDTO studyinfo : study){
	
%>	
	<div class="container"> 
	<div class="row row-cols-1 row-cols-sm-3 row-cols-md-2 g-1">
	<div class="card border-dark mb-3" style="max-width: 18rem;">

	  <h5 class="card-header"><%=studyinfo.getSTitle() %></h5>
	  <div class="card-body">
	    <p class="card-text">스터디 장 : <%=studyinfo.getSWriter()%></p>
	    <p class="card-text">회원수 : <%=studyinfo.getCNo() %>명</p>
	    <p class="card-text">시작일시 : <%=studyinfo.getStartDate() %></p>
	     <hr class="my-4">
	     <div class="d-grid gap-2 col-6 mx-auto">
			  <a href="studyView.jsp?sNo=<%=studyinfo.getSNo() %>" class="btn btn-secondary">스터디 상세보기</a>
			  <button class="btn btn-secondary" onclick="location.href='/user/studyDeleteCheck.jsp?sNo=<%=studyinfo.getSNo() %>' " type="submit">스터디 탈퇴하기</button>
			</div>
			
	  </div>
	</div>
<%
}
%>


</div>

</div>
</main>


</body>
</html>