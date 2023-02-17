<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스타 : 로그인</title>
</head>
<body>
<%@ include file="/includes/header.jsp" %>

<form action="loginCheck.jsp" method="post">
<input type="text" name="userId" placeholder="아이디">
<input type="password" name="password" placeholder="비밀번호">
<button>로그인</button>
</form>


<a id="custom-login-btn" href="javascript:kakaoLogin()">
<img src="kakao.png">
</a>

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<script>
	//발급 받은 키
	Kakao.init("bd4d106b6916c47dfeb4380bf35ad256");
	
	function kakaoLogin() {
		window.Kakao.Auth.login({
			// 개발자 사이트에서 체크한 항목들과 반드시 일치해야 한다. 
			scope:'profile_nickname, account_email, gender',
			success: function (authObj) {window.Kakao.API.request({url:'/v2/user/me',	//로그인에 성공하면 url로 접근
				success:res => {const kakaoAccount = res.kakao_account;
					location.href='loginKakaoCheck.jsp?nickname=' + kakaoAccount.profile.nickname
							+ '&userId=' + kakaoAccount.email
							+ '&gender=' + kakaoAccount.gender;}
			});
		}		
		});
	}

</script>
</body>
</html>