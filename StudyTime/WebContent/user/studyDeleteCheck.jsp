<!-- 스터디 탈퇴 Check -->
<!-- -------------------------------------------------------- -->
<!-- 최초작성자 : 정소영(jungsoyy@gmail.com) -->
<!-- 최초작성일 : 2023/02/15 -->

<!-- 버전 기록 : ver1(시작 23/02/15) -->
<!-- -------------------------------------------------------- -->
<%@page import="javax.websocket.SendResult"%>
<%@page import="jdbc.StudyDAO"%>
<%@page import="jdbc.StudyDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/includes/header.jsp" %>
<%
	request.setCharacterEncoding("utf-8");

	String sno = request.getParameter("sNo");
	String userid = (String) session.getAttribute("sid");
	boolean study = StudyDAO.studyDelete(userid, sno); 	 
/* 	System.out.println(sno);
	 System.out.println(userid);  */
 /* 	out.print(StudyDAO.studyDelete(sno)); */
 
 if(study == true){
	 StudyDAO.studyDelete(userid, sno); 	 
 	/* response.sendRedirect("myStudy.jsp"); */
%>

<!-- Modal -->
		<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">스터디 탈퇴</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        	스터디 탈퇴가 완료되었습니다.
		      </div>
		      <div class="modal-footer">
		        <button onclick="location.href='/user/myStudy.jsp'" class="btn btn-info">My Study</button>
		        <button onclick="location.href='/main.jsp'" class="btn btn-info">메인 페이지</button>
		      </div>
		    </div>
		  </div>
		</div>

		<script>
			$(function() {
				$("#exampleModal1").modal("show");
			});
		</script>		
		
<%
	}
%>		
