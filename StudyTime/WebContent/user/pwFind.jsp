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

<!-- <form action="pwFindChk.jsp">
<input type="email" name="userId" placeholder="아이디" required>
<input type="text" name="name" placeholder="이름" required>
<input type="text" name="phone" placeholder="휴대폰번호" required>
<button>비밀번호 찾기</button>
</form> -->

<div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-6 mx-auto">
        <form class="validation-form" action="/user/pwFindChk.jsp" method="post" novalidate>

          <div class="mb-3">
            <label for="userId">아이디</label>
            <input type="email" class="form-control" name="userId" required>
            <div class="invalid-feedback">
              아이디를 입력해주세요.
            </div>
          </div>
          
          <div class="mb-3">
            <label for="name">이름</label>
            <input type="text" class="form-control" name="name" required>
            <div class="invalid-feedback">
              이름을 입력해주세요.
            </div>
          </div>
          
          <div class="mb-3">
            <label for="phone">휴대폰 번호</label>
            <input type="text" class="form-control" name="phone" required>
            <div class="invalid-feedback">
              휴대폰 번호를 입력해주세요.
            </div>
          </div>
          
          <hr class="mb-4">
          
          <button class="btn btn-primary btn-lg btn-block" type="submit">비밀번호 찾기</button>
        </form>
      </div>
    </div>
    
    <footer class="my-3 text-center text-small">
      <p class="mb-1">&copy; STUDY TIME</p>
    </footer>
  </div>




<script>
  
  $('#home').hide()
  
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
</script>

</body>
</html>