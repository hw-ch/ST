<!-- 내 정보 수정 -->
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
<body>
<%@ include file="/includes/header.jsp" %>


<div class="d-grid gap-2 col-6 mx-auto">

<div class="card mb-3" style="max-width: 540px;">
  <div class="row g-0">
    <div class="col-md-4">
      <img class="img-fluid rounded-start" src="/images/bg3.jpg" alt="이미지">
    </div>
    <div class="col-md-8">
      <div class="card-body">
      
      	<form  action="myInfoModifyCheck.jsp" method="post" class="needs-validation" novalidate>
          <div class="row g-3">
            
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
            
          </div>
         

 <hr class="my-4">
			
			<div class="d-grid gap-2 col-6 mx-auto">
			  <button class="btn btn-secondary" type="submit">정보 수정</button>
			  <button class="btn btn-secondary"  onclick="location.href='/user/myInfo.jsp' " type="button">내 정보 보기</button>
			</div>
   			 </form>
         
      </div>
    </div>
  </div>
</div>
      </div>
      
</body>
</html>