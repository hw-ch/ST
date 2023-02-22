<!-- -------------------------------------------------------- -->
<!-- 최초작성자 : 김도영(difbfl4750@naver.com) -->
<!-- 최초작성일 : 2023/02/15 -->

<!-- 버전 기록 : ver1(시작 23/02/15) -->
<!-- -------------------------------------------------------- -->
<%@page import="jdbc.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ include file="/includes/header.jsp"%>

<!DOCTYPE html>
<<script type="text/javascript">
$("#home").hide();
</script>
<%
	request.setCharacterEncoding("UTF-8");
	
	String userId = request.getParameter("userId");
	String password = request.getParameter("password");
	StudyJoinDTO check = StudyJoinDAO.checkManager(userId);
	int result = UserDAO.login(userId, password);
	
	
	if(result == 0 || sid.equals("admin")) {
		


		

		
		if(StudyJoinDAO.checkManager(userId) != null && check.getApprove().equals("그룹장")){
			StudyDAO.dropout(userId);
			UserDAO.dropout(userId);

		}else{
			
		ArrayList<String> sNos = StudyJoinDAO.getAllsNo(userId);
		UserDAO.dropout(userId);
			for(String sNo : sNos){
				StudyDAO.cntUpdate(sNo);
			}
		
		}
		
		session.invalidate();
%>
		<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">STUDY TIME</h1>
		        <button type="button" class="btn-close"
		        
		        
		        <%if(!sid.equals("admin")){ %>onclick="location.href='/main.jsp'"<%}else{%>onclick="location.href='/admin/userManage.jsp'"<%} %>
		        
		          data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
			
			<div class="modal-body"><%if(!sid.equals("admin")){ %>회원탈퇴가 완료되었습니다.<%}else{%>회원삭제가 완료되었습니다.<%} %>
			
			
			
			</div>
			
			
			<div class="modal-footer">
		        <button type="button" class="btn btn-secondary"
		        <%if(!sid.equals("admin")){ %>onclick="location.href='/main.jsp'"<%}else{%>onclick="location.href='/admin/userManage.jsp'"<%} %>
		         data-bs-dismiss="modal">확인</button>
		      </div>
		    </div>
		  </div>
		</div>

		<script>
			$(function() {
				$("#exampleModal1").modal("show");
			});
		</script><%
		
	}else{
		%>
		<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">STUDY TIME</h1>
		        <button type="button" class="btn-close" onclick="history.back()" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		   아이디 또는 비밀번호가 일치하지 않습니다.
		      </div>
		      <div class="modal-footer">
		     <button type="button" class="btn btn-secondary" onclick="history.back()" data-bs-dismiss="modal">확인</button>		      </div>
		    </div>
		  </div>
		</div>

		<script>
			$(function() {
				$("#exampleModal2").modal("show");
			});
		</script><%
	}
	
	
%>