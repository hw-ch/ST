<!-- 본인 정보 보기 -->
<!-- -------------------------------------------------------- -->
<!-- 최초작성자 : 정소영(jungsoyy@gmail.com) -->
<!-- 최초작성일 : 2023/02/15 -->

<!-- 버전 기록 : ver1(시작 23/02/15) -->
<!-- -------------------------------------------------------- -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="jdbc.UserDAO.*"%>
<%@page import="jdbc.UserDTO.*"%>
<%@page import="java.util.*"%>
 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>STUDY TIME</title>
</head>
<body>
<%@ include file="/includes/header.jsp" %>
<% 
	

	sid = (String) session.getAttribute("sid"); 
%>
<%-- 	if (sid == null){
		
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
		
<%} else { --%>
<%
	/* session.setAttribute("userid", sid); */

	UserDTO users = UserDAO.myInfo(sid);

%>		

<div class="d-grid gap-2 col-6 mx-auto">

<div class="card mb-3" style="max-width: 540px;">
  <div class="row g-0" >
    <div class="col-md-4">
      <img class="img-fluid rounded-start" src="/images/<%=users.getImage()%>" alt="이미지">
    </div>
    <div class="col-md-8">
      <div class="card-body">
      
      	<form class="needs-validation" novalidate>
          <div class="row g-3">
   			 <div class="col-12">
              <label for="email" class="form-label">아이디</label>
              <span type="email" class="form-control" id="userId"><%=user.getUserId() %></span>
              <div class="invalid-feedback">
              </div>
            </div>

            <div class="col-12">
              <label for="nickName" class="form-label">닉네임</label>
              <span type="text" class="form-control" id="nickName"><%=user.getNickName() %></span>
              <div class="invalid-feedback">
              </div>
            </div>

            <div class="col-12">
              <label for="name" class="form-label">이름</label>
                <span type="text" class="form-control" id="name"><%=user.getName() %></span>
              <div class="invalid-feedback">
                </div>
            </div>

            <div class="col-sm-12">
              <label for="ts" class="form-label">가입일자</label>
              <span type="text" class="form-control" id="ts"><%=user.getTs() %></span>
              <div class="invalid-feedback">
              </div>
            </div>

            <div class="col-12">
              <label for="gender" class="form-label">성별</label>
              <span type="text" class="form-control" id="gender"><%=user.getGender() %></span>
              <div class="invalid-feedback">
              </div>
            </div>

            <div class="col-12">
              <label for="phone" class="form-label">전화번호</label>
              <span type="text" class="form-control" id="phone"><%=user.getPhone() %></span>
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
			  <button class="btn btn-secondary" onclick="location.href='/user/myInfoModify.jsp' " type="submit">내 정보 수정</button>
			  <button class="btn btn-secondary" onclick="location.href='/user/myDelete.jsp' " type="submit">회원 탈퇴</button>
			</div>
    
      </div>
      
</body>
</html>