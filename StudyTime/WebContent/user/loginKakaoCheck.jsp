<!-- ---------------------------------------------------------->
<!-- 최초작성자 : 권두현(secure3141@naver.com) -->
<!-- 최초작성일 : 2023/02/15 -->

<!-- 버전 기록 : ver1(시작 23/02/15) -->
<!-- ---------------------------------------------------------->
<%@page import="jdbc.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>STUDY TIME</title>
</head>
<body>
<%@ include file="/includes/header.jsp" %>


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
		session.setAttribute("sid", userId); %>
		
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">로그인 성공</h1> 
        <button type="button" class="btn-close" onclick="location.href='/main.jsp'" aria-label="Close"></button>
      </div>  
      <div class="modal-body">
      <%= nickname %>님 환영합니다!
      </div>
      <div class="modal-footer">
       <button onclick="location.href='/main.jsp'" class="btn btn-primary">메인 페이지</button>
      </div>
    </div>
  </div>
</div>

<script>
$(function(){
	$("#exampleModal").modal("show");
	
});
</script>	
<% 	} else { %>

	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">로그인 실패</h1> 
        <button type="button" class="btn-close" onclick="location.href='/user/login.jsp'" aria-label="Close"></button>
      </div>  
      <div class="modal-body">
      카카오 로그인을 위해 회원가입 부탁드립니다!
      </div>
      <div class="modal-footer">
       <button type="button" class="btn btn-secondary" onclick="history.back()">이전으로</button>
       <button onclick="location.href='/user/joinkakao.jsp?nickname=' + 
       '<%= nickname %>' + '&userId=' + '<%=userId %>' + '&gender=' + '<%=gender %>'" class="btn btn-primary">카카오 회원가입</button>
      </div>
    </div>
  </div>
</div>

<script>
$(function(){
	$("#exampleModal").modal("show");
	
});
</script>
<% 	}	%>
<script>
$('#home').hide();
</script>

</body>
</html>