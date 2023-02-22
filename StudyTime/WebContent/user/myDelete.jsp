<!-- 회원 탈퇴 -->
<!-- -------------------------------------------------------- -->
<!-- 최초작성자 : 정소영(jungsoyy@gmail.com) -->
<!-- 최초작성일 : 2023/02/15 -->

<!-- 버전 기록 : ver1(시작 23/02/15) -->
<!-- -------------------------------------------------------- -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>STUDY TIME</title>
</head>
<body class="text-center">
<%@ include file="/includes/header.jsp" %>

<div class="container">

<% 
	sid = (String) session.getAttribute("sid");
%>
	<%-- if (sid == null){
%>		
		<!-- Modal -->
		<div class="modal fade" id="exampleModal1"  data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
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
		        <button onclick="location.href='login.jsp'" class="btn btn-primary">로그인 이동</button>

		      </div>
		    </div>
		  </div>
		</div>

		<script>
			$(function() {
				$("#exampleModal1").modal("show");
			});
		</script>		
		
<%} else { --%>
<%
	session.setAttribute("userid", sid);

%>		

<br>

<main class="form-signin w-100 m-auto">
<form action="myDeleteCheck.jsp" method="post">
    <img class="mb-4" src="/images/bg3.jpg" alt="" width="100" height="100">
    <h1 class="h3 mb-3 fw-normal">회원 탈퇴</h1>

    <div class="form-floating">
      <input type="email" class="form-control" id="userId" placeholder="name@example.com">
      <label for="userId">ID(Email address)</label>
    </div>
    <div class="form-floating">
      <input type="password" class="form-control" id="password" placeholder="Password">
      <label for="password">Password</label>
    </div>


  <hr class="featurette-divider">
	<div class="d-grid gap-2 col-6 mx-auto">
    	<input type="submit" class="w-100 btn btn-lg btn-secondary" value="회원 탈퇴">
    </div>
    </div>
  </form>
</main>
</body>
</html>