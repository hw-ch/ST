<!--
--------------------------------------------------------
최초작성자 : 최혜원(wone8115@uos.ac.kr)
최초작성일 : 2023/02/16

버전 기록 : ver1(시작 23/02/16)
--------------------------------------------------------
  -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/includes/header.jsp" %>
<%@ page import="jdbc.*" %>
<%
	int bNo = 0;
	if(request.getParameter("bNo") != null){
		bNo = Integer.parseInt((String)request.getParameter("bNo"));	
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="card">
		  <div class="card-header" id="title">
		  </div>
		  <div class="card-body">
		  	<div class="row">
		  		<span id="regDate"></span>
		  		<span id="hit"></span>
		  	</div>
		  	<hr>
		  	<div><p class="card-text" id="content"></p></div>
		  </div>
		</div>
		<div>
			<button class="btn btn-sm btn-warning" onclick="location.href='/notice/noticeModify.jsp?bNo=<%=bNo%>'">수정</button>
			<button class="btn btn-sm btn-warning" onclick="location.href='/notice/noticeDelete.jsp?bNo=<%=bNo%>'">삭제</button>
			<button class="btn btn-sm btn-warning" onclick="location.href='/notice/noticeView.jsp'">목록으로</button>
		</div>
	</div>
</body>
<script>
	function searchFunction(){
		$.ajax({
			type:"POST",
			url:"/notice/noticeDetailProc.jsp?bNo=" + <%=bNo%>,
			success:function(data){
				var notice = JSON.parse(data.trim());
				$('#title').html(notice.title);
				$('#content').html(notice.content);
				$('#regDate').html("작성일 : " + notice.regDate);
				$('#hit').html("조회수 : " + notice.hit);
				console.log(data);
			}
			
		});
	}
	
	
	
	window.onload = function(){
		searchFunction();
	}
</script>
</html>