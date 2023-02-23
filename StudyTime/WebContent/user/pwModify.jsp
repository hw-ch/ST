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

	#st{ font-size : 20px;}
  </style>
</head>
<body>
<%@ include file="/includes/header.jsp" %>


<div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-6 mx-auto">
      <img id="im" class="mb-4" src="/images/study3.png" alt="" width="100" height="100">
      <div style="text-align: center"><p id="st">STUDY TIME</p></div>
        <form class="validation-form" action="/user/pwModifyChk.jsp" method="post" novalidate>

          <div class="mb-3">
            <label for="userId">아이디</label>
            <input type="text" class="form-control" name="userId" required>
            
            <div class="invalid-feedback">아이디를 입력해주세요.</div>
              
            
          </div>
          
          <div class="mb-3">
            <label for="currPw">현재 비밀번호</label>
            <input type="password" class="form-control" name="currPw" id="currPw" required>
            
            
            <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
              
            
          </div>
          
          <div class="mb-3">
            <label for="newPw">새 비밀번호</label>
            <input type="password" class="form-control" name="newPw" id="newPw" required>
            
            <div class="valid-feedback">사용가능한 비밀번호입니다.</div>
            <div class="invalid-feedback">영문자, 숫자, 특수문자 포함 10자이상 비밀번호를 입력해주세요.</div>
              
            
          </div>
          
          <div class="mb-3">
            <label for="pwChk">비밀번호 확인</label>
            <input type="password" class="form-control" name="pwChk" id="pwChk" required>
            
            <div class="valid-feedback">새 비밀번호와 일치합니다.</div>
            <div class="invalid-feedback">새 비밀번호와 일치하지 않습니다.</div>
              
            
          </div>
          
          <hr class="mb-4">
          
          <button class="btn btn-primary btn-lg btn-block" type="submit">비밀번호 변경</button>
        </form>
      </div>
    </div>
    
    <footer class="my-3 text-center text-small">
      <p class="mb-1">&copy; STUDY TIME</p>
    </footer>
  </div>




<script>
  
  $('#home').hide()
  
  // 전화번호 자동 하이픈 넣기 
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
  
 // id 가 pw 인 input 요소에 input 이벤트가 일어났을때 실행할 함수 등록 
    document.querySelector("#newPw").addEventListener("input", function(event){
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
  
 // id 가 pwChk 인 input 요소에 input 이벤트가 일어났을때 실행할 함수 등록 
    document.querySelector("#pwChk").addEventListener("input", function(){
  	  
       let inputPw = document.querySelector("#newPw").value;
       let inputPwChk=this.value;
       
       if(inputPw == inputPwChk){
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