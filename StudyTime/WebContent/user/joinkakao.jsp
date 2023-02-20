<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스타 : 회원 가입</title>
<body>
<%@ include file="/includes/header.jsp" %>


<%
request.setCharacterEncoding("UTF-8");
String nickname = request.getParameter("nickname");
String userId = request.getParameter("userId");
String gender = request.getParameter("gender");
%>


<form action="/user/joinCheck.jsp" method="post" enctype="multipart/form-data">
아이디 <input type="email" name = "userId" value=<%= userId %> readonly> <br>
비밀번호 <input type="password" name = "password"> <br>
비밀번호 확인 <input type="password" name = "pwChk"> <br>
이름 <input type="text" name = "name"> <br>
닉네임 <input type="text" name = "nickname" value=<%= nickname %> readonly> <br>
전화번호 <input type="text" name = "phone"> <br>
성별<select class="form-select" name="gender" aria-label="Default select example">
	<%if(gender.equals("male")){
		%>
	<option value="male">남성</option>
	  <%}else{ %>
	  <option value="female">여성</option>
	  <%} %>
	</select><br>
이미지 <input type="file" name="image"><hr>
<button>회원 가입</button>
</form>


</body>
</html>
