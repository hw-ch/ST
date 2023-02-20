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
	sid = "";
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
	<% if(sid.equals("admin")){
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
	    <li class="page-item disabled prev">
	      <a class="page-link" id="test">&laquo; Previous</a>
	    </li>
	    <li class="page-item next">
	      <a class="page-link" href="#">Next &raquo;</a>
	    </li>
</ul>
</div>

<script>
	var total = <%=total%>;
	var currentPage = <%=request.getParameter("page")%>
	
	
	

 	function searchFunction(){
 		$.ajax({
 			type:"POST",
 			url:"/notice/noticeViewProc.jsp",
 			success:function(data){
 				var notices = JSON.parse(data.trim());
 				var str="";
 				for(var i=0; i < notices.length; i++){
 					str += "<tr><td><small>" + notices[i].bNo + "</small></td>";
 					str += "<td class='w-75'><a href='/notice/noticeDetail.jsp?bNo="+notices[i].bNo+"'><div width='100%'>" + notices[i].title + "</div></a></td>";
 					str += "<td><small>" + notices[i].regDate +"</small></td></tr>";
 					console.log(str);

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
 		var pageNum = Math.ceil(total / 10);
 		var str = '';
 		for(i=0; i<pageNum; i++){
 			str += ("<li class='page-item'><a class='page-link' id='" + i +"' href='/notice/noticeView.jsp?page=" + (i+1) + "'>" + (i+1) +"</a></li>")
 		}
 		$('.prev').after(str);

 		$('.page-link').forEach(function(pageLink) {
 		    console.log(pageLink)
 		});
 	}
 	
 	function pagination(currentPage) {
 		// 현재 게시물의 전체 개수가 10개 이하면 pagination을 숨김.
 		if (total <= 10) return; 

 		var totalPage = Math.ceil(total / 10);
 		var pageGroup = Math.ceil(currentPage / 10);
 		
 		var last = pageGroup * 10;
 		if (last > totalPage) last = totalPage;
 		var first = last - (10 - 1) <= 0 ? 1 : last - (10 - 1);

 		const fragmentPage = document.createDocumentFragment();
 	  if (prev > 0) {
 		  var allpreli = document.createElement('li');
 		  allpreli.insertAdjacentHTML("beforeend", `<a href='#js-bottom' id='allprev'>&lt;&lt;</a>`);
 		
 		  var preli = document.createElement('li');
 		  preli.insertAdjacentHTML("beforeend", `<a href='#js-ottom' id='prev'>&lt;</a>`);
 		
 		  fragmentPage.appendChild(allpreli);
 		  fragmentPage.appendChild(preli);
 		}

 	  for (var i = first; i <= last; i++) {
 		  const li = document.createElement("li");
 		  li.insertAdjacentHTML("beforeend", `<a href='#js-bottom' id='page-${i}' data-num='${i}'>${i}</a>`);
 		  fragmentPage.appendChild(li);
 	  }

 	  if (last < totalPage) {
 		  var allendli = document.createElement('li');
 		  allendli.insertAdjacentHTML("beforeend", `<a href='#js-bottom'  id='allnext'>&gt;&gt;</a>`);
 		
 		  var endli = document.createElement('li');
 		  endli.insertAdjacentHTML("beforeend", `<a  href='#js-bottom'  id='next'>&gt;</a>`);
 		
 		  fragmentPage.appendChild(endli);
 		  fragmentPage.appendChild(allendli);
 	  }

 	    document.getElementById('js-pagination').appendChild(fragmentPage);
 			// 페이지 목록 생성
 	}
 	
 	
 	
 </script>
</body>
</html>
