<!-- -------------------------------------------------------- -->
<!-- 최초작성자 : 김도영(difbfl4750@naver.com) -->
<!-- 최초작성일 : 2023/02/15 -->

<!-- 버전 기록 : ver1(시작 23/02/15) -->
<!-- -------------------------------------------------------- -->

<%@page import="jdbc.*"%>
<%@page import="java.util.*"%>
<%@page import="jdbc.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
</head>
 <body class="text-center">
 <%@ include file="../includes/header.jsp"%>
  <header class="bgimg w3-display-container w3-grayscale-min" style="height: 80%" id="home">
 <img src="../images/스포츠이미지.jpg"  width="100%" height="90%"> 
  <div class="w3-display-bottomleft w3-center w3-padding-large w3-hide-small">
  </div>
  <div class="w3-display-middle w3-center">
    <span class="w3-text-white text-light" style="font-size:90px">DaDaMall</span>
  </div>
  <div class="w3-display-bottomright w3-center w3-padding-large">
  </div>
</header>
    <div class="col-md-6 px-0">
      <h1 class="display-4 fst-italic" style="padding-right: 220px;">회원목록</h1>
     </div>
		    <hr class="featurette-divider">
		    	<br>
	<br>
	<br>

  

<main class="form-signin w-100 m-auto">


   <h2><b> 정회원 리스트 </b></h2>
     <br><br>
<table class="table table-hover" style="width: 60%; margin-left: auto; margin-right: auto;">
   <thead>
   <tr>
    <th scope="col"><h5><b>아이디</b></h5></th>
    <th scope="col"><h5><b>이름</b></h5></th>
    <th scope="col"><h5><b>가입일자</b></h5></th>
    <th><h5><b>회원등급</b></h5></th>
    <th></th>
    </tr>
  </thead>
   <tbody class="table table-hover" id="ajaxTable">
  


    </tbody>
    </table>

    
 
</main>

<main class="form-signin w-100 m-auto" style="padding-top: 200px; padding-bottom: 200px;">


   <h2><b> 준회원 리스트 </b></h2>
     <br><br>
<table class="table table-hover" style="width: 60%; margin-left: auto; margin-right: auto;">
   <thead>
   <tr>
    <th scope="col"><h5><b>아이디</b></h5></th>
    <th scope="col"><h5><b>이름</b></h5></th>
    <th scope="col"><h5><b>가입일자</b></h5></th>
    <th><h5><b>회원가입</b></h5></th>
    <th></th>
    </tr>
  </thead>
   <tbody class="table table-hover" id="ajaxTable2">
  


    </tbody>
    </table>

    
 
</main>
    
    
 

<%@ include file="../includes/footer.jsp"%>
</body>
  <script>
  
  function searchFunction() {
	
	  $.ajax({
		type:'post',
		url:'userCheckAJAX.jsp',
		datatype : 'json',
		success:function(result){
			var str = result.split("__TEMP__");
			$("#ajaxTable").html(str[0]);
			$("#ajaxTable2").html(str[1]);
			
			
		}
	  
	  });
	  
}

  
  
  
  window.onload = function() {
	searchFunction();
}
  
  $(document).on('click', '.regBtn', function(event) {
	  $.ajax({
			type:'post',
			url:'tempCheckAJAX.jsp?check=승인&id=' + document.getElementById("tempId").innerText,
			success:function(result){
				searchFunction();
			}
		  
		  });
	});
  
  
  $(document).on('click', '.delBtn', function(event) {
	  $.ajax({
			type:'post',
			url:'tempCheckAJAX.jsp?check=거부&id=' + document.getElementById("tempId").innerText,
			success:function(result){
				searchFunction();
			}
		  
		  });
	});
  </script>
</html>