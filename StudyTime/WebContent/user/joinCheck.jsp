<!-- ---------------------------------------------------------->
<!-- 최초작성자 : 권두현(secure3141@naver.com) -->
<!-- 최초작성일 : 2023/02/15 -->

<!-- 버전 기록 : ver1(시작 23/02/15) -->
<!-- ---------------------------------------------------------->
<%@page import="smtp.SendMail"%>
<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.oreilly.servlet.MultipartRequest,
			com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ include file="/includes/header.jsp" %>
<%
	String uploadPath = application.getInitParameter("uploadPath");// 파일 업로드 폴더명 
	String savePath = application.getRealPath(uploadPath);// 실제 업로드 폴더 경로
	int maxSize = 1024 * 1024 * 5;	// 최대 업로드 크기 5MB
	String encType = "UTF-8";
	
	MultipartRequest multiReq = 
			new MultipartRequest(request, savePath, maxSize, encType, 
										new DefaultFileRenamePolicy());
	
	request.setCharacterEncoding("UTF-8");

	String id = multiReq.getParameter("userId");
	String pw = multiReq.getParameter("password");
	String name = multiReq.getParameter("name");
	String nickname = multiReq.getParameter("nickname");
	String gender = multiReq.getParameter("gender");
	String phone = multiReq.getParameter("phone");
	
	String userFileName = multiReq.getFilesystemName("image");	//이미지
	
	if(UserDAO.exist(id)){ %>
		<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">이미 존재하는 회원입니다.</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        다른 아이디를 사용하여 가입해주세요.
      </div>
      <div class="modal-footer">
        <button onclick="location.href='/user/join.jsp'" class="btn btn-primary">재가입</button>
      </div>
    </div>
  </div>
</div>
	
	
<script>
$(function(){
	$("#exampleModal").modal("show");
	
});
</script>
<% 	} else{
	
	boolean result = UserDAO.join(id, pw, name, nickname, gender, phone, userFileName);
	
	if(result == true){
		SendMail.sending(id, name);	//메일 보내기 %>
		<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">회원가입 성공</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <%= name %>님 환영합니다.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button onclick="location.href='/user/login.jsp'" class="btn btn-primary">로그인 페이지</button>
      </div>
    </div>
  </div>
</div>
	
<script>
$(function(){
	$("#exampleModal").modal("show");
	
});
</script>	
<% 	}}	
%>	
