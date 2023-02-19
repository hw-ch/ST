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
	<div class="row p-2">
		<div class="col">
			<input type="text" class="form-control" id="title" placeholder="제목을 입력하세요.">
		</div>
	</div>
	<div class="row p-2">
		<div class="col">
			<input type="textarea" rows="8" id="summernote">
		</div>
	</div>
	<div class="row p-2">
		<div class="col">
			<div style="float:right;">
				<button class="btn btn-light" onclick="location.href='/notice/noticeView.jsp'">취소</button>
				<button class="btn btn-warning" id="insertBtn">등록</button>
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
        <button type="button" class="btn btn-warning" onclick="location.href='/notice/noticeView.jsp'">닫기</button>
      </div>
    </div>
  </div>
</div>

<script>
      $('#summernote').summernote({
        placeholder: '내용을 입력하세요.',
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
      
      $('#insertBtn').on('click', function(){
    	    	 $.ajax({
    	  			type:"post",
    	  			url: "/notice/noticeAddProc.jsp",
    	  			data : {title:$('#title').val(),
    	  				    content:$('#summernote').val()
    	  				},
    	           
    	  			dataType:"text",
    	  			
    	  			success:function(data) {
    	  				$('.modal-body').html('');
    	  				if(data==1){
    	  					$('.modal-body').html(data + '<p>등록 완료되었습니다.</p>');
    	  				} else {
    	  					$('.modal-body').html(data + '<p>등록 실패하였습니다.<br>다시 시도해주세요.</p>');
    	  				}
    	  				$('.modal').show()
    	  			}
    	  		});
      });
</script>
</body>
</html>