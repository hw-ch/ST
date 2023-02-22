<!-- 
--------------------------------------------------------
최초작성자 : 최혜원(wone8115@uos.ac.kr)
최초작성일 : 2023/02/21

버전 기록 : ver1(시작 23/02/21)
--------------------------------------------------------
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/includes/header.jsp" %>
<%
	// 이후 처리
	String sNo = "";
	try{
		sNo = request.getParameter("sno");
	} catch(Exception e){
		e.printStackTrace();
	}
	request.setAttribute("sNo", sNo);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<div class="card" style="width: 100%">
		 <div class="card-header">
    		가입 신청 유저 목록
  		</div>
  <ul class="list-group list-group-flush">
  </ul>
	</div>
	<div class="row p-2">
		<div class="col">
			<div style="float:right;">
				<button class="btn btn-secondary" onclick="location.href='/study/studyLeaderList.jsp'">이전으로</button>
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
      	<p>처리 완료되었습니다.</p>
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-warning" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>
<script>
	function searchFunction(){
		$.ajax({
			type:"POST",
			url:"/study/studyUserApplyProc.jsp",
			data : {sNo : <%=sNo%>,
					state : 'list'
			},	
			success:function(data){
				if(data == null){
					str += "<p>가입 신청 유저가 없습니다.</p>";
				} else{
					var users = JSON.parse(data.trim());
					var str="";
					for(var i=0; i < users.length; i++){
	 					str += "<li class='list-group-item'>";
						str += "<div class='row justify-content-between'>";
						str += "<div class='col-4'>"+ users[i].userid +"</div>"
						str += "<div class='col-2'>";
						str += "<button class='btn btn-sm btn-warning' id='approve' data-sjNo='"+ users[i].sjNo +"'>승인</button>";
						str += "<button class='btn btn-sm btn-light' id='reject' data-sjNo='"+ users[i].sjNo +"'>거절</button>";
						str += "</div>";
						str += "</div>";
						str += "</li>";

						 }
	
				}
				$('.list-group').html(str);
			}
			
		});
	}
	
 	window.onload = function(){
 		searchFunction();
 		
 	}
 	
 	$(document).on('click','.btn',function(){
 		
  		$.ajax({
				type:"POST",
				url:"/study/studyUserApplyProc.jsp",
				data : {sNo : <%=sNo%>,
						state : $(this).attr('id'),
						sjNo : $(this).data('sjno')
						
				},	
				success:function(data){
					$('#exampleModal').modal('show');
				}
				
			});
 	});
 	
 	$(document).ready(function(){
        $('.modal').on('hidden.bs.modal', function () {
             searchFunction();
       });

    });
</script>
</body>
</html>