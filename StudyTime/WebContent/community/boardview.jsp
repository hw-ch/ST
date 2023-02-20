<!--
--------------------------------------------------------
최초작성자 : 김남훈
최초작성일 : 2023/02/17

버전 기록 : ver1(시작 23/02/17)
--------------------------------------------------------
  -->

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
// 	sid = (String) session.getAttribute("sid");
	sid = "abc";
	UserDTO userid = new UserDAO().getOneList(sid);
	int bNo = 1;
	if(request.getParameter("bNo") != null){
		bNo = Integer.parseInt((String)request.getParameter("bNo"));	
	}
	BoardDTO board = new BoardDAO().getboard(bNo);
%>
	<form>
		<input type="hidden" id="sid" value="<%= userid.getUserId() %>">
	<div class="communityView">
		<section class="communityView_Postheader">
   		<div class="community_title"><%=board.getSubject() %></div>
   		<div class ="writer_wrap">
   		<div class="Writer"><%= board.getNickName() %></div>
   		<% if(sid != null && sid.equals(board.getUserId()))
   		{
		%>   
   		<div class="community_update"><button onclick="location.href='boardUpdate.jsp?bNo=<%= bNo %>'">수정</button></div>
   		<div class="community_delete"><button type="button" onclick="boradDelete()">삭제</button></div>
		<%
   		}
		%>
   		</div>
   		<div class="DateAndViews">
   			<div class="Date"><%=board.getRegDate() %></div>
   			<div class="hits"><%=board.getHit() %></div>
   		</div>
   		<hr>
   		<div class="content">
   		<p><%= board.getContent() %></p>
   		</div>
   		</section>
   		<hr>
   			<div class="community_comment">
   			<h1 class="comment_count">댓글 수 <%=board.getReplyNum() %> </h1>
  			<textarea class="community_content" id="replycontent"></textarea>
	  			<div class="replyinsert_wrap">
	  			<button type="button" id="insertBtn">댓글 등록</button>
	  			</div>
	  		</div>
  	 	<table class="table table-hover">
  			<tbody id="replylist">
 			 </tbody>
		</table>	
	</div>
	</form>
	
	<div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">수정</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	      <textarea></textarea>
	      </div>
	      <div class="modal-footer">
	        <button onclick="location.href='deleteAction.jsp?bNo=<%= bNo %>'" class="btn btn-secondary">수정</button>
  		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">삭제</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
			정말로 삭제하시겠습니까?
	      </div>
	      <div class="modal-footer">
	        <button onclick="location.href='deleteAction.jsp?bNo=<%= bNo %>'" class="btn btn-secondary">예</button>
  		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">아니요</button>
	      </div>
	    </div>
	  </div>
	</div>
		
	<div class="modal" tabindex="-1">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-body">
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-warning" onclick="location.href='/notice/noticeView.jsp'">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>

<script>
 	function searchFunction(){
 		$.ajax({
 			type:"POST",
 			url:"/community/replylistProc.jsp",
 			data: {
 			},
  			dataType:"text",

 			success:function(data){
 				var replies = JSON.parse(data.trim());
 				var str="";
 				for(var i=0; i < replies.length; i++){
 					str += "<form>"
 					str += "<input type='hidden' id='rno' value="+ replies[i].rNo + ">"
 					str += "<div class ='writer_wrap'>"
 					str += "<div class='Writer'>" +replies[i].nickname + "&nbsp&nbsp&nbsp&nbsp 작성 날짜 :" + replies[i].regDate +"</div>"
 					if($('#sid').val() != null && $('#sid').val() === replies[i].userid){
 	 					str += "<div class='community_update'><button type='button' id='replyUpdateBtn'>수정</button></div>"
 						str += "<div class='community_delete'><button onclick='replyDelete()'>삭제</button></div>"
 					}
 					str += "</div>"
 					str += "<div><p>" + replies[i].content + "</p></div><hr>"
 					str += "</form>"
 				}
 				$('#replylist').html(str);
 			}
 		});
 	}
	
 	function boradDelete(){
		$("#deleteModal").modal("show");
 	}
 	

 	$(document).on('click',"#replyUpdateBtn", function(){
 		
 		$.ajax({
 			type:"POST",
 			url:"/community/replyUpdateProc.jsp",
 			data:{ 
					
 			},	
  			dataType:"text",

  			success:function(data){
  				console.log(data);
 				var replies = JSON.parse(data.trim());
 				var str="";
 				for(var i=0; i < replies.length; i++){
 					str += "<form>"
 					str += "<input type='hidden' id='rno' value="+ replies[i].rNo + ">"
 					str += "<div class ='writer_wrap'>"
 					str += "<div class='Writer'>" +replies[i].nickname + "&nbsp&nbsp&nbsp&nbsp 작성 날짜 :" + replies[i].regDate +"</div>"
 					if($('#sid').val() != null && $('#sid').val() === replies[i].userid){
 	 					str += "<div class='community_update'><button type='button' id='replyUpdateBtn'>"+ replies[i].rNo + "</button></div>"
 						str += "<div class='community_delete'><button onclick='replyDelete()'>삭제</button></div>"
 					}
 					str += "</div>"
 					str += "<div><p>" + replies[i].content + "</p></div><hr>"
 					str += "</form>"
 				}
 				$('#replylist').html(str);
 			}
 		});
 		
 	});
 	

	 	
 	window.onload = function(){
 		searchFunction();
 	}
 	
 	 $('#insertBtn').on('click', function(){

    	 $.ajax({
  			type:"post",
  			url: "/community/replyInsert.jsp",
  			data : {
  					title:$('#replycontent').val(),
  					nickname:$('.Writer').val()
  				},
  			dataType:"text",

  			success:function(data) {
  				$('.modal-body').html('');
  				if(data==1){
  					$('.modal-body').html(data +"등록성공");
  				} else {
  					$('.modal-body').html(data + "등록실패");
  				}
  				$('.modal').show()
  			}
  		});
});
 	
 	 
 </script>
</body>
</html>