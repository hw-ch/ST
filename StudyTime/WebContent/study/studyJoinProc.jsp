<!-- -------------------------------------------------------- -->
<!-- 최초작성자 : 박지원 -->
<!-- 최초작성일 : 2023/02/20 -->

<!-- 버전 기록 : ver1(시작 23/02/20) -->
<!-- -------------------------------------------------------- -->

<%@page import="java.util.*"%>
<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>    
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");
	
	String sid = (String)session.getAttribute("sid");
	String sNo = request.getParameter("sNo");
	
	if(new StudyJoinDAO().studyJoin(sid, sNo, "신청중")){
		%>
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
		<div class="modal-content">
		  <div class="modal-header">
		    <h1 class="modal-title fs-5" id="exampleModalLabel">스터디 참여</h1>
		    <button onclick = "location.href = '/main.jsp'" type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		  </div>
		  <div class="modal-body">
		    	참여신청이 완료되었습니다.
		  </div>
		  <div class="modal-footer">
		    <button onclick = "location.href = '/main.jsp'" type="button" class="btn btn-info" data-bs-dismiss="modal">확인
		    </button>
		  </div>
		</div>
		</div>
		</div>
		<script>
			$(function(){
				$("#exampleModal").modal("show");
			})
		</script>
<% 
	}
%>