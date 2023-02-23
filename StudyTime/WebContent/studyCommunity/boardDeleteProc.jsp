<!--
--------------------------------------------------------
최초작성자 : 최혜원(wone8115@uos.ac.kr)
최초작성일 : 2023/02/23

버전 기록 : ver1(시작 23/02/23)
--------------------------------------------------------
  -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.*" %>
<%@ include file="/includes/header.jsp" %>
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
      	<button type="button" class="btn btn-primary" id="check">확인</button>
      </div>
    </div>
  </div>
</div>

<%
  
	String bno = request.getParameter("bNo");
	String sNo = request.getParameter("sNo");

	int result = StudyBoardDAO.delete(bno);
	
	if(result > 0){
		%>
		<script>
			
			$('.modal-body').html('');
			$('.modal-body').html('<p>삭제 완료되었습니다.</p>');
			$('#check').on('click', function(){
				location.href="/studyCommunity/boardView.jsp?sNo=<%=sNo%>";
			});
			$('.modal').show();
    	</script>
		<%
	} else{
		%>
		<script>
			$('.modal-body').html('');
			$('.modal-body').html('<p>삭제 실패하였습니다.</p><br>다시 시도해주세요.');
			$('#check').on('click', function(){
				location.href="/studyCommunity/boardDetail.jsp?bNo=<%=bno%>";
			});
			$('.modal').show();
    	</script>
		<%
	}

%>    