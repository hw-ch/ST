<!-- -------------------------------------------------------- -->
<!-- 최초작성자 : 김도영(difbfl4750@naver.com) -->
<!-- 최초작성일 : 2023/02/15 -->

<!-- 버전 기록 : ver1(시작 23/02/15) -->
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

<% 

String sNo = request.getParameter("sNo");


%>
  

<main class="form-signin w-100 m-auto" style="padding-top: 150px;">


   <h2><b> 그룹원 목록 </b></h2>
     <br><br>
<table class="table table-hover" style="width: 60%; margin-left: auto; margin-right: auto;">
   <thead>
   <tr>
    <th scope="col"><h5><b>닉네임</b></h5></th>
    <th scope="col"><h5><b>이름</b></h5></th>
    <th scope="col"><h5><b>성별</b></h5></th>
    <th><h5><b>가입일자</b></h5></th>
    <th></th>
    </tr>
  </thead>
   <tbody class="table table-hover" id="ajaxTable">
  


    </tbody>
    </table>

    
 
</main>

<main class="form-signin w-100 m-auto" style="padding-top: 200px; padding-bottom: 200px;">


   <h2><b> 추방된 회원 목록 </b></h2>
     <br><br>
<table class="table table-hover" style="width: 60%; margin-left: auto; margin-right: auto;">
   <thead>
   <tr>
    <th scope="col"><h5><b>닉네임</b></h5></th>
    <th scope="col"><h5><b>이름</b></h5></th>
    <th scope="col"><h5><b>성별</b></h5></th>
    <th><h5><b>가입일자</b></h5></th>
    <th></th>
    </tr>
  </thead>
   <tbody class="table table-hover" id="ajaxTable2">
  


    </tbody>
    </table>

    
 
</main>
    
    
 
</body>
  <script>
	$('#pageTitle').text("그룹원 관리")
  
  function searchFunction() {	
	  $.ajax({
		type:'post',
		url:'userCheckAJAX.jsp?sNo=' + '<%=sNo%>',
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
			url:'deleteCheckAJAX.jsp?sNo=' + '<%=sNo%>' + '&check=재가입&userId=' + $(".tempTitle2").attr("id"),
			success:function(result){
				searchFunction();
			}
		  
		  });
	});
  
  
  $(document).on('click', '.delBtn', function(event) {
	  $.ajax({
			type:'post',
			url:'deleteCheckAJAX.jsp?sNo=' + '<%=sNo%>' + '&check=추방&userId=' + $(".tempTitle1").attr("id"),
			success:function(result){
				searchFunction();
			}
		  
		  });
	});
  
  </script>
</html>