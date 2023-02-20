<!-- 2023-02-17 김남훈 보드 업데이트 jsp -->

<%@page import="javafx.scene.control.Alert"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>communityView</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<%@ include file="/includes/header.jsp" %>
<%
	// sid 확인
	sid = "abc";
	if(sid == null){
%>
<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">회원 전용 메뉴</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
				로그인을 한 회원만 사용가능한 메뉴입니다.<br>
				로그인 화면으로 이동합니다.
		      </div>
		      <div class="modal-footer">
		        <button onclick="location.href='login.jsp'" class="btn btn-secondary" data-bs-dismiss="modal">로그인 이동</button>
		      </div>
		    </div>
		  </div>
		</div>

		<script>
			$(function() {
				$("#exampleModal").modal("show");
			});
		</script>
<%
	}
	int bNo = 0;
	if(request.getParameter("bNo") != null){
		bNo = Integer.parseInt(request.getParameter("bNo"));
	}
	BoardDTO board = new BoardDAO().getboard(bNo);
%>
	<form action="updateAction.jsp">
	<INPUT TYPE="hidden" NAME="bNo" value=<%= bNo %>>
	<div class="communityView">	
		<section class="communityView_Postheader">
   		<div class="community_title" >  
   		<textarea name="subject"><%= board.getSubject() %></textarea>
   		</div>
   		<div class ="writer_wrap">
   		<div class="Writer"><%= board.getNickName() %></div>
   		</div>
   		<div class="DateAndViews">
   			<div class="Date"><%= board.getRegDate() %></div>
   			<div class="hits"><%= board.getHit() %></div>
   		</div>
   		<hr>
   		</section>
   		<div class=community_content_wrap>
   		<textarea class="community_content" name="content"><%= board.getContent() %></textarea>
   		</div>
   		<div class="community_delete"><button>수정</button></div>
	</div>
	</form>

<script>
	window.onload = function(){
 	}
</script>
</body>
</html>

