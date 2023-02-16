<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>STUDY TIME</title>
<link href="/docs/5.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.2/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.2/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.2/assets/img/favicons/safari-pinned-tab.svg" color="#712cf9">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#712cf9">


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }
        <!-- Custom styles for this template -->
      .icon-list li::before {
		  display: block;
		  flex-shrink: 0;
		  width: 1.5em;
		  height: 1.5em;
		  margin-right: .5rem;
		  content: "";
		  background: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%23212529' viewBox='0 0 16 16'%3E%3Cpath d='M8 0a8 8 0 1 1 0 16A8 8 0 0 1 8 0zM4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z'/%3E%3C/svg%3E") no-repeat center center / 100% auto;
	}
    </style>

    
  	
 
    
</head>
<body>
	<%@ include file = "/includes/header.jsp" %>
	<div class="col-lg-8 mx-auto p-4 py-md-5">
 	<header class="d-flex align-items-center pb-3 mb-5 border-bottom">
      <img src="/images/favicon.ico" width="40" height="32" class="me-2"></img>
      <span class="fs-4">박지원(그룹장)</span>
  	</header>
  <main>
    <h1 class = "pb-3 mb-5">코딩테스트 스터디 모집중!!!</h1>
    
     <div class="row g-5">
      <div class="col-md-6">
        <h2>진행방식,시작예정,카테고리</h2>
        <p>등록(2),상세보기(2),이전으로(history.back()),수정(2),삭제(proc),참여신청(proc),지도api</p>
        <ul class="icon-list ps-0">
          <li class="d-flex align-items-start mb-1"><a href="https://github.com/twbs/bootstrap-npm-starter" rel="noopener" target="_blank">Bootstrap npm starter</a></li>
          <li class="text-muted d-flex align-items-start mb-1">Bootstrap Parcel starter (coming soon!)</li>
        </ul>
      </div>

      <div class="col-md-6">
        <h2>모집인원,예상기간,위치</h2>
        <p>Read more detailed instructions and documentation on using or contributing to Bootstrap.</p>
        <ul class="icon-list ps-0">
          <li class="d-flex align-items-start mb-1"><a href="/docs/5.2/getting-started/introduction/">Bootstrap quick start guide</a></li>
          <li class="d-flex align-items-start mb-1"><a href="/docs/5.2/getting-started/webpack/">Bootstrap Webpack guide</a></li>
          <li class="d-flex align-items-start mb-1"><a href="/docs/5.2/getting-started/parcel/">Bootstrap Parcel guide</a></li>
          <li class="d-flex align-items-start mb-1"><a href="/docs/5.2/getting-started/vite/">Bootstrap Vite guide</a></li>
          <li class="d-flex align-items-start mb-1"><a href="/docs/5.2/getting-started/contribute/">Contributing to Bootstrap</a></li>
        </ul>
      </div>
    </div>

    <div class="mb-5">
      <a href="/docs/5.2/examples/" class="btn btn-warning btn-lg px-4 text text-white">이전으로</a>
       <a href="/docs/5.2/examples/" class="btn btn-warning btn-lg px-4 text text-white">참여하기</a>
        <a href="/docs/5.2/examples/" class="btn btn-primary btn-lg px-4 text text-white">수정</a>
         <a href="/docs/5.2/examples/" class="btn btn-danger btn-lg px-4 text text-white">삭제</a>
    </div>

   

   <p class="fs-5 col-md-8">content ~~~~~~~~~~~~~~~~~~~~~~~~~~</p>
  </main>
  <footer class="pt-5 my-5 text-muted border-top">
    		이전으로 history.back()?=왼쪽,참여신청,수정,삭제버튼=오른쪽
  </footer>
</div>


    <script src="/docs/5.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	


</body>
</html>