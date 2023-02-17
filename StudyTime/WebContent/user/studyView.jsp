<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>STUDY TIME</title>
</head>
<body>
<%@ include file="/includes/header.jsp" %>

<main>
<div class="container">
    <div class="row row-cols-1 row-cols-md-3 mb-3 text-center">
      <div class="col">
        <div class="card mb-4 rounded-3 shadow-sm">
          <div class="card-header py-3">
            <h4 class="my-0 fw-normal">스터디명</h4>
          </div>
          <div class="card-body">
            <ul class="list-unstyled mt-3 mb-4">
              <li>스터디 장 : </li>
              <li>스터디장 연락처 : </li>
              <li>스터디원 수 : </li>
              <li>시작일시 : </li>
              <li>진행방식 : </li>
              <li>예상기간 : </li>
              <li>스터디 과목 : </li>
            </ul>
            <button type="button" class="w-100 btn btn-lg btn-secondary">스터디 입장하기</button>
          </div>
        </div>
      </div>
      </div>
      </div>
</main>

</body>
</html>