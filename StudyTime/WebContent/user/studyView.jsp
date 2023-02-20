<!-- 스터디 조회 -->
<!-- -------------------------------------------------------- -->
<!-- 최초작성자 : 정소영(jungsoyy@gmail.com) -->
<!-- 최초작성일 : 2023/02/15 -->

<!-- 버전 기록 : ver1(시작 23/02/15) -->
<!-- -------------------------------------------------------- -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="jdbc.*"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>STUDY TIME</title>
</head>
<body>
<%@ include file="/includes/header.jsp" %>
<%

String sNo = request.getParameter("sNo");
StudyDTO study = StudyDAO.myView(study.getSNo()); 	


%>

<main>
<div class="container">
    <div class="row row-cols-1 row-cols-md-3 mb-3 text-center">
      <div class="col">
        <div class="card mb-4 rounded-3 shadow-sm">
          <div class="card-header py-3">
            <h4 class="my-0 fw-normal"><%= %></h4>
          </div>
          <div class="card-body">
            <ul class="list-unstyled mt-3 mb-4">
              <li>스터디 장 : <%=study.getSWriter() %></li>
              <li>스터디장 연락처 : <%=study.getSWriter() %></li>
              <li>스터디원 수 : <%=study.getSWriter() %></li>
              <li>시작일시 : <%=study.getSWriter() %></li>
              <li>진행방식 : <%=study.getSWriter() %></li>
              <li>예상기간 : <%=study.getSWriter() %></li>
              <li>스터디 과목 : <%=study.getSWriter() %></li>
            </ul>
             <hr class="my-4">
            <button type="button" class="w-100 btn btn-lg btn-secondary">스터디 입장</button>
          </div>
        </div>
      </div>
      </div>
      </div>
</main>


</body>
</html>