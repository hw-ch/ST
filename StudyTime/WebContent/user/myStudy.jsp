<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>STUDY TIME</title>
<style>
/* div{ text-align : center} */
</style>
</head>
<body>
<%@ include file="/includes/header.jsp" %>

<div class="container">
<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
<div class="card border-dark mb-3" style="max-width: 18rem;">
  <h5 class="card-header">스터디 이름 </h5>
  <div class="card-body">
    <p class="card-text">스터디 장</p>
    <p class="card-text">회원수 : 10명</p>
    <p class="card-text">시작일시 : 2023/02/16</p>
    <a href="#" class="btn btn-secondary">스터디 상세보기</a>
  </div>
</div>
</div>
</div> 



<!-- <div class="container">
<table class="table-secondary">
  <thead>
    <tr class="table-secondary">
      <th scope="col" class="table-light">스터디명</th>
      <th scope="col" class="table-light">스터디 장</th>
      <th scope="col" class="table-light">회원수</th>
      <th scope="col" class="table-light">시작일시</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
      <td>@fat</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td colspan="2">Larry the Bird</td>
      <td>@twitter</td>
    </tr>
  </tbody>
</table>
</div> -->

</body>
</html>