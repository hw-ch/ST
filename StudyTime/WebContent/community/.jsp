<%@page import="jdbc.BoardDAO"%>
<%@page import="smtp.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>

<%
	request.setCharacterEncoding("utf-8"); //한글 처리

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");

	// 이미 DB에 사용중인 아이디 인지 먼저 확인

	if((BoardDAO.inserttemp(id, password, name) == 1) ? true : false) {
		// 윗줄에서 DB에 성공적으로 회원 등록처리를 마치고 메일을 발송하자
		
		SendMail.sending(id, name);	//가입자에게 웰컴 메일 발송
		
	
		%>
		<!-- Modal -->
		<div class="modal fade" id="exampleModal2" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">회원 가입 신청완료</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        회원 가입 신청을 완료 하였습니다.<br>관리자의 확인 후 24시간 이내에 승인/거부 처리 됩니다.
		      </div>
		      <div class="modal-footer">
		        <button onclick="location.href='/main.jsp'" class="btn btn-primary">로그인 이동</button>
		      </div>
		    </div>
		  </div>
		</div>

		<script>
			$(function() {
				$("#exampleModal2").modal("show");
			});
		</script>
		
<%	
	}
%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
