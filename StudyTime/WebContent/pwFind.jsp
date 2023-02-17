<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스타 : 비밀번호 찾기</title>
</head>
<body>
<%@ include file="/includes/header.jsp" %>

<form action="pwFindChk.jsp">
<input type="email" name="userId" placeholder="아이디" required>
<input type="text" name="name" placeholder="이름" required>
<input type="text" name="phone" placeholder="휴대폰번호" required>
<button>비밀번호 찾기</button>
</form>
</body>
</html>