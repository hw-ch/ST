<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤더 적용</title>
</head>
<body>
<div class="container-sm">
	<div class="row">
		<div class="col justify-content-end">
			<button class="col btn btn-outline-primary btn-sm">글작성</button>
		</div>
	</div>
  <table class="table table-hover">
  <tbody id="notice">
  </tbody>
</table>
<ul class="pagination justify-content-center">
	    <li class="page-item disabled">
	      <a class="page-link">&laquo; Previous</a>
	    </li>
	    <li class="page-item active" aria-current="page">
	    	<a class="page-link" href="#">1</a></li>
	    <li class="page-item">
	        <a class="page-link" href="#">2</a>
	    </li>
	    <li class="page-item"><a class="page-link" href="#">3</a></li>
	    <li class="page-item">
	      <a class="page-link" href="#">Next &raquo;</a>
	    </li>
</ul>
</div>

<script>
 	function searchFunction(){
 		$.ajax({
 			type:"POST",
 			url:"/noticeAll.jsp",
 			success:function(data){
 				var notices = JSON.parse(data.trim());
 				var str="";
 				for(var i=0; i < notices.length; i++){
 					str += "<tr><small><td class=\"span1\">" + notices[i].bNo + "</small></td>";
 					str += "<td class=\"w-75\">" + notices[i].title + "</td>";
 					str += "<td class=\"span1\">" + notices[i].regDate +"</td></tr>";

 				}
 				$('#notice').html(str);
 			}
 			
 		});
 	}
 	
 	
 	
 	window.onload = function(){
 		searchFunction();
 	}
 	
 </script>
</body>
</html>