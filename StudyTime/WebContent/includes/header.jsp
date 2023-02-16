<!-- -------------------------------------------------------- -->
<!-- 최초작성자 : 김도영(difbfl4750@naver.com) -->
<!-- 최초작성일 : 2023/02/15 -->

<!-- 버전 기록 : ver1(시작 23/02/15) -->
<!-- -------------------------------------------------------- -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.security.*, java.io.*, java.net.*" %>
<%@page import="jdbc.*"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Amatic+SC">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<head>
    <link rel="shortcut icon" href="../images/android-icon-48x48.png" type="image/x-icon">
  <link rel="icon" href="../images/android-icon-48x48.png" type="image/x-icon">
</head>
<% String sid = (String) session.getAttribute("id"); %>
    <style>
    
    #STATICMENU { margin: 0pt; padding: 0pt; position: absolute; z-index: 1; right: 0px; top: 0px;}
    
    @font-face{
  font-family:'bitbit';
  src:url('//cdn.df.nexon.com/img/common/font/DNFBitBit-Regular.woff'),url('//cdn.df.nexon.com/img/common/font/DNFBitBit-Regular.woff2') ;
}

	html,
	body {
	  height: 100%;
	  font-family: 'bitbit';
	}
	
    .box {
    width: 150px;
    height: 150px; 
    border-radius: 70%;
    overflow: hidden;
}
    
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
    </style>




  
         <div class="container">
    <header class="d-flex flex-wrap justify-content-center py-3 h3">
    
      <a href="/main.jsp" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
<!--         <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"/></svg> -->
        <span class="fs-4"><img class="box" style="width: 25px; height: 25px;" src="/images/study3.png"> STUDY TIME</span>
      </a>
      
                          <%if(sid == null) { %>
    <ul class="nav nav-pills">
<!--         <li class="nav-item"><a href="#" class="nav-link active" aria-current="page">Home</a></li> -->
        <li class="nav-item"><a href="../user/" class="nav-link text-dark">내 글쓰기</a></li>
        <li class="nav-item"><a href="/login.jsp" class="nav-link text-dark">로그인</a></li>
      </ul>
            <% }else if(sid != null && sid.equals("admin")){ %>
             <ul class="nav nav-pills">
<!--         <li class="nav-item"><a href="#" class="nav-link active" aria-current="page">Home</a></li> -->
        <li class="nav-item"><a href="../user/" class="nav-link">관리자목록</a></li>
        <li class="nav-item"><a href="#" class="nav-link">로그아웃</a></li>
      </ul>
                        <% }else{ %>
                                    <ul class="nav nav-pills">
<!--         <li class="nav-item"><a href="#" class="nav-link active" aria-current="page">Home</a></li> -->
        <li class="nav-item"><a href="../user/" class="nav-link">회원목록</a></li>
        <li class="nav-item"><a href="#" class="nav-link">로그아웃</a></li>
      </ul>
              <% } %>

     
    </header>
  </div>
       
     
<div class="card mb-4 rounded-4 shadow-sm bg-dark" id="STATICMENU" style="width: 80px; height: 300px; border: solid 1px black;">

    <ul class="nav text-centercard rounded-4" style="width: 80px;">
      <li>
        <a href="../main.jsp" class="nav-link py-3 border-bottom border-dark rounded-0" title="Home" data-bs-toggle="tooltip" data-bs-placement="right">
<img class="box" style="width: 50px; height: 50px; border: solid 1px black;" src="../images/DA.png">
      </a>
      </li>
      <li onclick="window.history.back()" class="bg-light"  style="width: 78px;">
        <a href="#" class="nav-link py-3 border-bottom border-dark rounded-0" title="뒤로가기" data-bs-toggle="tooltip" data-bs-placement="right">
<i class="w3-xlarge fa fa-arrow-left"></i>
     </a>
      </li>
      <li class="bg-light" onclick="window.location.reload()"  style="width: 78px;">
        <a href="#" class="nav-link py-3 border-bottom border-dark rounded-0" title="새로고침" data-bs-toggle="tooltip" data-bs-placement="right">
     <i class="w3-xlarge fa fa-refresh"></i>
     </a>
      </li>
      <li onclick="window.history.forward()" class="bg-light"  style="width: 78px;">
        <a href="#" class="nav-link py-3 border-bottom border-dark rounded-0" title="앞으로 가기" data-bs-toggle="tooltip" data-bs-placement="right">
     <i class="w3-xlarge fa fa-arrow-right"></i>
      </a>
      </li>
    </ul>
  </div>

     
<script type="text/javascript">
var stmnLEFT = 10; // 오른쪽 여백 
var stmnGAP1 = 0; // 위쪽 여백 
var stmnGAP2 = 150; // 스크롤시 브라우저 위쪽과 떨어지는 거리 
var stmnBASE = 150; // 스크롤 시작위치
var stmnActivateSpeed = 10; //스크롤을 인식하는 딜레이 (숫자가 클수록 느리게 인식)
var stmnScrollSpeed = 20; //스크롤 속도 (클수록 느림)var stmnTimer;

function RefreshStaticMenu() {
var stmnStartPoint, stmnEndPoint;
stmnStartPoint = parseInt(document.getElementById('STATICMENU').style.top, 10);
stmnEndPoint = Math.max(document.documentElement.scrollTop, document.body.scrollTop) + stmnGAP2;
if (stmnEndPoint < stmnGAP1) stmnEndPoint = stmnGAP1;
if (stmnStartPoint != stmnEndPoint) {
stmnScrollAmount = Math.ceil( Math.abs( stmnEndPoint - stmnStartPoint ) / 15 );
document.getElementById('STATICMENU').style.top = parseInt(document.getElementById('STATICMENU').style.top, 10) + ( ( stmnEndPoint<stmnStartPoint ) ? -stmnScrollAmount : stmnScrollAmount ) + 'px';
stmnRefreshTimer = stmnScrollSpeed;
}
stmnTimer = setTimeout("RefreshStaticMenu();", stmnActivateSpeed);
}
function InitializeStaticMenu() {
document.getElementById('STATICMENU').style.right = stmnLEFT + 'px'; //처음에 오른쪽에 위치. left로 바꿔도.
document.getElementById('STATICMENU').style.top = document.body.scrollTop + stmnBASE + 'px'; 
RefreshStaticMenu();
}


var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
(function(){
var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
s1.async=true;
s1.src='https://embed.tawk.to/63e4aa6f47425128791255e9/1goqjjhjv';
s1.charset='UTF-8';
s1.setAttribute('crossorigin','*');
s0.parentNode.insertBefore(s1,s0);
})();



</script>
<!--End of Tawk.to Script-->