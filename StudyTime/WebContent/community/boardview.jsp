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
	UserDTO userid = new UserDAO().getOneList(sid);
	int bno = Integer.parseInt(request.getParameter("bno"));
	BoardDTO board = new BoardDAO().getboard(bno);
	ReplyDAO.replyCount(bno);

%>

	<div class="communityView">
	<div><button class="btn btn-secondary btn-lg" onclick="location.href='boardList.jsp'">&laquo; 목록으로</button></div>
		<section class="communityView_Postheader">
   		<div class="community_title"><%=board.getSubject() %></div>
   		<div class ="writer_wrap">
   		<div class="Writer"><%= board.getNickName() %></div>
   		<% if(sid != null && sid.equals(board.getUserId()))
   		{
		%>   
   		<div class="community_update" style="margin-right: 10px;"><button class="btn btn-warning btn-lg" onclick="location.href='boardUpdate.jsp?sid=<%=sid %>&bNo=<%= bno %>'">수정</button></div>
   		<div class="community_delete"><button class="btn btn-danger btn-lg" type="button" onclick="boradDelete()">삭제</button></div>
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
  			<textarea class="form-control col-sm-5" rows="5" id="replycontent"></textarea>
	  			<div class="replyinsert_wrap">
	  			<button class="btn btn-primary" type="button" id="insertBtn">댓글 등록</button>
	  			</div>
	  		</div>
  	 	<table class="table table-hover">
  			<tbody id="replylist">
 			 </tbody>
		</table>	
		 <ul class="pagination justify-content-center"></ul>
	</div>
	
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
	        <button onclick="location.href='boardDeleteProc.jsp?bNo=<%= bno %>'" class="btn btn-danger">예</button>
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

	<div class="modal fade" id="replydeleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	    	<input id="deleterno" type="hidden" value="">
	      <div class="modal-body">
			정말로 삭제하시겠습니까?
	      </div>
	      <div class="modal-footer">
	        <button onclick="replydelete()" class="btn btn-secondary" data-bs-dismiss="modal">예</button>
  		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">아니요</button>
	      </div>
	    </div>
	  </div>
	</div>

<script>

var pageSize = 5;
var currentPage = null;
if(currentPage == null){currentPage = 1;}
var total = <%=board.getReplyNum()%>;
var totalPage = Math.ceil(total / pageSize);
var pageGroup = Math.ceil(currentPage / 10);
var pageCount = total / pageSize + (total% pageSize == 0?0:1);
var pageBlock = 5;
var start = ((currentPage -1)/pageBlock)*pageBlock+1;
var last = start + pageBlock-1;
if (last > totalPage){last = totalPage};

 	function searchFunction(){

 		$.ajax({
 			type:"POST",
 			url:"/community/replylistProc.jsp?bno=<%=bno%>",
 			data: { pageSize : pageSize,
					currentPage : currentPage
 			},
  			dataType:"text",

 			success:function(data){
 				var replies = JSON.parse(data.trim());
 				var str="";
 				for(var i=0; i < replies.length; i++){
 					str += "<hr>"
 					str += "<div><div class ='writer_wrap'>"
 					str += "<div class='Writer'>" +replies[i].nickname + "&nbsp&nbsp&nbsp&nbsp 작성 날짜 :" + replies[i].regDate +"</div>"
 					if("<%= sid %>" != null && "<%= sid %>"  == replies[i].userid){
 	 					str += "<div class='community_update' style='margin-right:10px;'>"
 	 					str += "<button class='btn btn-warning' style='display:none' id='replyUpdateBtn="+ replies[i].rNo +"' onclick='replyUpdate("+ replies[i].rNo +")'>수정하기</button>"
 	 					str += "<button class='btn btn-warning' id='replyModifyBtn="+ replies[i].rNo +"' type='button' onclick='replyModify("+ replies[i].rNo +")'>수정</button></div>"
 						str += "<div class='community_delete'><button class='btn btn-danger'id='replydelteBtn="+ replies[i].rNo +"' type='button' onclick='replyDel("+ replies[i].rNo +")'>삭제</button></div>"
 					}
 					str += "</div>"
 					str += "<div><p id='replycontent="+ replies[i].rNo +"'>" + replies[i].content + "</p></div></div>"
 				}
 				$('#replylist').html(str);
 			} 
 		});
 	}
 	
 	function pagination(){
 		if (total <= pageSize) return;
 		var str = '';
 		if (start > pageBlock) {
 	 		  str += "<li class='page-item prev'><a class='page-link' onclick='changereplypage2("+(start-pageBlock)+")'>&laquo; Previous</a></li>";
 	 		}
 		for(i=start; i<=last; i++){
				str += "<li class='page-item "+ (i == currentPage?'active':'') +"'><a class='page-link' onclick='changereplypage("+i+")'>"+ i +"</a></li>"
		}
 		if (last < totalPage) {
	 		  str += "<li class='page-item next'><a class='page-link' onclick='changereplypage2("+(start+pageBlock)+")'>Next &raquo;</a></li>"
	 		}
 		
 	
 		$('.pagination').html(str);
 	}
 	
 	function changereplypage(i){
		currentPage = i;
 		searchFunction();
 		pagination();
 	}
 	
 	function changereplypage2(i){
 		start = i;
 		last = start + pageBlock-1;
		if (last > totalPage){last = totalPage};
 		pagination();

 	}
	
 	function boradDelete(){
		$("#deleteModal").modal("show");
 	}
 	
 	function replyModify(rno){
 		var element = document.getElementById("replycontent=" +rno);
 		$( element ).contents().unwrap().wrap( "<textarea class='form-control col-sm-5' rows='5' name='replycontent="+ rno +"'>'" );
 		const btn1 = document.getElementById('replydelteBtn='+rno);
 		const btn2 = document.getElementById('replyModifyBtn='+rno);
 		const btn3 = document.getElementById('replyUpdateBtn='+rno);
 		btn1.style.display='none';
 		btn2.style.display='none';
 		btn3.style.display='block';
 		}
 	
 	
 	function replyUpdate(rno){
 		var testName = "replycontent="+ rno;
 		var content =$("textarea[name='"+testName+"']").val();
 		location.href="replyUpdateProc.jsp?rno="+rno+"&content=" +content;
 		}

 	
 	function replyDel(rno){
 	     var rno = rno
 		$("#replydeleteModal #deleterno").val(rno);
		$("#replydeleteModal").modal("show");
 	}

	function replydelete(){
		$.ajax({
  			type:"post",
  			url: "/community/replyDeleteProc.jsp?bno=<%=bno%>",
  			data : {
 					rno:$("#replydeleteModal #deleterno").val()
  				},
  			dataType:"text",
  			
  			success:function(data) {
  				window.location.reload();
  			}
		});
	}
 	
 	window.onload = function(){
 		searchFunction();
 		pagination();
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
  					$('.modal-body').html("댓글 등록실패");
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
 	
 	 $("#home").hide();
 </script>
 

</body>
</html>