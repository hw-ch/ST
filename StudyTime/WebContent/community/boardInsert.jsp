<!-- -------------------------------------------------------- -->
<!-- 최초작성자 : 김도영(difbfl4750@naver.com) -->
<!-- 최초작성일 : 2023/02/15 -->

<!-- 버전 기록 : ver1(시작 23/02/15) -->
<!-- -------------------------------------------------------- -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Study Time</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">

<body class="text-center">
  <%@ include file="/includes/header.jsp"%>
       <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
  



  
  <main class="form-signin w-100 m-auto" style="padding-top: 100px; padding-bottom: 100px; padding-left: 400px;">
  <form action="boardInsertCheck.jsp" method="post">

      
<%

UserDTO userInfo = UserDAO.getOneList(sid);


%>

<input type="hidden" name="userId" value="<%=sid%>">


				<div class="form-group row pb-3">
				<label class="col-sm-2 h3">작성자</label>
				<div class="col-sm-3">
					<input type="text" value="<%=user.getNickName() %>" readonly="readonly" name="nickName" id="ide"
						class="form-control" required>
				</div>
				<span style="color: red;" id="idChk"></span>

			</div>
					<div class="form-group row pb-3">
				<label class="col-sm-2 h3">제목</label>
				<div class="col-sm-3">
					<input type="text" name="subject" class="form-control" required>
				</div>
			</div>
      
      					<div class="form-group row pb-3">
				<label class="col-sm-2 h3">내용</label>
				<div class="col-sm-3">
			      <div class="col">
      <textarea id="summernote" name="content" class="mtop-10"></textarea>
      </div>				</div>
			</div>
			<div class="form-group row" style="padding-right: 200px; padding-top: 100px;">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="button" onclick="history.back()" value="이전으로"
						class="btn btn-lg btn-secondary backBtn" style="margin-right: 10px;"> 
						 <input type="submit" value="등록" class="btn btn-lg btn-primary regBtn">
				</div>
			</div>
		</form>
</main>

</body>
    <script>
    
	$('#pageTitle').text("글쓰기")
	

    
	$('#summernote').summernote({
    	maximumImageFileSize: '1048576',
        placeholder: '내용',
        tabsize: 2,
        width: 600,
        height: 300,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture', 'video']],
          ['view', ['fullscreen', 'codeview', 'help']]
        ]
      });
	
	$('#summernote').summernote('justifyLeft');
    </script>
</html>