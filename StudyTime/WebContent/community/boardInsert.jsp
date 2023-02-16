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
<title>메모 작성</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">

<body class="text-center bg-info">
  <%@ include file="/includes/header.jsp"%>
       <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
  



  
  <main class="form-signin w-100 m-auto">
  <form action="feedCheck.jsp" method="post">

<div class="py-5 text-center">
      
      <h2>　</h2>
      <img class="d-block mx-auto mb-4" src="apple.png" alt="" width="100" height="100">
           <h1>My MEMO</h1>
         </div>


<input type="hidden" name="id" value="<%=sid%>">

      
      <div class="container">
      <div class="col">
      <textarea id="summernote" name="content" class="mtop-10"></textarea>
      </div>
      <br>
      <div class="col">
 <button class="w-100 btn btn-lg btn-primary" type="submit">업로드</button>
 </div>
 
 <div class="py-5 text-center">
 </div>
      </div>
      
</form>
</main>
      <%@ include file="/includes/footer.jsp"%>

</body>
    <script>
      $('#summernote').summernote({
    	maximumImageFileSize: '1048576',
        placeholder: 'My MEMO',
        tabsize: 2,
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
    </script>
</html>