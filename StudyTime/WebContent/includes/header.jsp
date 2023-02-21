

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
 <link rel="icon" href="favicon.ico" type="image/x-icon" sizes="16x16">
</head>
<% String sid = (String) session.getAttribute("sid");
UserDTO user = new UserDTO("","","","","","","","");
if(sid != null) {
	user = UserDAO.getOneList(sid);
}
%>
    <style>
    
    #STATICMENU { margin: 0pt; padding: 0pt; position: absolute; z-index: 1; right: 0px; top: 0px;}
    
    
    @font-face {
    font-family: 'PyeongChangPeace-Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-02@1.0/PyeongChangPeace-Bold.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}
    
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




  
         <div class="container-fluid">
    <header class="d-flex flex-wrap justify-content-center py-3 h2">
    
      <a href="/main.jsp" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
        <span class="fs-2 h2" style="padding-top: 10px; padding-left: 100px;"><img class="box" style="width: 60px; height: 60px;" src="/images/study3.png"> STUDY TIME</span>
      </a>
                        
 <%if(sid == null) { %>
    <ul class="nav nav-pills" style="padding-top: 10px; padding-right: 100px;">
        <li class="nav-item" style="padding-right: 50px;"><a href="/user/login.jsp" class="nav-link text-dark">새 글 쓰기</a></li>
        <li class="nav-item"><a href="/user/login.jsp" class="nav-link text-dark">로그인</a></li>
     	 <li class="nav-item"><a href="/user/join.jsp" class="nav-link text-dark">회원가입</a></li>
      </ul>
            <% }else if(sid != null && sid.equals("admin")){ %>
    <ul class="nav nav-pills" style="padding-top: 10px;">
<!--         <li class="nav-item"><a href="#" class="nav-link active" aria-current="page">Home</a></li> -->
        <li class="nav-item" style="padding-right: 50px;"><a href="/notice/noticeView.jsp" class="nav-link text-dark">공지사항</a></li>

     	
      </ul>
      
       <div class="dropdown" style="padding-right: 200px; ">
          <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
  <img src="/upload/<%=user.getImage() %>" alt="mdo" width="60px" height="60px" class="rounded-circle">
          </a>
          <ul class="dropdown-menu text-small">
				<li><a class="dropdown-item h5" href="/user/myInfo.jsp">내 정보</a></li>
				<li><a class="dropdown-item h5" href="/user/manage.jsp">회원관리</a></li>
				<li><a class="dropdown-item h5" href="/study/studyApply.jsp">스터디관리</a></li>
				<li><hr class="dropdown-divider"></li>
				<li><a class="dropdown-item h5" href="/user/logout.jsp">로그아웃</a></li>
			</ul>
        </div>
                        <%
                        	} else {
                        %>
    <ul class="nav nav-pills" style="padding-top: 10px;">
<!--         <li class="nav-item"><a href="#" class="nav-link active" aria-current="page">Home</a></li> -->
        <li class="nav-item" style="padding-right: 50px;"><a href="/study/studyAdd.jsp" class="nav-link text-dark">새 글 쓰기</a></li>
        <li class="nav-item" style="padding-right: 50px;"><a href="/community/boardList.jsp" class="nav-link text-dark">자유게시판</a></li>
     	<li class="nav-item" style="padding-right: 50px;"><a href="/notice/noticeView.jsp" class="nav-link text-dark">공지사항</a></li>
      </ul>
      
       <div class="dropdown" style="padding-right: 200px; ">
          <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
   <img src="/upload/<%=user.getImage() %>" alt="mdo" width="60px" height="60px" class="rounded-circle">
          </a>
          <ul class="dropdown-menu text-small">
				<li><a class="dropdown-item h5" href="/user/myInfo.jsp">내 정보</a></li>
				<li><a class="dropdown-item h5" href="/user/myStudy.jsp">내 참여스터디</a></li>
				<%
				StudyJoinDTO check = StudyJoinDAO.checkManager(sid);
				
				
				
				if(check.getApprove().equals("그룹장")) { %>
				<li><a class="dropdown-item h5" href="/study/studyInfo.jsp">스터디관리</a></li>
				<%}else{ %>
				
				<%} %>
				<li><hr class="dropdown-divider"></li>
				<li><a class="dropdown-item h5" href="/user/logout.jsp">로그아웃</a></li>
			</ul>
        </div>
              <% } %>
     
    </header>
  </div>
      
      <fieldset id="headerImage">
	<header class="bgimg w3-display-container w3-grayscale-min"
		style="height: 80%;" id="home">
		<img src="../images/starImage.png" width="100%" height="500px;">
		<div
			class="w3-display-bottomleft w3-center w3-padding-large w3-hide-small">
		</div>
		<div class="w3-display-middle w3-center">
			<span class="w3-text-white text-light" style="font-size: 90px; font-family: 'PyeongChangPeace-Bold';">페이지 이름</span>
		</div>
		<div class="w3-display-bottomright w3-center w3-padding-large">
		</div>
	</header>



     </fieldset>
<!--Start of Tawk.to Script-->
<script type="text/javascript">
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