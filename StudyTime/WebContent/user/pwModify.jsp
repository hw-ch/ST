<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/includes/header.jsp" %>
<form action="pwModifyChk.jsp" method="post">
아이디 <input type="text" name="userId">
현재 비밀번호 <input type="password" name="currPw">
새 비밀번호 <input type="password" name="newPw">
<button>비밀번호 변경</button>
</form>
</body>
</html>