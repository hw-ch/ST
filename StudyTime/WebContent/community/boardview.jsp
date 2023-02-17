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
<%
int bno =1;
%>

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

   		<hr>
   		<section class="community_commentView">
   			<div class="community_comment">
   			<h1 class="comment_count">댓글 수 </h1>
  			<textarea class="community_content" name="content"></textarea>
	  			<div class="replyinsert_wrap">
	  			<button onclick="location.href='replyinsert.jsp'">댓글 등록</button>
	  			</div>
	  		</div>
<%
			ArrayList<ReplyDTO> list = ReplyDAO.ReplygetList(bno);
			for(int i=0; i<list.size(); i++){
%>
	  		<div class ="reply_wrap">
		   		<div class="Writer">작성자</div>
	   			<div class="Date">날짜</div>
		   		<div class="community_update"><button>수정</button></div>
		   		<div class="community_delete"><button>삭제</button></div>
	<%-- 	   		<div><textarea class="con></textarea> --%>
		   		</div>
		   		<div class="DateAndViews">
		   		</div>
			</div>
	   		
<%
				}
%>
   		</section>	
	</div>
</body>
</html>