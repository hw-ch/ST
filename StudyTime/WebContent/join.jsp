<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스타 : 회원 가입</title>
<body>
<%@ include file="/includes/header.jsp" %>

<form action="joinCheck.jsp">
<fieldset>
	<legend>회원가입</legend>
	아이디 <input type="email" name="id" size =30 placeholder="이메일을 입력하세요 ex)aa@naver.com" required> <br>
	비밀번호 <input type="password" name = "password" id="pw" required> <br>
	비밀번호 확인 <input type="password" id="pwChk" required> <br>
	이름 <input type="text" name = "name" required> <br>
	닉네임 <input type="text" name = "nickname" required> <br>
	전화번호 <input type="text" name = "phone" size=30 placeholder="010-0000-0000" required> <br>
	성별<select class="form-select" name="gender" aria-label="Default select example">
		<option value="male">남성</option>
		<option value="female">여성</option>
		</select><br>
	이미지 <input type="file" name="image"><hr>
	<button>회원 가입</button>
</fieldset>	
</form>


<script>
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
</script>

</body>
</html>