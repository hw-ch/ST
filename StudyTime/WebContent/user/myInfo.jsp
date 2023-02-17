<!-- 본인 정보 보기 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>STUDY TIME</title>
</head>
<body>
<%@ include file="/includes/header.jsp" %>
<% 
	sid = (String) session.getAttribute("userId");
	if (sid == null){
%>		
		<!-- Modal -->
		<div class="modal fade" id="exampleModal2"  data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">회원 전용 메뉴</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        로그인을 한 회원만 사용 가능한 메뉴입니다.<br>
		        로그인 화면으로 이동합니다. 
		      </div>
		      <div class="modal-footer">
		        <button onclick="location.href='/user/login.jsp'" class="btn btn-primary">로그인 이동</button>

		      </div>
		    </div>
		  </div>
		</div>

		<script>
			$(function() {
				$("#exampleModal2").modal("show");
			});
		</script>		
		
<%} else {
	session.setAttribute("userId", sid);
}
%>		
  
 <script>
 	function addItem() {
 		$.ajax({
 			type:"post",
 			url: "/feed/feedadd.jsp",
 			data : {id:document.getElementById('id').value,
 				    content:$("#summernote").summernote("code")
 				},
          
 			dataType:"text",
 			
 			success:function(data) {
 				var summernote = document.getElementById('summernote');
 				summernote.value="";
 				searchFunction();
 				$("#summernote").summernote("reset");

 			}
 		});
 	}
 	
	function delItem(no) {
 		$.ajax({
 			type:"post",
 			url: "/feed/feeddel.jsp",
 			data : {no:no
 				},
          
 			dataType:"text",
 			
 			success:function(data) {
 				searchFunction();

 			}
 		});
 	}
	
 	
  	function searchFunction(userId) {
 		
 		$.ajax({
 			type:'post',
 			url:'/feed/feedall.jsp',
 			success:function(data){
 				var feeds = JSON.parse(data.trim());
 				
 				var str = "";
 				for(var i = 0; i < feeds.length; i++){
 					

 					str += "<tr><td>" + feeds[i].id + "</td>";
 					str += "<td><small>&nbsp;(" + feeds[i].ts + ")</small></td></tr>";		
 					str += "<tr><td colspan=2>" + feeds[i].content + "</td></tr>";
					str += "<tr><td colspan=2>";
					
					if ("<%=sid %>" == feeds[i].id){
						str += "<div onclick='delItem(\"" + feeds[i].no + "\")'><span class='text-danger bg-dark'>Delete</span></div>";
					}	// 함수 호출 시 값을 포함하여 던지는 방법 :  \뒤의 " 없는셈 
					
					str += "</td></tr>";
 					str += "<tr><td colspan=2 height=40><hr></td></tr>"
 				} $("#ajaxTable").html(str);
 			}
 		});
 	}

 	window.onload = function() {
 		searchFunction();
 	}

 
 </script>

<div class="d-grid gap-2 col-6 mx-auto">

<div class="card mb-3" style="max-width: 540px;">
  <div class="row g-0">
    <div class="col-md-4">
      <img class="img-fluid rounded-start" src="bg3.jpg" alt="이미지">
    </div>
    <div class="col-md-8">
      <div class="card-body">
      
      	<form class="needs-validation" novalidate>
          <div class="row g-3">
   			 <div class="col-12">
              <label for="email" class="form-label">아이디</label>
              <input type="email" class="form-control" id="userId">
              <div class="invalid-feedback">
              </div>
            </div>
            
            <div class="col-12">
              <label for="nickName" class="form-label">닉네임</label>
              <input type="text" class="form-control" id="nickName">
              <div class="invalid-feedback">
              </div>
            </div>

            <div class="col-12">
              <label for="name" class="form-label">이름</label>
                <input type="text" class="form-control" id="name">
              <div class="invalid-feedback">
                </div>
            </div>


            <div class="col-12">
              <label for="gender" class="form-label">성별</label>
              <input type="text" class="form-control" id="gender">
              <div class="invalid-feedback">
              </div>
            </div>

            <div class="col-12">
              <label for="phone" class="form-label">전화번호</label>
              <input type="text" class="form-control" id="phone">
               <div class="invalid-feedback">
              </div>
            </div>
            
            <div class="col-sm-12">
              <label for="ts" class="form-label">가입일자</label>
              <input type="text" class="form-control" id="ts">
              <div class="invalid-feedback">
              </div>
            </div>
          </div>
         </form>
         
      </div>
    </div>
  </div>
</div>

 <hr class="my-4">
			
			<div class="d-grid gap-2 col-6 mx-auto">
			  <button class="btn btn-secondary" type="button">내 정보 수정</button>
			  <button class="btn btn-secondary" type="button">회원 탈퇴</button>
			</div>
    
      </div>
      
</body>
</html>