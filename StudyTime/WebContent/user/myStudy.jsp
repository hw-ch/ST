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

<div class="row" data-masonry='{"percentPosition": true }' style="padding-top: 200px;">
      <hr class="featurette-divider">
    <div class="col mb-4" style="height: 500px;">
       <div id="study" class="row row-cols-1 row-cols-md-3 mb-3 text-center"  style="height: 500px;">
<div onclick="location.href = '/study/studyView.jsp?sNo=<%=studyinfo.getSNo() %>'" style="cursor: pointer;">
 <div class="col" style="font-family: 'PyeongChangPeace-Bold';">

        <div class="card mb-4 rounded-3 shadow-sm">
                                     <div class="card-header py-3 bg-warning">
            <div class="card-title pricing-card-title display-5"><%=studyinfo.getSTitle() %></div>
          </div>
          <div class="card-body" style="height: 350px;">
          	<div style="padding-right: 350px; padding-top: 10px;">
          	<a class="btn btn-lg btn-light border-dark rounded-5"><%=studyinfo.getCategory1() %></a> 
          	 <a class="btn btn-lg btn-light border-dark rounded-5"><%=studyinfo.getCategory2() %></a>
          	</div>
              <div style="padding-top: 50px;" class="card-title pricing-card-title h3">
				<p class="card-text">스터디 장 : <%=studyinfo.getSWriter()%></p>
			    <p class="card-text">회원수 : <%=studyinfo.getCNo() %>명</p>
			    <p class="card-text">시작일시 : <%=studyinfo.getStartDate() %></p>
				
			</div>
			
              <div style="padding-top: 50px; padding-right: 450px;" class="card-title pricing-card-title h5"> 
              <div class="d-grid gap-2 col-6 mx-auto">
			  <a href="studyView.jsp?sNo=<%=studyinfo.getSNo() %>" class="btn btn-secondary">스터디 상세보기</a>
			  <button class="btn btn-danger" onclick="location.href='/user/studyDeleteCheck.jsp?sNo=<%=studyinfo.getSNo() %>' " type="submit">스터디 탈퇴하기</button>
			</div>
			</div>
              <hr class="featurette-divider">
         		                
         <div style="padding-right: 400px;" class="card-title pricing-card-title h5"><img class="box" style="width: 40px; height: 40px;" src="/images/study3.png"> <%=user.getNickName() %></div>
         
         </div>
        </div>
      </div>
     </div>
         </div>
    </div>
  </div>
	<%} %>
	


</main>


</body>
</html>