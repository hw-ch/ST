<%@page import="jdbc.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/includes/header.jsp" %>  
<%
	request.setCharacterEncoding("UTF-8");
	
	String userId = request.getParameter("userId");
	String currPw = request.getParameter("currPw");
	String newPw = request.getParameter("newPw");
	
	int result = UserDAO.pwModify(userId, currPw, newPw);
	
	if(result == 1){ %>
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">비밀번호 변경</h1>
        <button type="button" class="btn-close" onclick="location.href='/user/login.jsp'" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        비밀번호 변경이 완료되었습니다.<br>
        로그인 후 이용해주세요.
      </div>
      <div class="modal-footer">
      <button type="button" class="btn btn-secondary" onclick="history.back()">이전으로</button>
       <button onclick="location.href='login.jsp'" class="btn btn-primary">로그인 페이지</button>
      </div>
    </div>
  </div>
</div>
	
<script>
$(function(){
	$("#exampleModal").modal("show");
	
});
</script>
<% 	} else{ %>
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">비밀번호 변경</h1>
        <button type="button" class="btn-close" onclick="location.href='/user/pwModify.jsp'" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        아이디와 비밀번호가 일치하지 않습니다.<br>
        확인 후 다시 시도해주세요.
      </div>
      <div class="modal-footer">
      <button type="button" class="btn btn-secondary" onclick="history.back()">이전으로</button>
       <button onclick="location.href='login.jsp'" class="btn btn-primary">로그인 페이지</button>
      </div>
    </div>
  </div>
</div>
	
<script>
$(function(){
	$("#exampleModal").modal("show");
	
});
</script>
<% 	}
%>
<script>
$('#home').hide();
</script>