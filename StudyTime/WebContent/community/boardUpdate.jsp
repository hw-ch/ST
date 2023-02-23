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
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<%	
// 	sid = "difbfl4750@naver.com";
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
		<input name="bno" type="hidden" value=<%=bNo %>>
		<input name="modify" type="hidden" value=1>
		<div><button type="button" class="btn btn-secondary btn-lg" onclick="history.back()">&laquo; 수정취소</button></div>
		<section class="communityView_Postheader">
   		<div class="community_title" >
   		<div class="boardtitle">글 제목</div>
			<input type="text" class="form-control" id="title" name="title" value=<%=board.getSubject() %>>
   		</div>
   		<hr>
   		<div class=content>
   		<div class="boardtitle">글 내용</div>
<%--    		<textarea id ="ModifyContent" class="form-control col-sm-5" rows="5" name="content"><%= board.getContent() %></textarea> --%>
		<div class="col p-2">
			<textarea name ="summernote" id="summernote"></textarea>
		</div>
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
		ModifySubject = $("#title").val();
		ModifyContent =$("#summernote").val();
		if(ModifySubject.length <1){
			$('.modal-body').html("제목을 입력해주세요");
			$('#ModifyModal').modal("show");
			return false;

		} else if(ModifyContent.length < 1){
			$('.modal-body').html("내용을 수정해주세요");
			$('#ModifyModal').modal("show");
			return false;
		}else{
			return true;	
		}
	}
	
    $('#summernote').summernote({
        tabsize: 5,
        height: 180,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture', 'video']],
          ['view', ['fullscreen', 'codeview', 'help']]
        ]
      });
	
    
    $(document).ready(function(){
  	  $.ajax({
   			type:"POST",
   			url:"/community/boardModifyProc.jsp",
   			data : {bno : <%=request.getParameter("bNo")%>,
					modify : 2
				},
				
			dataType:"text",
   			success:function(data){
   				var board = data;
   				$('.note-editable').html(board);
   			}
   			
   		});  
    })
    
	$("#home").hide();

</script>
</body>
</html>

