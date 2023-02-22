<!--
--------------------------------------------------------
최초작성자 : 최혜원(wone8115@uos.ac.kr)
최초작성일 : 2023/02/16

버전 기록 : ver1(시작 23/02/16)
		ver2(23/02/20)
--------------------------------------------------------
  -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/includes/header.jsp" %>
<%
	int bNo = 0;
	try{
		bNo = Integer.parseInt((String)request.getParameter("bNo"));
	} catch(Exception e){
		e.printStackTrace();
	}
	
	NoticeDAO.updateHit(bNo);
	
%>
<!DOCTYPE html>
<html>
<body>
	<div class="container">
		<div class="card p-2">
		  <div class="card-header" id="title">
		  </div>
		  <div class="card-body">
		  	<div class="row justify-content-between">
		  		<div class="col-3"><span class="small" id="regDate"></span></div>
		  		<div class="col-1"><span class="small" id="hit"></span></div>
		  	</div>
		  	<hr>
		  	<div><p class="card-text" id="content"></p></div>
		  </div>
		</div>
		<div class="row p-2">
		<div class="col">
			<div style="float:right;">
			<% if(sid.equals("admin")){
			%>
				<button class="btn btn-warning" onclick="location.href='/notice/noticeModify.jsp?bNo=<%=bNo%>'">수정</button>
				<button class="btn btn-warning" id="deleteBtn" data-bs-toggle="modal" data-bs-target="#exampleModal">삭제</button>
			<%
			}
			%>
				<button class="btn btn btn-secondary" onclick="location.href='/notice/noticeView.jsp'">목록으로</button>
			</div>
		</div>
		</div>
</div>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
<!--       <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> -->
      <div class="modal-body">
      	<p>정말 삭제하시겠습니까?</p>
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-primary" onclick="location.href='/notice/noticeDeleteProc.jsp?bNo=<%=bNo%>'">확인</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
</body>
<script>
	$('#pageTitle').text("공지사항");


	
	function searchFunction(){
		$.ajax({
			type:"POST",
			url:"/notice/noticeDetailProc.jsp",
			data : {bNo : <%=bNo%>
				},		
			success:function(data){
				var notice = JSON.parse(data.trim());
				$('#title').html(notice.title);
				$('#content').html(notice.content);
				$('#regDate').html(notice.regDate);
				$('#hit').html("hit : " + notice.hit);
				console.log(data);
				
			}
			
		});
	}
	
	$('#deleteBtn').on('click', function(){
		$('.modal-body').html('');
		$('.modal-body').html('<p>정말 삭제하시겠습니까?</p>');
		$('.modal').show();
	});
	

	window.onload = function(){
		searchFunction();

	}
	
	
	
</script>
</html>