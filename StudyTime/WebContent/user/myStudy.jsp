<!-- My Study -->
<!-- -------------------------------------------------------- -->
<!-- 최초작성자 : 정소영(jungsoyy@gmail.com) -->
<!-- 최초작성일 : 2023/02/15 -->

<!-- 버전 기록 : ver1(시작 23/02/15) -->
<!-- -------------------------------------------------------- -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
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
<style>
</style>
<body>
<%@ include file="/includes/header.jsp" %>
<script>$('#pageTitle').text("My Study")</script>

 <% 
		sid = (String) session.getAttribute("sid");
/* 		session.setAttribute("userid", sid); */
		String sNo = request.getParameter("sNo");
		
%>		
  
<main>
      <div class="row" data-masonry='{"percentPosition": true }' style="padding-top: 200px;">
      <hr class="featurette-divider">

    <div class="col mb-4" style="height: 500px;">
       <div id="study" class="row row-cols-1 row-cols-md-3 mb-3 text-center"  style="height: 500px;">
<%
	ArrayList<StudyDTO> study = StudyDAO.myStudy(sid);
	for(StudyDTO studyinfo : study){
	
%>	



 <div class="col" style="font-family: 'PyeongChangPeace-Bold';">

        <div class="card mb-4 rounded-3 shadow-sm">
                                     <div class="card-header py-3 bg-warning">
            <div class="card-title pricing-card-title display-5"><%=studyinfo.getSTitle() %></div>
          </div>
          <div class="card-body" style="height: 350px;">
          	<div style="padding-right: 200px; padding-top: 10px;">
          	<a class="btn btn-lg btn-light border-dark rounded-5"><%=studyinfo.getCategory1() %></a> 
          	<a class="btn btn-lg btn-light border-dark rounded-5"><%=studyinfo.getCategory2() %></a>
          	</div>
   
          					<input type="hidden" name="sNo" value="<%=studyinfo.getSNo() %>">

 			<div style="padding-top: 30px;" class="card-title pricing-card-title h3">
				<p class="card-text h3">스터디 장 : <%  
				UserDTO user1 = UserDAO.getOneList(studyinfo.getSWriter());
				%>
				<%=user1.getNickName()%></p>
			    <p class="card-text">회원수 : <%=studyinfo.getJoinCnt() %>명</p>
			    <p class="card-text">시작일시 : <%=studyinfo.getStartDate() %></p>
				
			</div>
			
              <hr class="featurette-divider">
         		                
         <div style="padding-right: 20px; padding-top: 30px;" class="card-title pricing-card-title h5">
			  <a href="/user/studyView.jsp?sNo=<%=studyinfo.getSNo() %>" class="btn btn-secondary">스터디 상세보기</a>
			  <a href="/user/studyDeleteCheck.jsp?sNo=<%=studyinfo.getSNo() %>"  class="btn btn-danger">스터디 탈퇴하기</a>
         </div>
                </div>
        </div>
      </div>
	<%} %>
	</div>
	</div>
	</div>
</main>

</body>
</html>