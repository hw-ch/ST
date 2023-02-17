<!-- 2023-02-17 김남훈 보드뷰 생성 -->

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
	<div class="communityView">
		<section class="communityView_Postheader">
   		<div class="community_title">커뮤니티 타이틀</div>
   		<div class ="writer_wrap">
   		<div class="Writer">작성자</div>
   		<div class="community_update"><button onclick="location.href='boardupdate.jsp'">수정</button></div>
   		<div class="community_delete"><button onclick="location.href='deleteaction.jsp'">삭제</button></div>
   		</div>
   		<div class="DateAndViews">
   			<div class="Date">날짜</div>
   			<div class="hits">조회수</div>
   		</div>
   		<hr>
   		</section>
   		
   		<form action="replyinsert.jsp">
   		<div class=community_content_wrap>
   		<textarea class="community_content">내용</textarea>
   		</div>
   		<hr>
   		<section class="community_commentView">
   			<div class="community_comment">
   			<h1 class="comment_count">댓글 수 </h1>
  			<textarea class="commentinput" name="content"></textarea>
	  			<div class="commentinput_button_wrap">
	  			<button>댓글 등록</button>
	  			</div>
   			<ul class="comment_list">
   			<%
				 ArrayList<BoardDTO> replys = ReplyDAO.ReplygetList();
				 
				 for(BoardDTO reply : replys) {
				%>
				
					
				<%
				}
				%>
   			</ul>
   			</div>
   		</section>
   		</form>
	</div>
</body>
</html>