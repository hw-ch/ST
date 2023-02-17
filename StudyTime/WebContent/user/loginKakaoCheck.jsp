<%@page import="jdbc.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<br>

<%
	request.setCharacterEncoding("UTF-8");
	String nickname = request.getParameter("nickname");
	String userId = request.getParameter("userId");
	String gender = request.getParameter("gender");
	// 우리 DB에 해당 회원이 존재하는지 여부 확인
	// DB에 존재하면 --> (0) 세션 처리 (로그인 상태)
	// DB에 존재하지 않으면 회원 가입 페이지로 이동 가입 유도
	 int result = UserDAO.kakaoLogin(userId);
	if (result == 0) {
		out.print("로그인 성공");
	} else {
%>
	<script>
	alert('카카오 로그인을 위해 카카오 로그인을 위해 회원가입 부탁드립니다.')
	
//  	if(!check){
//  		return false;
//  	}
	
		</script>
	<script>
	location.href = 'joinkakao.jsp?nickname=' + '<%=nickname %>' + '&userId=' + '<%=userId %>' + '&gender=' + '<%=gender %>';
	</script>
<% 		
//	response.sendRedirect("joinkakao.jsp?nickname=" + java.net.URLEncoder.encode(nickname) + "&userId=" + userId + "&gender=" + gender);
		//java.net.URLEncoder.encode(mname) -- > mname을 한글로 인식
	}
%>

<%-- [  <%=sid %>  ] 님 로그인 성공하였습니다. --%>


</body>
</html>