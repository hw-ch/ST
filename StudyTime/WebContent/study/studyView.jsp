<!-- -------------------------------------------------------- -->
<!-- 최초작성자 : 박지원 -->
<!-- 최초작성일 : 2023/02/20 -->

<!-- 버전 기록 : ver1(시작 23/02/20) -->
<!-- -------------------------------------------------------- -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>STUDY TIME</title>
</head>
<body>
	<%@ include file = "/includes/header.jsp" %>
	<%
		//String sNo = request.getParameter("sNo");
		String sNo = "2";
		StudyDTO sdto = new StudyDAO().studyView(sNo);
	%>
	<div class="col-lg-8 mx-auto p-4 py-md-5">
		<header class="d-flex align-items-center pb-3 mb-5 border-bottom">
	    	<img src="/images/favicon.ico" width="40" height="32" class="me-2"></img>
	    	<span class="fs-4"><%=session.getAttribute("sid")%></span>
		</header>
		<main>
			<div>
				<h1 class = "pb-3 mb-5"><%=sdto.getSTitle() %></h1>
			     <div class = "pb-3 mb-5" >	
		     	 	<table class="table table-borderless fs-5"> 
					    <tr>
					      <td>진행방식</td>
					      <td><%=sdto.getProcess() %></td>
					      <td>총인원</td>
					      <td><%=sdto.getJoinCnt()%>/<%=sdto.getRecruitCnt() %></td>
					    </tr>
					    <tr>
					      <td>시작예정</td>
					      <td><%=sdto.getStartDate() %></td>
					      <td>카테고리</td>
					      <td><%=sdto.getCategory1() %>/<%=sdto.getCategory2() %></td>
					    </tr>
					    <tr>
					      <td>진행기간</td>
					      <td><%=sdto.getExpDate() %>개월</td>
					    </tr> 
					</table>
			    </div>
			</div>
		    <div>
			    <h1>스터디 소개</h1>
			    <div class="border-bottom pb-3 mb-5"></div>
			   	<div>
			   		 <%=sdto.getSContent() %>
			   	</div> 
		    </div>
		  	
		</main>
		<footer class="pt-5 my-5 text-muted border-top">
	  		<div class="mb-5">
		      <a href="javascript:history.back();" class="btn btn-danger btn-lg px-4 text text-white">이전으로</a>
		      <a href="/study/studyJoinProc.jsp?sNo=<%=sNo %>" class="btn btn-warning btn-lg px-4 text text-white">참여하기</a>
		      <%
		      StudyJoinDTO sjdto = new StudyJoinDAO().selectApprove(sid);
		  	if(sid!=null && (sid.equals("admin") || sjdto.getApprove().equals("그룹장"))){ %>
	      		 <a href="/study/studyModify.jsp?sNo=<%=sNo %>" class="btn btn-primary btn-lg px-4 text text-white">수정</a>
		     	 <a href="/study/studyRemoveProc.jsp?sNo=<%=sNo %>" class="btn btn-danger btn-lg px-4 text text-white">삭제</a>
	      	<%}%>
		      
		     
		     
	  		</div>
		</footer>
	</div>
</body>
</html>