<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스타 : 회원 가입</title>

<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>

<form action="joinCheck.jsp">
아이디 <input type="email" name = "id"> <br>
비밀번호 <input type="password" name = "password"> <br>
비밀번호 확인 <input type="password" name = "pwChk"> <br>
이름 <input type="text" name = "name"> <br>
닉네임 <input type="text" name = "nickname"> <br>
전화번호 <input type="text" name = "phone"> <br>
성별 <input type="radio" name="gender" value="남자" checked>남자
	<input type="radio" name="gender" value="여자">여자<br>
이미지 <input type="file" name="image"><hr>
<button>회원 가입</button>
</form>



</body>
</html>