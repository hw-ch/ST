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
// 	sid = "aaa@naver.com";
	int bNo = Integer.parseInt(request.getParameter("bNo"));
	BoardDTO board = new BoardDAO().getboard(bNo);
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
				게시글 수정 권한이 없습니다.
		      </div>
		      <div class="modal-footer">
		        <button onclick="history.back()" class="btn btn-secondary" data-bs-dismiss="modal">이전으로</button>
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
	if( sid != null && sid.equals(board.getUserId()))
	{
%>
<nav class="boardnav"></nav>
	<div class="communityView">	
		<form onsubmit="return ModifyCheck();" action="boardModifyProc.jsp">
		<input name="bNo" type="hidden" value=<%=bNo %>>
		<div><button type="button" class="btn btn-secondary btn-lg" onclick="history.back()">&laquo; 수정취소</button></div>
		<section class="communityView_Postheader">
   		<div class="community_title" >
   		<div class="boardtitle">글 제목</div>
   		<textarea id ="ModifySubject" class="form-control col-sm-5" name="subject"><%= board.getSubject() %></textarea>
   		</div>
   		<hr>
   		<div class=content>
   		<div class="boardtitle">글 내용</div>
   		<textarea id ="ModifyContent" class="form-control col-sm-5" rows="5" name="content"><%= board.getContent() %></textarea>
   		</div>
   		</section>
   		<div class="community_Modify"><button class="btn btn-warning btn-lg">수정</button></div>
   			</form>
	</div>
	
	<div class="modal fade" id="ModifyModal" tabindex="-1"  aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-body">
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-info" data-bs-dismiss="modal">확인</button>
	      </div>
	    </div>
	  </div>
	</div>
<%
	}
%>
<script>
	
	function ModifyCheck(){
		ModifySubject = $("#ModifySubject").val();
		ModifyContent =$("#ModifyContent").val();
		if(ModifySubject.length <1){
			$('.modal-body').html("제목을 입력해주세요");
			$('#ModifyModal').modal("show");
			return false;

		} else if(ModifyContent.length < 1){
			$('.modal-body').html("내용을 입력해주세요");
			$('#ModifyModal').modal("show");
			return false;
		}else{ 
			return true;	
		}
	}
	
	$("#home").hide();

</script>
</body>
</html>

