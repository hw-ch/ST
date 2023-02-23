<!--
--------------------------------------------------------
최초작성자 : 최혜원(wone8115@uos.ac.kr)
최초작성일 : 2023/02/17

버전 기록 : ver1(시작 23/02/17)
--------------------------------------------------------
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/includes/header.jsp" %>
<%
	String bNo = request.getParameter("bNo");
	String sNo = StudyBoardDAO.sNoCheck(bNo);
%>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<style>
	a {
  text-decoration: none;
  color:black;
	}
</style>
<body>
<div class="container">
	<div class="row">
		<div class="col p-2">
			<input type="text" class="form-control" id="title">
		</div>
	</div>
	<div class="row">
		<div class="col p-2">
			<textarea id="summernote"></textarea>
		</div>
	</div>
	<div class="row justify-content-end">
		<div class="col p-2">
			<div style="float:right;">
				<button class="btn btn-secondary" onclick="history.back()">취소</button>
				<button class="btn btn-primary" id="modifyBtn">수정</button>
			</div>
		</div>
	</div>
</div>

<div class="modal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
<!--       <div class="modal-header">
        <h5 class="modal-title">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> -->
      <div class="modal-body">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" onclick="location.href='/studyCommunity/boardView.jsp?sNo=<%=sNo%>'">닫기</button>
      </div>
    </div>
  </div>
</div>

<script>
		$('#pageTitle').text("스터디 커뮤니티");
      $('#summernote').summernote({
        tabsize: 5,
        height: 180,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture', 'video']],
          ['view', ['fullscreen', 'codeview', 'help']]
        ]
      });
      
      $('#modifyBtn').on('click', function(){
    	    	 $.ajax({
    	  			type:"post",
    	  			url: "/studyCommunity/boardModifyProc.jsp",
    	  			data : {bno : <%=bNo%>,
    	  					modify : 1,
    	  					title:$('#title').val(),
    	  				    content:$('#summernote').val()
    	  				},
    	           
    	  			dataType:"text",
    	  			
    	  			success:function(data) {
    	  				$('.modal-body').html('');
    	  				if(data==1){
    	  					$('.modal-body').html('<p>수정 완료되었습니다.</p>');
    	  				} else {
    	  					$('.modal-body').html('<p>수정 실패하였습니다.<br>다시 시도해주세요.</p>');
    	  				}
    	  				$('.modal').show()
    	  			}
    	  		});
      });
      
      $(document).ready(function(){
    	  $.ajax({
     			type:"POST",
     			url:"/studyCommunity/boardModifyProc.jsp",
     			data : {bno : <%=bNo%>,
  					modify : 2
  				},
  			dataType:"text",
     			success:function(data){
     				var board = JSON.parse(data.trim());
     				$('#title').val(board.subject);
     				$('.note-editable').html(board.content);
     			}
     			
     		});  
      })
</script>
</body>
</html>