<!--
--------------------------------------------------------
최초작성자 : 김남훈
최초작성일 : 2023/02/17

버전 기록 : ver1(시작 23/02/17)
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
// 	sid = (String) session.getAttribute("sid");
	sid = "abc";
	UserDTO userid = new UserDAO().getOneList(sid);

%>
	<form>
	<h1>게시판</h1>
<%
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum = "1";
	}
	BoardDAO bdao = new BoardDAO();
	int cnt = bdao.getBoardCount();
	int pageSize = 5;
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage-1)*pageSize + 1;
	
	ArrayList<BoardDTO> boards = BoardDAO.getallList(startRow, pageSize);
	for( BoardDTO board: boards) {
%>
 <tr><td colspan=2><hr></td></tr>
 <tr><td><%=board.getBNo() %>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
	<td><a href="boardview.jsp?bno=<%=board.getBNo() %>"><%=board.getSubject() %></a></td>
	</tr>	
<%
	}
%>
<div id="page_control">


<%
			if (cnt != 0){
					
			int pageCount = cnt / pageSize + (cnt % pageSize == 0?0:1);
			
			int pageBlock = 5;
			
			int startPage = ((currentPage -1)/pageBlock)*pageBlock+1;
			
			int endPage = startPage + pageBlock-1;
			if(endPage > pageCount){
				endPage = pageCount;
			}
%>
	
	<%		if(startPage>pageBlock){ %>
			<a href="boardlist.jsp?pageNum=<%= startPage-pageBlock %>">Prev</a>
	<% } %>
	
	<% for(int i=startPage; i<=endPage; i++) { %>
			<a href="boardlist.jsp?pageNum=<%= i %>"><%=i %></a>
	<% } %>
	
		<%		if(endPage<pageCount){ %>
			<a href="boardlist.jsp?pageNum=<%= startPage+pageBlock %>">Next</a>
	<% } %>
	<% } %>

	
</div>
	</form>
<script>
 	 	 
 </script>
</body>
</html>