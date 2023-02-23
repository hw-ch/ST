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

  

<main class="form-signin w-100 m-auto" style="padding-top: 200px; padding-bottom: 200px;">


   <h2><b> 스터디 목록 </b></h2>
     <br><br>
<table class="table table-hover" style="width: 60%; margin-left: auto; margin-right: auto;">
   <thead>
   <tr>
    <th scope="col"><h5><b>제목</b></h5></th>
    <th scope="col"><h5><b>카테고리</b></h5></th>
    <th scope="col"><h5><b>작성자</b></h5></th>
    <th><h5><b>등록일자</b></h5></th>
    <th></th>
    </tr>
  </thead>
   <tbody class="table table-hover" id="ajaxTable">
  


    </tbody>
    </table>

    
 
</main>

    
    
 
</body>
  <script>
	$('#pageTitle').text("스터디 커뮤니티")
  
  function searchFunction() {	
	  $.ajax({
		type:'post',
		url:'studyCheckAJAX.jsp?sid=<%=sid%>',
		datatype : 'json',
		success:function(result){
			var str = result;
			$("#ajaxTable").html(str);
			
			
		}
	  
	  });
	  
} 
  
  window.onload = function() {
	searchFunction();
}
  
  </script>
</html>