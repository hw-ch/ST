<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>STUDY TIME</title>
</head>
<body>
	<%@ include file = "/includes/header.jsp" %>
	<%
		
	%>
	<div class="col-lg-8 mx-auto p-4 py-md-5">
		<header class="d-flex align-items-center pb-3 mb-5 border-bottom">
	    	<img src="/images/favicon.ico" width="40" height="32" class="me-2"></img>
		    <span class="fs-4"><%=session.getAttribute("sid")%></span>
		</header>
		<main>
			<div>
				<h1 class = "pb-3 mb-5">코딩테스트 스터디 모집중!!!</h1>
			     <div class = "pb-3 mb-5" >	
		     	 	<table class="table table-borderless fs-5"> 
					    <tr>
					      <td>진행방식</td>
					      <td>디비디</td>
					      <td>모집인원</td>
					      <td>d명</td>
					    </tr>
					    <tr>
					      <td>시작예정</td>
					      <td>dddd.dd.dd</td>
					      <td>카테고리</td>
					      <td>dd/dddd</td>
					    </tr>
					    <tr>
					      <td>진행기간</td>
					      <td>d개월</td>
					    </tr> 
					</table>
			    </div>
			</div>
		    <div>
			    <h1>스터디 소개</h1>
			    <div class="border-bottom pb-3 mb-5"></div>
			   	<div>
			   		 등록(2),상세보기(2),이전으로(history.back()),수정(2),삭제(proc),참여신청(proc),지도api
			   	</div> 
		    </div>
		  	
		</main>
		<footer class="pt-5 my-5 text-muted border-top">
	  		<div class="mb-5">
		      <a href="#" class="btn btn-warning btn-lg px-4 text text-white">이전으로</a>
		      <a href="#" class="btn btn-warning btn-lg px-4 text text-white">참여하기</a>
		      <a href="#" class="btn btn-primary btn-lg px-4 text text-white">수정</a>
		      <a href="#" class="btn btn-danger btn-lg px-4 text text-white">삭제</a>
	  		</div>
		</footer>
	</div>
</body>
</html>