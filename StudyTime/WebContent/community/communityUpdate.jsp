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
	<div class="communityView">
		<section class="communityView_Postheader">
   		<div class="community_title" >
   		<input name="subject" type="text">
   		</div>
   		<div class ="writer_wrap">
   		<div class="Writer">작성자</div>
   		<div class="community_update"><button>수정</button></div>
   		<div class="community_delete"><button>삭제</button></div>
   		</div>
   		<div class="DateAndViews">
   			<div class="Date">날짜</div>
   			<div class="hits">조회수</div>
   		</div>
   		<hr>
   		</section>
   		<form action="updateAction.jsp">
   		<div class=community_content_wrap>
   		<textarea class="community_content" name="content"></textarea>
   		</div>
   		<div class="community_delete"><button>수정</button></div>
   		</form>
   		<hr>
   		<section class="community_commentView">
   			<div class="community_comment">
   			<h1 class="comment_count">댓글 수 </h1>
  			<textarea class="commentinput"></textarea>
	  			<div class="commentinput_button_wrap">
	  			<button class="commentinput_button">댓글 등록</button>
	  			</div>
   			<ul class="comment_list"></ul>
   			</div>
   		</section>
	</div>
</body>
</html>

