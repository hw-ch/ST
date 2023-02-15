<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>

<form action="joinCheck.jsp" method="post">
아이디 <input type="email" name = "id"> <br>
비밀번호 <input type="password" name = "pw"> <br>
비밀번호 확인 <input type="password" name = "pwChk"> <br>
이름 <input type="text" name = "name"> <br>
전화번호 <input type="text" name = "phone"> <br>
성별 <select name="job">
    <option value="">성별 선택</option>
    <option value="남" name="male">남</option>
    <option value="여" name="female">여</option>
</select><br>
이미지 <input text="file" name="image">
</form>







</body>
</html>