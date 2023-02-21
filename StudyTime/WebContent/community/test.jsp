<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/includes/header.jsp" %>
<div id="page_control">
	<%
	String pageNum = "1";
	BoardDAO bdao = new BoardDAO();
	int cnt = bdao.getBoardCount();
	int pageSize = 5;
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage-1)*pageSize + 1;
	 			if(cnt != 0){
						
	 			int pageCount = cnt / pageSize + (cnt% pageSize == 0?0:1);
				
	 			int pageBlock = 5;
				
	 			int startPage = ((currentPage -1)/pageBlock)*pageBlock+1;
				
	 			int endPage = startPage + pageBlock-1;
	 			if(endPage > pageCount){
	 				endPage = pageCount;
	 			}
	%>
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
<%} %>

			    <li class="page-item disabled">
				<a href="boardlist.jsp?pageNum=<%= startPage-pageBlock %>">&laquo; Prev</a>
				</li>
</div>
</body>
</html>


<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>