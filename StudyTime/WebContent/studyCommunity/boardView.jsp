<!--
--------------------------------------------------------
최초작성자 : 최혜원(wone8115@uos.ac.kr)
최초작성일 : 2023/02/23

버전 기록 : ver1(시작 23/02/23)
--------------------------------------------------------
 -->
 

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.*" %>
<%@ include file="/includes/header.jsp" %>
<%
	// sid 확인
	sid = (String)session.getAttribute("sid");
	String sNo = request.getParameter("sNo");

	int total = StudyBoardDAO.count(sNo);

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
				<button class="col btn btn-primary" onclick="location.href='boardAdd.jsp?sNo=<%=sNo%>'">글작성</button>				
			</div>
		</div>
	</div>
  <table class="table table-hover" style="margin-bottom: 300px;">
  <tbody id="board">
  </tbody>
</table>
<ul class="pagination justify-content-center">
</ul>
</div>

<script>
	$('#pageTitle').text("스터디 커뮤니티");
	var pageSize = 10;
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
 			url:"/studyCommunity/boardViewProc.jsp",
 			data : {pageSize : pageSize,
 					currentPage : currentPage,
 					sNo : <%=sNo%>

			},
 			success:function(data){
 				var boards = JSON.parse(data.trim());
 				var str="";
 				for(var i=0; i < boards.length; i++){
 					str += "<tr><td><small>" + boards[i].bNo + "</small></td>";
 					str += "<td class='w-75'><a href='/studyCommunity/boardDetail.jsp?bNo="+boards[i].bNo+"'><div width='100%'>" + boards[i].subject + "</div></a></td>";
 					str += "<td><small>" + boards[i].nickname +"</small></td>";
 					str += "<td><small>" + boards[i].regDate +"</small></td></tr>";

 				}
 				$('#board').html(str);
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
 	 		  str += "<li class='page-item prev'><a class='page-link'><a href='/studyCommunity/boardView.jsp?page="+ (start - 10) +"&sNo=<%=sNo%>'>&laquo; Previous</a></li>";
 	 		}
 		for(i=start; i<=last; i++){
				str += "<li class='page-item "+ (i==currentPage?'active':'') +"'><a class='page-link' href='/studyCommunity/boardView.jsp?page=" + i +"&sNo=<%=sNo%>'>"+ i +"</a></li>"
		}
 		if (next) {
	 		  str += "<li class='page-item next'><a class='page-link' href='/studyCommunity/boardView.jsp?page="+ (start + 10) +"&sNo=<%=sNo%>'>Next &raquo;</a></li>"
	 		}



 		$('.pagination').html(str);
 	}

 </script>
</body>
</html>
