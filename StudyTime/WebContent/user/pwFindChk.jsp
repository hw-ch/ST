<%@page import="smtp.PasswordMail"%>
<%@page import="jdbc.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/includes/header.jsp" %>    
<%
	request.setCharacterEncoding("UTF-8");

	String userId = request.getParameter("userId");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String password = UserDAO.pwFind(userId, name, phone);
	
	if(password != null){	
		PasswordMail.sending(userId, name, phone); %>
		<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">비밀번호 찾기</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        이메일을 확인해주세요.
      </div>
      <div class="modal-footer">
      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
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
<% 	}	else { %>
	<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">비밀번호 찾기</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        회원정보가 일치하지 않습니다. 다시 확인해주세요.
      </div>
      <div class="modal-footer">
      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
       <button onclick="location.href='pwFind.jsp'" class="btn btn-primary">비밀번호 찾기</button>
      </div>
    </div>
  </div>
</div>
	
<script>
$(function(){
	$("#exampleModal").modal("show");
	
});
</script>	
<% }
%>