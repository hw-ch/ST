<!-- -------------------------------------------------------- -->
<!-- 최초작성자 : 김도영(difbfl4750@naver.com) -->
<!-- 최초작성일 : 2023/02/15 -->

<!-- 버전 기록 : ver1(시작 23/02/15) -->
<!-- -------------------------------------------------------- -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="jdbc.*, java.util.*"%>
<%@page
	import="com.oreilly.servlet.MultipartRequest,
    		com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">	
<title>STUDY TIME</title>
</head>
<body>
	<!-- 화면 상단 header -------------------------------------------- -->
	<%@ include file="/includes/header.jsp"%>

<script>
$('#Home').hide();
</script>
<%
String uploadPath = application.getInitParameter("uploadPath"); //파일 업로드 폴더명
String savePath = application.getRealPath(uploadPath); //실제 업로드 폴더 경로
int maxSize = 1024 * 1024 * 5; //최대 업로드 크기 5MB
String encType = "UTF-8";


MultipartRequest multiReq = new MultipartRequest(request, savePath, maxSize, encType, new DefaultFileRenamePolicy());
%>

<%
	//0.한글 인코딩 처리
	request.setCharacterEncoding("UTF-8");						
	response.setContentType("text/html; charset=UTF-8");
	
	String userId = multiReq.getParameter("userId");
	String nickName = multiReq.getParameter("nickName");
	String name = multiReq.getParameter("name");
	String gender = multiReq.getParameter("gender");
	String phone = multiReq.getParameter("phone");
	String image = multiReq.getFilesystemName("image");
	
	



	if( UserDAO.update(userId, nickName, name, gender, image, phone, sid) == true ) {
		
		%>
		<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">STUDY TIME</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		   회원정보 수정완료.
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" onclick="location.href = '/admin/memberInfo.jsp'" data-bs-dismiss="modal">확인</button>
		      </div>
		    </div>
		  </div>
		</div>

		<script>
			$(function() {
				$("#exampleModal1").modal("show");
			});
		</script><%
	}else { //그렇지 않으면
	
		%>
		<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">STUDY TIME</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		   정확한 정보를 입력해주세요.
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" onclick="history.back()" data-bs-dismiss="modal">이전으로</button>
		      </div>
		    </div>
		  </div>
		</div>

		<script>
			$(function() {
				$("#exampleModal1").modal("show");
			});
		</script><% } %>	

 %>





    