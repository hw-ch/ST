<!-- -------------------------------------------------------- -->
<!-- 최초작성자 : 최혜원(wone8115@uos.ac.kr) -->
<!-- 최초작성일 : 2023/02/22 -->

<!-- 버전 기록 : ver1(시작 23/02/22) -->
<!-- -------------------------------------------------------- -->

<%@page import="jdbc.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>STUDY TIME</title>
</head>
 <body class="text-center">
 <%@ include file="/includes/header.jsp"%>

  

<main class="form-signin w-100 m-auto" style="padding-top: 150px; padding-bottom: 200px;">


   <h2><b> 스터디 목록 </b></h2>
     <br><br>
<table class="table" style="width: 60%; margin-left: auto; margin-right: auto;">
   <thead>
   <tr>
    <th scope="col"><h5><b>제목</b></h5></th>
    <th scope="col"><h5><b>카테고리</b></h5></th>
    <th scope="col"><h5><b>작성자</b></h5></th>
    <th><h5><b>등록일자</b></h5></th>
    <th><h5><b>가입신청 유저확인</b></h5></th>
    <th></th>
    </tr>
  </thead>
   <tbody class="table" id="ajaxTable">
  


    </tbody>
    </table>

    
 
</main>    
 
</body>
  <script>
	$('#pageTitle').text("스터디 관리");
  
  function searchFunction() {	
		$.ajax({
 			type:"POST",
 			url:"/study/studyLeaderListProc.jsp?sid=<%=sid%>",
 			success:function(data){
 				var study = JSON.parse(data.trim());
 				var str="";
 				for(var i=0; i < study.length; i++){
 					
 					str += "<tr><td class='h5 view' id=" + study[i].sNo + ">" + study[i].sTitle + "</td>";
 					str += "<td class='h5 view' id=" + study[i].sNo + ">" + study[i].category1 + "</td>";
 					str += "<td class='h5 view' id=" + study[i].sNo + ">" + study[i].nickname + "</td>";
 					str += "<td class='h5 view' id=" + study[i].sNo + ">" + study[i].regDate + "</td>";
 					str += "<td class='h5'><button class='btn' id="+ study[i].sNo +">이동</button></td>";
 					str += "<td class='h5'></td></tr>"

 				}
 				$('#ajaxTable').html(str);
 			}
 			
 		});
	  
} 
  
  window.onload = function() {
	searchFunction();
}
  
  $(document).on('click', '.view', function(event) {
	  location.href='/study/studyView.jsp?sNo=' + $(this).attr('id');
	});
  
  
  $(document).on('click', '.btn', function(event) {
	  location.href='/study/studyUserApply.jsp?sNo=' + $(this).attr('id');
	});
  
  </script>
</html>