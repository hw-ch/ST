<!-- -------------------------------------------------------- -->
<!-- 최초작성자 : 김도영(difbfl4750@naver.com) -->
<!-- 최초작성일 : 2023/02/15 -->

<!-- 버전 기록 : ver1(시작 23/02/15) -->
<!-- -------------------------------------------------------- -->




<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*, java.security.*, java.io.*, java.net.*" %>
    <%@ page errorPage = "page_error_page.jsp" %>
    
<%@page import="jdbc.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>STUDY TIME</title>
<link href="carousel.css" rel="stylesheet">
</head>

<style>
#floatdiv {
position:fixed; _position:absolute; _z-index:-1;
width:170px;
overflow:hidden;
right:-30px;
bottom:15px;
background-color: transparent;
margin:0;
padding:0;
}

#floatdiv ul { list-style: none; }
#floatdiv li { margin-bottom: 2px; text-align: center; }
#floatdiv a { color: #5D5D5D; border: 0; text-decoration: none; display: block; }
#floatdiv .menu { background-color: #5D5D5D; color: #fff; }
#floatdiv .menu, #floatdiv .last { margin-bottom: 0px; }

</style>


  <body class="text-center">

  <%@ include file="/includes/header.jsp"%>
<main>

  <div id="myCarousel" class="carousel slide" data-bs-ride="carousel" style="">
    <div class="carousel-indicators">
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
     </div>
    <div class="carousel-inner">
      <div class="carousel-item active">
<img src="images/study1.png"  width="100%" height="100%"> 
        <div class="container">
          <div class="carousel-caption text-start">
                       </div>
        </div>
      </div>
      <div class="carousel-item">
      <img src="images/study2.png"  width="100%" height="100%"> 
              <div class="container">
          <div class="carousel-caption text-warning">
                     </div>
        </div>
      </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">

      <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">

      <span class="visually-hidden">Next</span>
    </button>
    </div>
    
    
    
   <div class="row featurette" style="padding-top: 100px;">
      <div class="col-md-7" style="padding-bottom: 10px;">
				<span class="h2 all"
					style="padding-right: 100px; padding-left: 50px; cursor: pointer;">전체
				</span><span class="h2 english"
					style="padding-right: 100px; cursor: pointer;">영어 </span><span
					class="h2 china" style="padding-right: 100px; cursor: pointer;">중국어
				</span><span class="h2 japan"
					style="padding-right: 100px; cursor: pointer;">일본어 </span><span
					class="h2 sport" style="padding-right: 100px; cursor: pointer;">운동/스포츠
				</span><span class="h2 IT"
					style="padding-right: 100px; cursor: pointer;"> IT </span>
			</div>
              <hr class="featurette-divider">
        <div id="category2" class="text-start" style="padding-left: 50px; width: 50%;">
        
</div>
      </div>
      <div class="col-md-5">

    </div>
    
    
    
  <div class="row" data-masonry='{"percentPosition": true }' style="padding-top: 200px;">
      <hr class="featurette-divider">
    <div class="col mb-4" style="height: 500px;">
       <div id="study" class="row row-cols-1 row-cols-md-3 mb-3 text-center"  style="height: 500px;">

    </div>
    </div>
  </div>
 
 
<div id="floatdiv">
 <a href="#"><img src="/images/top.png" class="box" style="border:3px solid black;"></a>
</div>




</main>
     
     <script type="text/javascript">
     
     $("#headerImage").hide();
     
     
     function searchFunction() {
   	
   	  $.ajax({
   		type:'post',
   		url:'studyCheckAJAX.jsp?category1=all',
   		datatype : 'json',
   		success:function(result){
			var str = result.split("__CATEGORY__");
			$("#study").html(str[0]);
			$("#category2").html(str[1]);
   			
   			
   		}
   	  
   	  });
   	  
   }

     $(document).on('click', '.all', function(event) {
      	  $.ajax({
         		type:'post',
         		url:'studyCheckAJAX.jsp?category1=all',
         		datatype : 'json',
         		success:function(result){
      			var str = result.split("__CATEGORY__");
      			$("#study").html(str[0]);
      			$("#category2").html(str[1]);
         			
         			
         		}
         	  
         	  });
   	});     
     
     $(document).on('click', '.english', function(event) {
      	  $.ajax({
         		type:'post',
         		url:'studyCheckAJAX.jsp?category1=영어',
         		datatype : 'json',
         		success:function(result){
      			var str = result.split("__CATEGORY__");
      			$("#study").html(str[0]);
      			$("#category2").html(str[1]);
         			
         			
         		}
         	  
         	  });
   	});
     
     $(document).on('click', '.japan', function(event) {
   	  $.ajax({
     		type:'post',
     		url:'studyCheckAJAX.jsp?category1=일본어',
     		datatype : 'json',
     		success:function(result){
  			var str = result.split("__CATEGORY__");
  			$("#study").html(str[0]);
  			$("#category2").html(str[1]);
     			
     			
     		}
     	  
     	  });
   	}); 
     
  $(document).on('click', '.china', function(event) {
   	  $.ajax({
   		type:'post',
   		url:'studyCheckAJAX.jsp?category1=중국어',
   		datatype : 'json',
   		success:function(result){
			var str = result.split("__CATEGORY__");
			$("#study").html(str[0]);
			$("#category2").html(str[1]);
   			
   			
   		}
   	  
   	  });
	});
  
  $(document).on('click', '.sport', function(event) {
   	  $.ajax({
   		type:'post',
   		url:'studyCheckAJAX.jsp?category1=운동/스포츠',
   		datatype : 'json',
   		success:function(result){
			var str = result.split("__CATEGORY__");
			$("#study").html(str[0]);
			$("#category2").html(str[1]);
   			
   			
   		}
   	  
   	  });
	});
     
  $(document).on('click', '.IT', function(event) {
   	  $.ajax({
   		type:'post',
   		url:'studyCheckAJAX.jsp?category1=IT',
   		datatype : 'json',
   		success:function(result){
			var str = result.split("__CATEGORY__");
			$("#study").html(str[0]);
			$("#category2").html(str[1]);
   			
   			
   		}
   	  
   	  });
	});
        
  $(document).on('click', '#category3', function(event) {
	  console.log(this)
   	  $.ajax({
   		type:'post',
   		url:'categoryCheckAJAX.jsp?category3=' + this.text,
   		datatype : 'json',
   		success:function(result){
			var str = result;
			$("#study").html(str);
			// ajax 중복 방지					
			if( window.ajaxCheck == 1 ) return false;
   			
   		}
   	  
   	  });
	});
  
     window.onload = function() {
   	searchFunction();
   }
     
     

     </script>
     
     
  </body>
</html>