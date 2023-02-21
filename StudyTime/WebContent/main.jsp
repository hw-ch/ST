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
  <body class="text-center">

  <%@ include file="/includes/header.jsp"%>
  <%= sid%>
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
       <span class="h2" style="padding-right: 100px; padding-left: 50px;">전체 </span><span class="h2" style="padding-right: 100px;">영어 </span><span class="h2" style="padding-right: 100px;">중국어 </span><span class="h2" style="padding-right: 100px;">일본어 </span><span class="h2" style="padding-right: 100px;">운동/스포츠 </span><span class="h2" style="padding-right: 100px;">	IT </span>
            </div>
              <hr class="featurette-divider">
        <div style="padding-right: 1550px;">
        
<%--         <% --%>
//         String category1 = 
<%--          CategoryDTO category = CategoryDAO.select(category1); %> --%>
        <a class="btn btn-lg  border-warning text-primary rounded-5" href="../product/productList.jsp">TOEIC</a>
         <a class="btn btn-lg border-warning text-primary rounded-5" href="../product/productList.jsp">TOEFL</a>
          <a class="btn btn-lg border-warning text-primary rounded-5" href="../product/productList.jsp">TOEIC</a></div>

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
 

</main>
     
     <script type="text/javascript">
     
     $("#headerImage").hide();
     
     
     function searchFunction() {
   	
   	  $.ajax({
   		type:'post',
   		url:'studyCheckAJAX.jsp',
   		datatype : 'json',
   		success:function(result){
			var str = result;
//    			var str = result.split("__TEMP__");
   			$("#study").html(str);
//    			$("#ajaxTable2").html(str[1]);
   			
   			
   		}
   	  
   	  });
   	  
   }

     
     
     
     window.onload = function() {
   	searchFunction();
   }
     
     $(document).on('click', '.regBtn', function(event) {
   	  $.ajax({
   			type:'post',
   			url:'categoryCheckAJAX.jsp?check=승인&id=' + document.getElementById("tempId").innerText,
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
     
     
  </body>
</html>