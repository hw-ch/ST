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
	UserDTO userid = new UserDAO().getOneList(sid);
	sid = "aaa";
	int bno = Integer.parseInt(request.getParameter("bno"));
	BoardDTO board = new BoardDAO().getboard(bno);
%>

	<form>
<%-- 		<input type="hidden" id="sid" value="<%= userid.getUserId() %>"> --%>
	<div class="communityView">
		<section class="communityView_Postheader">
   		<div class="community_title"><%=board.getSubject() %></div>
   		<div class ="writer_wrap">
   		<div class="Writer"><%= board.getNickName() %></div>
   		<% if(sid != null && sid.equals(board.getUserId()))
   		{
		%>   
   		<div class="community_update"><button onclick="location.href='boardUpdate.jsp?bNo=<%= bno %>'">수정</button></div>
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
	        <button onclick="location.href='deleteAction.jsp?bNo=<%= bno %>'" class="btn btn-secondary">수정</button>
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
	        <button onclick="location.href='deleteAction.jsp?bNo=<%= bno %>'" class="btn btn-secondary">예</button>
  		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">아니요</button>
	      </div>
	    </div>
	  </div>
	</div>
		
	<div class="modal fade" id="replyModal" tabindex="-1"  aria-labelledby="exampleModalLabel" aria-hidden="true">
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



<script>
 	function searchFunction(){
 		$.ajax({
 			type:"POST",
 			url:"/community/replylistProc.jsp?bno=<%=bno%>",
 			data: { 
 			},
  			dataType:"text",

 			success:function(data){
 				var replies = JSON.parse(data.trim());
 				var str="";
 				for(var i=0; i < replies.length; i++){
 					str += "<form id='update'>"
//  					str +="<input type='hidden' id='"+ replies[i].rNo "'+ value='"+ replies[i].rNo +"'>"
 					str += "<div class ='writer_wrap'>"
 					str += "<div class='Writer'>" +replies[i].nickname + "&nbsp&nbsp&nbsp&nbsp 작성 날짜 :" + replies[i].regDate +"</div>"
 					if("<%= sid %>" != null && "<%= sid %>"  == replies[i].userid){
 	 					str += "<div class='community_update'><button id='replyModifyBtn' type='button' onclick='replyModify("+ replies[i].rNo +")'>수정</button></div>"
 						str += "<div class='community_delete'><button id='replydelteBtn' type='button' onclick='replyDel()'>삭제</button></div>"
 					}
 					str += "</div>"
 					str += "<div><p id='replycontent="+ replies[i].rNo +"'>" + replies[i].content + "</p></div><hr>"
 					str += "</form>"
 				}
 				$('#replylist').html(str);
 			}
 		});
 	}
	
 	function boradDelete(){
		$("#deleteModal").modal("show");
 	}
 	
 	function replyModify(rno){
 		var element = document.getElementById("replycontent=" +rno);
 		$( element ).contents().unwrap().wrap( '<textarea>' );
 		$("#replydelteBtn").remove();
 		$("#replyModifyBtn").attr("id","replyUpdateBtn");
		
 	}
 	
 	function replyDel(){
		$("#deleteModal").modal("show");
 	}

	 	
 	window.onload = function(){
 		searchFunction();
 	}
 	
 	 $('#insertBtn').on('click', function(){

    	 $.ajax({
  			type:"post",
  			url: "/community/replyInsert.jsp?sid=<%=sid%>&bno=<%=bno%>",
  			data : {
  					content:$('#replycontent').val()
  				},
  			dataType:"text",

  			success:function(data) {
  				$('.modal-body').html('');
  				if(data==1){
  					$('.modal-body').html("댓글 등록성공");
  				} else {
  					$('.modal-body').html("댓글등록실패");
  				}
  				$('#replyModal').modal("show");
  			}
  		});
});
  	 
 	$(document).ready(function(){       
 	    $('.modal').on('hidden.bs.modal', function () {
		window.location.reload();
    	});
 	 
 	});
 </script>
</body>
</html>