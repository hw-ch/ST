<!-- -------------------------------------------------------- -->
<!-- 최초작성자 : 김도영(difbfl4750@naver.com) -->
<!-- 최초작성일 : 2023/02/15 -->

<!-- 버전 기록 : ver1(시작 23/02/15) -->
<!-- -------------------------------------------------------- -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="jdbc.*, java.util.*"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">	
<title>STUDY TIME</title>
</head>
<body>
	<!-- 화면 상단 header -------------------------------------------- -->
	<%@ include file="/includes/header.jsp"%>
	<br>
<div class="container pt-5">
		<form action="signoutCheck.jsp" method="post" id="delForm">
			<h1>탈퇴 안내</h1>
			<br>
			<h5 class="text-danger">※회원을 탈퇴하실 경우 사용하고 계신 아이디는 재사용 및 복구가
				불가능합니다!</h5>
			<br> <br>

			<h5>※탈퇴 후 회원정보 및 서비스 이용기록은 모두 삭제됩니다.</h5>
			<br>
			<table class="table">
				<tbody>
					<tr>
						<th scope="row" class="h4">게시물 기록</th>
						<td class="h4">커뮤니티, 글 목록 및 댓글 기록 삭제</td>
					</tr>
					<tr>
						<th scope="row" class="h4">설문조사</th>
						<td class="h4">설문조사 기록 및 게시물 삭제</td>
					</tr>
					<tr>
						<th scope="row" class="h4">스터디</th>
						<td class="h4">스터디 기록 및 게시물 삭제</td>
					</tr>
				</tbody>

			</table>
			<br> <br>
			<span class="h4">탈퇴아이디 확인</span>
			<table class="table" style="width: 300px; margin-top: 10px;">
				<thead>
					<tr>
						<th scope="col">아이디</th>
						<td scope="col"><input type="text" name="id" id="id"
						class="form-control" required></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row" style="width: 30%">비밀번호</th>
						<td><input type="password" name="password" id="password"
						class="form-control" required></td>
					</tr>
				</tbody>
			</table>
			<br> <br>



			<!-- 등록 취소 버튼 -->
			<div class="text-right">
			<input type="button" value="이전으로"
					onclick="history.back()" class="btn btn-secondary">
				<input type="button" value="탈퇴하기"
					class="btn btn-danger removeBtn">
					


			</div>


		</form>
	</div>
<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">DaDaMall</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		   정말 탈퇴하시겠습니까?
		      </div>
		      <div class="modal-footer">
		     <button type="button" class="btn btn-secondary" onclick="$('#delForm').submit()" data-bs-dismiss="modal">확인</button>		      </div>
		    </div>
		  </div>
		</div>

		<script>
			$(function() {
				
			});
		</script>

	<script>
	$('.removeBtn').click(function() {
		$("#exampleModal2").modal("show");
	});
	</script>


    <hr class="featurette-divider">

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	
	     <%@ include file="../includes/footer.jsp"%>
</body>


<script>
$('#pageTitle').text("회원탈퇴")

</script>




</html>