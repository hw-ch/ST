<!-- ---------------------------------------------------------->
<!-- 최초작성자 : 권두현(secure3141@naver.com) -->
<!-- 최초작성일 : 2023/02/15 -->

<!-- 버전 기록 : ver1(시작 23/02/15) -->
<!-- ---------------------------------------------------------->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>STUDY TIME</title>

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

  <style>
    body {
      min-height: 100vh;

     /*background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
      background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%); */
    }

    .input-form {
      max-width: 680px;

      margin-top: 80px;
      padding: 32px;

      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
    #im {
    margin: auto;
    display: block;
    }
    
    #st{ font-size : 30px;}
    
  </style>
</head>

<body>
<%@ include file="/includes/header.jsp" %>

  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-9 mx-auto">
        <form class="validation-form" action="/user/joinCheck.jsp" method="post" enctype="multipart/form-data" novalidate>
          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="name">이름</label>
              <input type="text" class="form-control" name="name" autofocus required>
              
              <div class="invalid-feedback">이름을 입력해주세요.</div>
              
            </div>
            <div class="col-md-6 mb-3">
              <label for="nickname">닉네임</label>
              <input type="text" class="form-control" name="nickname" id="nickname" minlength="2" required>
              
              <div class="valid-feedback">사용 가능한 닉네임 입니다.</div>
              <div class="invalid-feedback">2글자 이상 10글자 이하로 작성해 주세요.</div>
              
            </div>
          </div>

          <div class="mb-3">
            <label for="email">아이디</label>
            <input type="email" class="form-control" name="userId" placeholder="you@example.com" id="userId" maxlength="30" required>
            
            
            <div class="invalid-feedback">이메일 형태의 아이디로 입력해주세요.</div>
              
            
          </div>

          <div class="mb-3">
            <label for="password">비밀번호</label>
            <input type="password" class="form-control" name="password" id="pw" minlength="10" required>
            
            <div class="valid-feedback">사용가능한 비밀번호입니다.</div>
            <div class="invalid-feedback">영문자, 숫자, 특수문자 포함 10자이상 비밀번호를 입력해주세요.</div>
             
            
          </div>

          <div class="mb-3">
            <label for="passwordChk">비밀번호확인<!-- <span class="text-muted">&nbsp;(필수 아님)</span> --></label>
            <input type="password" class="form-control" id="pwChk" required>
            
            <div class="valid-feedback">비밀번호와 일치합니다.</div>
          	<div class="invalid-feedback">비밀번호와 일치하지 않습니다.</div>
          	
            
          </div>

          <div class="row">
          <div class="col-md-6 mb-3">
              <label for="phone">휴대전화번호</label>
              <input type="text" class="form-control" name="phone" id="phone" oninput="autoHyphen(this)" minlength="13" maxlength="13" required>
              
              
              <div class="invalid-feedback">완전한 휴대전화번호를 입력해주세요.</div>
              
              
            </div>
            <div class="col-md-6 mb-3">
              <label for="gender">성별</label>
              <select class="custom-select d-block w-100" name="gender">
                <option value="male">남성</option>
                <option value="female">여성</option>
              </select>
              
              <div class="invalid-feedback">성별을 선택해주세요.</div>
                
              
            </div>
          </div>
          
          <div class="mb-3">
            <label for="email">이미지</label>
            <input type="file" class="form-control" name="image" required>
            
            <div class="invalid-feedback">이미지를 선택해주세요.</div>
              
            
          </div>
          
          <hr class="mb-4">
          <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="aggrement" required>
            <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
          </div>
          <div class="mb-4"></div>
          <button class="btn btn-primary btn-lg btn-block" type="submit">가입 완료</button>
        </form>
      </div>
    </div>
    
    
    <footer class="my-3 text-center text-small">
      <p class="mb-1">&copy; STUDY TIME</p>
    </footer>
  </div>
  
  
  <script>
  
  $('#home').hide();
  
  
  //전화번호에 자동 하이픈 넣기
  const autoHyphen = (target) => {
	  target.value = target.value
	    .replace(/[^0-9]/g, '')
	   .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
	 }

  
  //유효성 검사
  window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');
			
      Array.prototype.filter.call(forms, (form) => {
    	  form.classList.add('is-validated');
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
            
          }

          form.classList.add('was-validated');
        }, false);
      });
    }, false);  
  
//닉네임의 유효성 여부를 저장할 변수를 만들고 초기값 false 부여
  let isNickValid=false;

  // id 가 nickname 인 input 요소에 input 이벤트가 일어났을때 실행할 함수 등록 
  document.querySelector("#nickname").addEventListener("input", function(){
     
	  let inputNick=this.value;
     isNickValid = inputNick.length >=2 && inputNick.length <= 10;
     
     if(isNickValid){
        this.classList.remove("is-invalid");
        this.classList.add("is-valid");
     }else{
        this.classList.remove("is-valid");
        this.classList.add("is-invalid");
     }
  });
 
//아이디 유효성 검사
document.querySelector("#userId").addEventListener("input", function(event){
	  let reg = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
	  let inputId=this.value;
	  
     if(reg.test(inputId)){
        this.classList.remove("is-invalid");
        this.classList.add("is-valid");
     }else{
        this.classList.remove("is-valid");
        this.classList.add("is-invalid");
        
     }
  });

  
  
  // id 가 pw 인 input 요소에 input 이벤트가 일어났을때 실행할 함수 등록 
  document.querySelector("#pw").addEventListener("input", function(event){
	  let reg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[~@$!%*#?&])[A-Za-z\d~@$!%*#?&]{10,}$/ ;
	  let inputPw=this.value;
	  
     if(reg.test(inputPw)){
        this.classList.remove("is-invalid");
        this.classList.add("is-valid");
     }else{
        this.classList.remove("is-valid");
        this.classList.add("is-invalid");
        
     }
  });
  
  
//비밀번호확인 유효성 여부를 저장할 변수를 만들고 초기값 false 부여
  let isPwChkValid = false;
  
  // id 가 pwChk 인 input 요소에 input 이벤트가 일어났을때 실행할 함수 등록 
  document.querySelector("#pwChk").addEventListener("input", function(event){
	  
     let inputPw = document.querySelector("#pw").value;
     let inputPwChk=this.value;
     
     if(inputPw == inputPwChk){
        this.classList.remove("is-invalid");
        this.classList.add("is-valid");
     }else{
        this.classList.remove("is-valid");
        this.classList.add("is-invalid");
        return false;
     }
  });
  
  
  // id 가 phone 인 input 요소에 input 이벤트가 일어났을때 실행할 함수 등록 
  document.querySelector("#phone").addEventListener("input", function(){
	  
     let inputPhoneChk=this.value;
     
     if(inputPhoneChk.length == 13){
        this.classList.remove("is-invalid");
        this.classList.add("is-valid");
     }else{
        this.classList.remove("is-valid");
        this.classList.add("is-invalid");
     }
  });


  </script>
  
  
</body>
</html>