<!--
--------------------------------------------------------
최초작성자 : 김남훈
최초작성일 : 2023/02/17

버전 기록 : ver1(시작 23/02/17)
		ver2(23/02/22)
--------------------------------------------------------
  -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>communityView</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
</head>

<body>
<%@ include file="/includes/header.jsp" %>
<% 

	UserDTO userid = new UserDAO().getOneList(sid);

%>
<nav class="boardnav"></nav>
<div class="boardcontainer">
<div><h1 class="boardtitle">커뮤니티</h1></div>
	<div class="row p-2">
		<div class="col">
			<div style="float:right;">
				<button class="col btn btn-warning btn-lg" onclick="location.href='/community/boardInsert.jsp'">글작성</button>
			</div>
		</div>
	</div>	  
	<table class="table table-hover">
	  <tbody>
	  <tr class="trhead">
	  <th class="th1">글번호</th>
  	  <th class="th2">제목</th>
	  <th class="th3">작성자</th>
	  <th class="th4">날짜</th>
	  <th class="th5">조회수</th>
	  </tr>
<%
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum = "1";
	}
	BoardDAO bdao = new BoardDAO();
	int cnt = bdao.getBoardCount();
	int pageSize = 10;
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage-1)*pageSize + 1;
	
	ArrayList<BoardDTO> boards = BoardDAO.getallList(startRow, pageSize);
	for( BoardDTO board: boards) {
%>
 <tr><td><%=board.getBNo() %></td>
	<td><a class="td" href="boardview.jsp?bno=<%=board.getBNo() %>"><%=board.getSubject() %>[<%=board.getReplyNum() %>]</a></td>
	<td><%=board.getUserId() %></td>
	<td><%=board.getRegDate() %></td>
	<td><%=board.getHit() %></td>
	</tr>
<%
	}
%>
</tbody>
</table>
<div id="page_control" class="page_control">

<%
 			if(cnt != 0){
					
 			int pageCount = cnt / pageSize + (cnt% pageSize == 0?0:1);
			
 			int pageBlock = 10;
			
 			int startPage = ((currentPage -1)/pageBlock)*pageBlock+1;
			
 			int endPage = startPage + pageBlock-1;
 			if(endPage > pageCount){
 				endPage = pageCount;
 			}
%>
		<ul class="pagination justify-content-center">


	<%		if(startPage>pageBlock){ %>
		    <li class="page-item" >
			<a class="page-link" href="boardList.jsp?pageNum=<%= startPage-pageBlock %>">&laquo; Prev</a>
			</li>
	<% }	
			for(int i=startPage; i<=endPage; i++) { 
				if(currentPage == i){%>
			    <li class="page-item active" aria-current="page">
				<a class="page-link" href="boardList.jsp?pageNum=<%= i %>"><%=i %></a>
				</li>			
			<% }else{ 
			%>
				<li class="page-item">
				<a class="page-link" href="boardList.jsp?pageNum=<%= i %>"><%=i %></a>
			<%
				}
			}
			if(endPage<pageCount){ %>
		    <li class="page-item">
			<a class="page-link" href="boardList.jsp?pageNum=<%= startPage+pageBlock %>">Next &raquo;</a>
			</li>
	<% } %>
	</ul>
	<% } %>	
</div>
</div>
<script>
 $("#home").hide();

 </script>
</body>
</html>