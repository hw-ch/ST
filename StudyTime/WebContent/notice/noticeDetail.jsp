<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/includes/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="card">
		  <div class="card-header" id="title">
		  </div>
		  <div class="card-body">
		    <p class="card-text" id="content"></p>
		  </div>
		</div>
	</div>
</body>
<script>
function searchFunction(){
		$.ajax({
			type:"POST",
			url:"/notice/noticeDetailSelect.jsp",
			success:function(data){
				/* var notice = JSON.parse(data.trim());
				var title=notice.title;
				var content=notice.content
				$('#title').html(title);
				$('#content').html(content); */
				console.log(data)
			}
			
		});
	}
	
	
	
	window.onload = function(){
		searchFunction();
	}
</script>
</html>