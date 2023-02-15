<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--  로그인에 성공한 사용잔 [ ]님 환영합니다. 출력
	 로그인을 하지 않은 사용자는 로그인한 회원만 접근 가능한 페이지입니다. -->
<% 
	String sid = (String)session.getAttribute("sid");
	if(sid != null || sid.length() != 0){
		out.print("[ " + sid + " ]"+ "님 환영합니다.");
	}	else{
		out.print("로그인한 회원만 접근 가능한 페이지입니다.");
	}

%>
	
</body>
</html>