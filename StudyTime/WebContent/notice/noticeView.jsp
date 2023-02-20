<!-- 
--------------------------------------------------------
최초작성자 : 최혜원(wone8115@uos.ac.kr)
최초작성일 : 2023/02/15

버전 기록 : ver1(시작 23/02/15)

- sid 관리자 처리 필요
--------------------------------------------------------
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/includes/header.jsp" %>
<% 
	// sid 확인
	if(session.getAttribute("sid") != null){
		sid = (String)session.getAttribute("sid");
	}

	int total = NoticeDAO.count();
	
	String pageNum = "";
	if(request.getParameter("page") != null){
		pageNum = request.getParameter("page");	
	}
%>
<style>
	a {
  text-decoration: none;
  color:black;
	}
	
	.pagination a:hover,
	.pagination .active a {
    background-color: #f0ad4e;
    color: #ffffff;
    border : none;
	}
	
	.pagination a {
    float: left;
    padding: 0 14px;
    line-height: 34px;
    color: #000000;
    text-decoration: none;
    border-left-width: 0;
	}	

	
</style>
<body>
<div class="container">
	<div class="row p-2">
		<div class="col">
			<div style="float:right;">
				<button class="col btn btn-warning" onclick="location.href='noticeAdd.jsp'">글작성</button>
			</div>
		</div>
	</div>
  <table class="table table-hover">
  <tbody id="notice">
  </tbody>
</table>
<ul class="pagination justify-content-center">	   
</ul>
</div>

<script>
	var total = <%=total%>;
	console.log("total : " + total);
	var totalPage = Math.ceil(total / 10);
	console.log("totalPage : " + totalPage);
	var currentPage = <%=request.getParameter("page")%>
	console.log("currentPage : " + currentPage);
	var pageGroup = Math.ceil(currentPage / 10);
	console.log("pageGroup : " + pageGroup);
	var last = pageGroup * 10;
	console.log("last : " + last);
	if (last > totalPage) last = totalPage;
	var first = last - (10 - 1) <= 0 ? 1 : last - (10 - 1);
	var previous = first > 1;
	var next = last < totalPage;
	

 	function searchFunction(){
 		$.ajax({
 			type:"POST",
 			url:"/notice/noticeViewProc.jsp",
 			success:function(data){
 				var notices = JSON.parse(data.trim());
 				var str="";
 				for(var i=0; i < notices.length; i++){
 					str += "<tr><small><td>" + notices[i].bNo + "</small></td>";
 					str += "<td class=\"w-75\"><a href='/notice/noticeDetail.jsp?bNo="+notices[i].bNo+ "'>" + notices[i].title + "</a></td>";
 					str += "<td>" + notices[i].regDate +"</td></tr>";

 				}
 				$('#notice').html(str);
 			}
 			
 		});
 	}
 	
 	
 	window.onload = function(){
 		searchFunction();
 		pagination();
 		

 	}
 	
 	function pagination(){
 		if (total <= 10) return;
 		var str = '';
 		if (previous) {
 	 		  str += "<li class='page-item prev'><a class='page-link'>&laquo; Previous</a></li>";
 	 		}
 		if (next) {
	 		  str += "<li class='page-item next'><a class='page-link'>Next &raquo;</a></li>"
	 		}
 		for(i=first; i<=last; i++){
 				str += ("<li class='page-item" +(i==pageNum?'active':'') + "'><a class='page-link' id='" + i +"' href='/notice/noticeView.jsp?page=" + i + "'>" + i +"</a></li>")
 		}
 		$('.pagination').html(str);
 	}
 	
 </script>
</body>
</html>