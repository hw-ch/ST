<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*, java.security.*, java.io.*, java.net.*" %>
    <%@ page errorPage = "page_error_page.jsp" %>
    
<%-- <%@page import="jdbc.*"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DaDaMall</title>
<link href="carousel.css" rel="stylesheet">

</head>
  <body class="text-center">

  <%@ include file="/includes/header.jsp"%>
  
<!--     container 화면 전체를 차지 하지 않는 고정 크기 컨테이너,
    브라우저의 크기에 반응하여 자동으로 크기가 변동된다.
  
  shadow 입체감있게 그림자 효과 추가
  
  mx-auto m > 바깥여백, x > 가로로 auto > 화면 가운데 정렬
  
  p padding 안쪽 여백
  
  w 전체 너비  -->
  

<main>
<!-- <h1 class="h1 mb-3 fw-large" style="padding-top: 30px;"> DaDaMall </h1> -->

  <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-indicators">
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>
    <div class="carousel-inner">
      <div class="carousel-item active">
<img src="images/My project-1.png"  width="100%" height="10%"> 
        <div class="container">
          <div class="carousel-caption text-start">
                <p><a class="btn btn-lg btn-success" href="../product/productList.jsp">할인특가!</a></p>
          </div>
        </div>
      </div>
      <div class="carousel-item">
      <img src="images/My project-1.png"  width="100%" height="10%"> 
              <div class="container">
          <div class="carousel-caption text-warning">
            <h1>ADIDAS EVENT</h1>
            <p><a class="btn btn-lg btn-primary" href="../product/productList.jsp">더보기</a></p>
          </div>
        </div>
      </div>
      <div class="carousel-item">
       <img src="images/My project-1.png"  width="100%" height="10%"> 
        <div class="container">
          <div class="carousel-caption text-end">
            <h1>행사상품</h1><p><a class="btn btn-lg btn-primary" href="../product/productList.jsp">더보기</a></p>
          </div>
        </div>
      </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>
    </div>
    
<hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7">
        <h2 class="featurette-heading fw-normal lh-1"><span class="text-muted">헬스용품 이벤트 </span></h2>
        <p class="lead">특가할인</p>
        <p><a class="btn btn-lg btn-primary" href="../product/productList.jsp">더보기</a></p>

      </div>
      <div class="col-md-5">
       <img src="images/턱걸이밴드.png"  width="100%" height="100%"> 
      </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7 order-md-2">
        <h2 class="featurette-heading fw-normal lh-1"><span class="text-muted">턱걸이 용품 할인행사 </span></h2>
        <p class="lead">특가할인</p>
        <p><a class="btn btn-lg btn-primary" href="../product/productList.jsp">더보기</a></p>      </div>
      <div class="col-md-5 order-md-1">
       <img src="images/턱걸이밴드2.png"  width="100%" height="100%"> 
      </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7">
        <h2 class="featurette-heading fw-normal lh-1"><span class="text-muted">겨울스포츠 할인행사 </span></h2>
        <p class="lead">특가할인</p>
        <p><a class="btn btn-lg btn-primary" href="../product/productList.jsp">더보기</a></p>      </div>
        <div class="col-md-5">
       <img src="images/겨울스포츠광고.png"  width="100%" height="100%"> 
      </div>
    </div>

    <hr class="featurette-divider">

    <!-- /END THE FEATURETTES -->


</main>
     
     <script type="text/javascript">
     $("#STATICMENU").hide();
     </script>
  </body>
</html>