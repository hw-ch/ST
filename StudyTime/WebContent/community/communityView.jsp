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
   		<div class="community_title">커뮤니티 타이틀</div>
   		<div class="Writer">작성자</div>
   		<div class="DateAndViews">
   			<div class="Date">날짜</div>
   			<div class="view">조회수</div>
   		</div>
   		<hr>
   		</section>
   		
   		<div class=community_content>글 내용</div>
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