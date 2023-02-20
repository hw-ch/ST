<!-- My Study -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="jdbc.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>STUDY TIME</title>
<link href="carousel.css" rel="stylesheet">
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
	ArrayList<StudyDTO> study = StudyDAO.myList(sWriter);

	for (StudyDTO study : study) {
%>		
  
<main>
<hr class="featurette-divider">
<div class="container"> 
<div class="row row-cols-1 row-cols-sm-3 row-cols-md-3 g-3">
<div class="card border-dark mb-3" style="max-width: 18rem;">
  <h5 class="card-header">스터디 이름 </h5>
  <div class="card-body">
    <p class="card-text">스터디 장</p>
    <p class="card-text">회원수 : 10명</p>
    <p class="card-text">시작일시 : 2023/02/16</p>
     <hr class="my-4">
    <a href="#" class="btn btn-secondary">스터디 상세보기</a>
  </div>
</div>
</div>
<% 
	}
%>

<div class="row row-cols-1 row-cols-sm-3 row-cols-md-3 g-3">
<div class="card border-dark mb-3" style="max-width: 18rem;">
  <h5 class="card-header">스터디 이름 </h5>
  <div class="card-body">
    <p class="card-text">스터디 장</p>
    <p class="card-text">회원수 : 10명</p>
    <p class="card-text">시작일시 : 2023/02/16</p>
     <hr class="my-4">
    <a href="#" class="btn btn-secondary">스터디 상세보기</a>
  </div>
</div>
</div>

<div class="row row-cols-1 row-cols-sm-3 row-cols-md-3 g-3">
<div class="card border-dark mb-3" style="max-width: 18rem;">
  <h5 class="card-header">스터디 이름 </h5>
  <div class="card-body">
    <p class="card-text">스터디 장</p>
    <p class="card-text">회원수 : 10명</p>
    <p class="card-text">시작일시 : 2023/02/16</p>
     <hr class="my-4">
    <a href="#" class="btn btn-secondary">스터디 상세보기</a>
  </div>
</div>
</div>

<div class="row row-cols-1 row-cols-sm-3 row-cols-md-3 g-3">
<div class="card border-dark mb-3" style="max-width: 18rem;">
  <h5 class="card-header">스터디 이름 </h5>
  <div class="card-body">
    <p class="card-text">스터디 장</p>
    <p class="card-text">회원수 : 10명</p>
    <p class="card-text">시작일시 : 2023/02/16</p>
     <hr class="my-4">
    <a href="#" class="btn btn-secondary">스터디 상세보기</a>
  </div>
</div>
</div>

<div class="row row-cols-1 row-cols-sm-3 row-cols-md-3 g-3">
<div class="card border-dark mb-3" style="max-width: 18rem;">
  <h5 class="card-header">스터디 이름 </h5>
  <div class="card-body">
    <p class="card-text">스터디 장</p>
    <p class="card-text">회원수 : 10명</p>
    <p class="card-text">시작일시 : 2023/02/16</p>
     <hr class="my-4">
    <a href="#" class="btn btn-secondary">스터디 상세보기</a>
  </div>
</div>
</div>

</div>
</main>


</body>
</html>