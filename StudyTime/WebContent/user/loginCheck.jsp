<!-- ---------------------------------------------------------->
<!-- 최초작성자 : 권두현(secure3141@naver.com) -->
<!-- 최초작성일 : 2023/02/15 -->

<!-- 버전 기록 : ver1(시작 23/02/15) -->
<!-- ---------------------------------------------------------->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.*" %>
<%@ include file="/includes/header.jsp" %>
<script>
$('#home').hide();
</script>

<%
    String userId = request.getParameter("userId");
    String password = request.getParameter("password");
        
        
        
    int result = UserDAO.login(userId, password);
        
    if(result ==0){        // 로그인 성공 -> 세션 생성 후 메인으로 이동
    	session.setAttribute("sid", userId); %>
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">로그인 성공</h1> 
        <button type="button" class="btn-close" onclick="location.href='/main.jsp'" aria-label="Close"></button>
      </div>  
      <div class="modal-body">
      <%= userId %>님 환영합니다!
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
<%         
        response.sendRedirect("/main.jsp"); 
    }    else if(result ==1){    //DB에 정보가 없음 -> 회원 가입으로 이동 %>
         <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">아이디가 존재하지 않습니다.</h1> 
        <button type="button" class="btn-close" onclick="location.href='/main.jsp'" aria-label="Close"></button>
      </div>  
      <div class="modal-body">
      회원가입 후 재로그인 해주시기 바랍니다.
      </div>
      <div class="modal-footer">
      
       <button onclick="history.back()" class="btn btn-secondary">이전으로</button>
       <button onclick="location.href='/user/join.jsp'" class="btn btn-primary">회원가입</button>
      </div>
    </div>
  </div>
</div>

<script>
$(function(){
	$("#exampleModal").modal("show");
});
</script>
<%    }    else{        // 비번이 틀린 경우 다시 로그인 페이지로 이동  %>
         <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">비밀번호가 일치하지 않습니다.</h1> 
        <button type="button" class="btn-close" onclick="location.href='/user/login.jsp'" aria-label="Close"></button>
      </div>  
      <div class="modal-body">
      비밀번호 확인 후 다시 시도 해주시기 바랍니다.
      </div>
      <div class="modal-footer">
       <button onclick="location.href='/user/login.jsp'" class="btn btn-primary">로그인</button>
      </div>
    </div>
  </div>
</div>

<script>
$(function(){
	$("#exampleModal").modal("show");
});
</script>
<%   }
%>