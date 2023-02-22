<!-- 
--------------------------------------------------------
최초작성자 : 최혜원(wone8115@uos.ac.kr)
최초작성일 : 2023/02/15

버전 기록 : ver1(시작 23/02/15)
		ver2(23/02/21 페이징 추가)

- sid 관리자 처리 필요
--------------------------------------------------------
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.*" %>
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
	<%
	if(sid.equals("admin")){
	%>
	<div class="row p-2">
		<div class="col">
			<div style="float:right;">
				<button class="col btn btn-warning" onclick="location.href='noticeAdd.jsp'">글작성</button>
			</div>
		</div>
	</div>
	<%
	}
	%>
  <table class="table table-hover">
  <tbody id="notice">
  </tbody>
</table>
<ul class="pagination justify-content-center">	   
</ul>
</div>

<script>
	var pageSize = 2;
	var currentPage = <%=request.getParameter("page")%>
	if(currentPage == null){currentPage = 1;}
	var total = <%=total%>;
	var totalPage = Math.ceil(total / pageSize);
	var pageGroup = Math.ceil(currentPage / 10);
	var last = pageGroup * 10;
	var start = last - (10 - 1);
	if (last > totalPage){last = totalPage};
	var previous = start > 1;
	var next = last < totalPage;
	

 	function searchFunction(){
 		$.ajax({
 			type:"POST",
 			url:"/notice/noticeViewProc.jsp",
 			data : {pageSize : pageSize,
 					currentPage : currentPage
				
			},	
 			success:function(data){
 				var notices = JSON.parse(data.trim());
 				var str="";
 				for(var i=0; i < notices.length; i++){
 					str += "<tr><small><td>" + notices[i].bNo + "</small></td>";
 					str += "<td class='w-75'><a href='/notice/noticeDetail.jsp?bNo="+notices[i].bNo+"'><div width='100%'>" + notices[i].title + "</div></a></td>";
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
 		if (total <= pageSize) return;
 		var str = '';
 		if (previous) {
 	 		  str += "<li class='page-item prev'><a class='page-link'><a href='/notice/noticeView.jsp?page="+ (start - 10) +"'>&laquo; Previous</a></li>";
 	 		}
 		for(i=start; i<=last; i++){
				str += "<li class='page-item "+ (i==currentPage?'active':'') +"'><a class='page-link' href='/notice/noticeView.jsp?page=" + i +"'>"+ i +"</a></li>"
		}
 		if (next) {
	 		  str += "<li class='page-item next'><a class='page-link' href='/notice/noticeView.jsp?page="+ (start + 10) +"'>Next &raquo;</a></li>"
	 		}

 		
 	
 		$('.pagination').html(str);
 	}
 	
 </script>
</body>
</html>