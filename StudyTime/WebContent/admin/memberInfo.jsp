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
	
	
	
<%
String userId = request.getParameter("userId");
UserDTO userInfo = UserDAO.getOneList(sid);
%>

	<div class="container h4" style="padding-top: 200px; padding-left: 200px;">

		<div class="row" align="center">

			

			<div class="col-md-4">

			
				<img src="/upload/<%=userInfo.getImage() %>"
					style="width: 200px; height: 300px;">
			</div>


			<div class="col-md-8" align="left">
				<form action="memberModifyCheck.jsp" method="post" id="frm" name="joinFrm"
					class="form-horizontal" enctype="multipart/form-data">
					
					<input type="hidden" name="cmd" value="mod">
					<div class="form-group row pb-3">
				<label class="col-sm-2 pt-2">아이디</label>
				<div class="col-sm-4">
					<input type="email" value="<%=userInfo.getUserId() %>" style="border: none;" readonly="readonly" name="userid" id="ide"
						class="form-control" required>
				</div>
				<span style="color: red;" id="idChk"></span>

			</div>
					<div class="form-group row pb-3">
				<label class="col-sm-2 pt-2">닉네임</label>
				<div class="col-sm-4">
					<input type="text" name="nickN	ame" value="<%=userInfo.getNickName() %>" style="border: none;" readonly="readonly" class="form-control" required>
				</div>
			</div>
					<div class="form-group row pb-3">
				<label class="col-sm-2 pt-2">이름</label>
				<div class="col-sm-4">
					<input type="text" name="name" value="<%=userInfo.getName() %>" style="border: none;" readonly="readonly" class="form-control" required>
				</div>
			</div>
								<div class="form-group row pb-3">
				<label class="col-sm-2 pt-2">가입일자</label>
				<div class="col-sm-4 pt-1">
					<input type="text" name="joinDate" class="form-control" style="border: none;" readonly="readonly" value="<%=userInfo.getTs() %>">
				</div>
			</div>
			<div class="form-group row">
			<% String[] phone = userInfo.getPhone().split("-"); %>
				<label class="col-sm-2 pt-2">연락처</label>
				<div class="col-sm-5 pt-1">
					<input type="text" name="phone1" value="<%=userInfo.getPhone() %>" style="border: none;" readonly="readonly" id="phone1" class="form-control" required>
				</div>
			</div>
								<div class="form-group row">
				<label class="col-sm-2 pt-3">성별</label>
				<div class="col-sm-5 pt-3">
				<input type="text" name="phone1" value="<%if(userInfo.getGender().equals("female")){%>여성<%}else{ %>남성<%} %>" style="border: none;" readonly="readonly" id="phone1" class="form-control" required>


						</div>
			</div>







					<div class="form-group row" style="padding-top: 100px; padding-right: 100px;">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="button" onclick="history.back()" value="이전으로"
								class="btn btn-lg btn-secondary backBtn"> 
								<input type="button" onclick="location.href='/admin/memberModify.jsp'" value="수정" class="btn btn-lg btn-warning regBtn">
<%if(sid.equals("admin")){ %>
<a class="btn btn-lg btn-danger removeBtn">회원삭제</a>
<%}else{%>
<a href="/admin/signout.jsp" class="btn btn-lg btn-danger">회원탈퇴</a>
<%} %>
						</div>
					</div>

				</form>
				<form action="signoutCheck.jsp" method="post" id="delForm">
<input type="hidden" name="userId" value="<%=userId%>">
</form>
			</div>




		</div>








	</div>


	<br>
	<br>
	<br>
	<br>

	<!-- 화면 하단 footer --------------------------------------- -->

	<script>
	$('#pageTitle').text("회원정보")
	
	
	$('.delRegBtn').click(function() {
	var phone1 = $('#phone1').val().trim();
	var phone2 = $('#phone2').val().trim();
	var phone3 = $('#phone3').val().trim();
	$('#phone').val(phone1 + "-" + phone2 + "-" + phone3);
})
	
	//아이디와 비밀번호 확인 여부
	idChk = pwChk = false;
	
	//아이디 중복 확인 -------------------------------------
// 	$('#ide').keyup(function() {
// 		var id = $(this).val();
// 		var idChkMsg = $('#idChk');
		
// 		if(id.length < 5 || id.length > 10) {	//아이디 입력 길이 확인
// 			idChkMsg.text('아이디는 5 ~ 10자로 입력해주세요.');
// 		} else {	//아이디 중복 확인 처리
// 			idChkMsg.text('');

// $.post('idChkProc.jsp', //요청 url
// 			{"id" : id }, //전송 데이터
// 			function(result) { //callback 함수
// 				if(result.trim() == 'O'){
// 				idChkMsg.text('사용 가능한 아이디입니다.');
// 				idChk = true;
// 				} else {
// 					idChkMsg.text('이미 사용 중인 아이디입니다.');
// 					idChk = false;
// 				}
			
				
		
// 	});
	//END 아이디 중복 확인 -----------------------------------------------
	
	++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


		// 아이디, 비밀번호 체크
		var txtPtn = /[\w|가-힣|`~@!#%<>\*\$]{5,10}/;
		//영문자, 숫자, _, 한글, 특수문자 5~10
		var numPtn = /[0-9]/; //숫자
		var engPtn = /[a-zA-Z]/; //영문자		
		var korPtn = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; //한글	
		var spPtn = /[`~@!#%<>\*\$]/; //특수 문자
		
		
		$('.regBtn').click(function() {
			var email1 = $('#email1').val().trim();
			var email2 = $('#email2').val().trim();
			$('#email').val(email1 + '@' + email2);
			console.log($('#email').val());
		});

		


		

		

	</script>
		 <div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">STUDY TIME</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		   정말 삭제하시겠습니까?
		      </div>
		      <div class="modal-footer">
		     <button type="button" class="btn btn-info" onclick="$('#delForm').submit()" data-bs-dismiss="modal">확인</button>		      </div>
		    </div>
		  </div>
		</div>


	<script>
	$('.removeBtn').click(function() {
		$("#exampleModal2").modal("show");
	});
	</script>
		 
</body>
</html>
