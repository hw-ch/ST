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
        <form class="validation-form" action="/user/loginCheck.jsp" method="post" novalidate>
         

          <div class="mb-3">
            <label for="email">아이디</label>
            <input type="text" class="form-control" name="userId" placeholder="you@example.com" required>
            <div class="invalid-feedback">
              이메일을 입력해주세요.
            </div>
          </div>
          
          <div class="mb-3">
            <label for="password">비밀번호</label>
            <input type="password" class="form-control" name="password" required>
            <div class="invalid-feedback">
              비밀번호를 입력해주세요.
            </div>
          </div>
          
          
          <hr class="mb-4">
          
          <div style="text-align: center";>
          <button class="btn btn-primary btn-lg" type="submit">로그인</button>
          <a id="custom-login-btn" href="javascript:kakaoLogin()">
		  <img src="/images/kakao1.png" width="200" height="45">
		  </a><br><br>
		  </div>
		  <div style="text-align: right";>
          <a href="/user/idFind.jsp">아이디 찾기</a>
		  <a href="/user/pwFind.jsp">비밀번호 찾기</a>&nbsp;&nbsp;&nbsp;&nbsp;
		  <a href="/user/pwModify.jsp">비밀번호 변경</a>
		  </div>
        </form>
      </div>
    </div>
    
    <footer class="my-3 text-center text-small">
      <p class="mb-1">&copy; STUDY TIME</p>
    </footer>
  </div>
  
  
  <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
  
  <script>
  $('#home').hide();
  
  
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
  
//발급 받은 키
	Kakao.init("bd4d106b6916c47dfeb4380bf35ad256");
	
	function kakaoLogin() {
		window.Kakao.Auth.login({
			// 개발자 사이트에서 체크한 항목들과 반드시 일치해야 한다. 
			scope:'profile_nickname, account_email, gender',
			success: function (authObj) {window.Kakao.API.request({url:'/v2/user/me',	//로그인에 성공하면 url로 접근
				success:res => {const kakaoAccount = res.kakao_account;
					location.href='/user/loginKakaoCheck.jsp?nickname=' + kakaoAccount.profile.nickname
							+ '&userId=' + kakaoAccount.email
							+ '&gender=' + kakaoAccount.gender;}
			});
		}		
		});
	}
  
  </script>
</body>
</html>