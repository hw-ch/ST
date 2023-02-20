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
  </style>
</head>

<body>
<%@ include file="/includes/header.jsp" %>

  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <form class="validation-form" action="/user/joinCheck.jsp" method="post" enctype="multipart/form-data" novalidate>
          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="name">이름</label>
              <input type="text" class="form-control" name="name" placeholder="" value="" required>
              <div class="invalid-feedback">
                이름을 입력해주세요.
              </div>
            </div>
            <div class="col-md-6 mb-3">
              <label for="nickname">닉네임</label>
              <input type="text" class="form-control" name="nickname" placeholder="" value="" required>
              <div class="invalid-feedback">
                별명을 입력해주세요.
              </div>
            </div>
          </div>

          <div class="mb-3">
            <label for="email">아이디</label>
            <input type="email" class="form-control" name="userId" placeholder="you@example.com" required>
            <div class="invalid-feedback">
              이메일을 입력해주세요.
            </div>
          </div>

          <div class="mb-3">
            <label for="password">비밀번호</label>
            <input type="password" class="form-control" name="password" id="pw" required>
            <div class="invalid-feedback">
              비밀번호를 입력해주세요.
            </div>
          </div>

          <div class="mb-3">
            <label for="passwordChk">비밀번호확인<!-- <span class="text-muted">&nbsp;(필수 아님)</span> --></label>
            <input type="password" class="form-control" id="pwChk" required>
          	<div class="invalid-feedback">
          	비밀번호와 일치하지 않습니다.
            </div>
          </div>

          <div class="row">
          <div class="col-md-6 mb-3">
              <label for="phone">휴대폰 번호</label>
              <input type="text" class="form-control" name="phone" placeholder="010-0000-0000" required>
              <div class="invalid-feedback">
                휴대폰 번호를 입력해주세요.
              </div>
            </div>
            <div class="col-md-6 mb-3">
              <label for="gender">성별</label>
              <select class="custom-select d-block w-100" name="gender">
                <option value="male">남성</option>
                <option value="female">여성</option>
              </select>
              <div class="invalid-feedback">
                성별을 선택해주세요.
              </div>
            </div>
          </div>
          
          <div class="mb-3">
            <label for="email">이미지</label>
            <input type="file" class="form-control" name="image" required>
            <div class="invalid-feedback">
              이미지를 선택해주세요.
            </div>
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
  
  $('#pageTitle').text("회원가입")
  
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');

      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }

          form.classList.add('was-validated');
        }, false);
      });
    }, false);
  
  
//비밀번호 유효성 검사
  var password = document.getElementById("pw")
  ,confirm_password = document.getElementById("pwChk");

  function validatePassword(){
  if(password.value != confirm_password.value) { // 만일 두 인풋 필드값이 같지 않을 경우
    // setCustomValidity의 값을 지정해 무조건 경고 표시가 나게 하고
    confirm_password.setCustomValidity("비밀번호와 일치하지 않습니다."); 
  } 
  else { // 만일 두 인풋 필드값이 같을 경우
    // 오류가 없으면 메시지를 빈 문자열로 설정해야한다. 오류 메시지가 비어 있지 않은 한 양식은 유효성 검사를 통과하지 않고 제출되지 않는다.
    // 따라서 빈값을 주어 submit 처리되게 한다
    confirm_password.setCustomValidity(''); 
  }
  }

  password.onchange = validatePassword;
  confirm_password.onkeyup = validatePassword;
  // End 비밀번호 유효성 검사
  </script>
</body>
</html>