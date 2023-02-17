<!-- 내 정보 수정 -->

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
      <img class="img-fluid rounded-start" src="bg3.jpg" alt="이미지">
    </div>
    <div class="col-md-6">
      <div class="card-body">
      
      	<p><span class="font-weight-bold">닉네임 : </span>
		   <span class="badge badge-danger"> 닉네임 받아오기 </span></p>
		   <a class="btn btn-secondary disabled" role="button" aria-disabled="true" style="position: absolute; right: 10px; bottom: 10px;">사진 편집</a>
	      
      </div>
    </div>
  </div>
</div>

<form class="needs-validation" novalidate>
          <div class="row g-3">
   			 <div class="col-12">
              <label for="email" class="form-label">아이디</label>
              <input type="email" class="form-control" id="userId">
              <div class="invalid-feedback">
              </div>
            </div>
            
            <div class="col-12">
              <label for="nickName" class="form-label">비밀번호</label>
              <input type="text" class="form-control" id="password">
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
			<label class="col-sm-2">성별</label>
				<label><input type="radio" name="gender" value="M" '${mvo.gender eq 'M' ? 'checked' : ''}> 남자 </label>
				<label><input type="radio" name="gender" value="F" '${mvo.gender eq 'M' ? 'checked' : ''}> 여자 </label>
			</div>
            
            <div class="col-12">
              <label for="phone" class="form-label">전화번호</label>
              <input type="text" class="form-control" id="phone">
               <div class="invalid-feedback">
              </div>
            </div>
            
          </div>
         </form>
         
 		<hr class="my-4">
			
			<div class="d-grid gap-2 col-6 mx-auto">
			  <button class="btn btn-secondary" type="button">수정 완료</button>
			</div>
      </div>
      
</body>
</html>