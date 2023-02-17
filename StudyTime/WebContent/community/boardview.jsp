<!-- 2023-02-17 김남훈 보드뷰 생성
	2023-02-18 board 작성자 수정 삭제 추가
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
	// sid 확인
	sid = "abc";
	if(session.getAttribute("sid") != null){
		sid = (String)session.getAttribute("sid");
	}

	int bNo = 1;
	if(request.getParameter("bNo") != null){
	bNo = Integer.parseInt((String)request.getParameter("bNo"));	
}
	if(bNo == 0){
	}
	
	BoardDTO board = new BoardDAO().getboard(bNo);
%>
	<form>
	<div class="communityView">
		<section class="communityView_Postheader">
   		<div class="community_title"><%= board.getSubject() %></div>
   		<div class ="writer_wrap">
   		<div class="Writer"><%= board.getNickName() %></div>
   		<% if(sid != null && sid.equals(board.getUserId())){
		%>   
   		<div class="community_update"><button onclick="location.href='boardupdate.jsp'">수정</button></div>
   		<div class="community_delete"><button onclick="location.href='deleteaction.jsp'">삭제</button></div>
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
   			<h1 class="comment_count"><%=board.getReplyNum() %> </h1>
  			<textarea class="community_content" name="content"></textarea>
	  			<div class="replyinsert_wrap">
	  			<button onclick="location.href='replyinsert.jsp'">댓글 등록</button>
	  			</div>
	  		</div>
  	 	<table class="table table-hover">
  			<tbody id="replylist">
 			 </tbody>
		</table>	
	</div>
	</form>
<script>
 	function searchFunction(){
 		$.ajax({
 			type:"POST",
 			url:"/community/replylistProc.jsp",
 			success:function(data){
 				var replies = JSON.parse(data.trim());
 				var str="";
 				for(var i=0; i < replies.length; i++){
 					str += "<div>"
 					str += "<div class ='writer_wrap'>"
 					str += "<div class='Writer'>" +replies[i].nickname + "&nbsp&nbsp&nbsp&nbsp 작성 날짜 :" + replies[i].regDate +"</div>"
 					str += "<div class='community_update'><button onclick='replyUpdate()'>수정</button></div>";
 					str += "<div class='community_delete'><button onclick='replyDelete()'>삭제</button></div>";
 					str += "</div>"
 					str += "<div><p>" + replies[i].content + "</p></div>"
 					str += "</div>"
 				}
 				$('#replylist').html(str);
 			}

 		});
 	}

	function replyUpdate(){
		
	}

 	window.onload = function(){
 		searchFunction();
 	}

 </script>
</body>
</html>