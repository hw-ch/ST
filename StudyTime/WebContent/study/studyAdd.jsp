<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>STUDY TIME</title>
 <style>
        select option[value=""][disabled] {
	        display: none;
        }
    </style>
    
</head>
<!-- value 오프라인이면 주소api입력창활성화 
진행방식,모집인원
		     	 	시작예정,예상기간
		     	 	카테고리1,카테고리2
		     	 	위치-->
				
<body>
	<%@ include file = "/includes/header.jsp" %>
	<div class="col-lg-8 mx-auto p-4 py-md-5">
		<main>
 			<div class = "pb-3 mb-5">	
			     <h4 class="pb-3 mb-3 border-bottom">스터디 기본 정보를 입력해주세요.</h4>
			     <form action = "/study/studyAddProc.jsp" method = "post">
					<div class="row g-3">
				         <div class="col-sm-6">
					          <label for="process" class="form-label">진행방식</label>
				              <select class="form-select" name = "process" id = "process" required>
				                <option value="" selected disabled>온라인/오프라인</option>
				                <option value="online">온라인</option>
				                <option value="offline">오프라인</option>
				              </select>
			          	  </div>
				          <div class="col-sm-6">
				           	 <label for="recruitCnt" class="form-label">모집인원</label>
				             <select class="form-select" name="recruitCnt" id="recruitCnt" required>
			              	   <option value="" selected disabled>인원 미정~10명 이상</option>
				               <option value="1">1명</option>
				               <option value="2">2명</option>
				               <option value="3">3명</option>
				               <option value="4">4명</option>
				               <option value="5">5명</option>
				               <option value="6">6명</option>
				               <option value="7">7명</option>
				               <option value="8">8명</option>
				               <option value="9">9명</option>
				               <option value="10">10명 이상</option>
				             </select>
			         	 </div>
			         	 <div class="col-sm-6">
				           	 <label for="startDate" class="form-label">시작예정</label>
				             <input class="form-select" type="date" name="startDate" id = "startDate" required/>				            
			         	 </div>
			         	 <div class="col-sm-6">
				           	 <label for="state" class="form-label">예상기간</label>
				             <select class="form-select" id="state" required>
				               <option value="">Choose...</option>
				               <option>California</option>
				             </select>
				            
			         	 </div>
			         	 <div class="col-sm-6">
				           	 <label for="state" class="form-label">카테고리1</label>
				             <select class="form-select" id="state" required>
				               <option value="">Choose...</option>
				               <option>California</option>
				             </select>
				            
			         	 </div>
			         	 <div class="col-sm-6">
				           	 <label for="state" class="form-label">카테고리2</label>
				             <select class="form-select" id="state" required>
				               <option value="">Choose...</option>
				               <option>California</option>
				             </select>
				             
			         	 </div>
			         	 <div class="col-sm-6">
				           	 <label for="state" class="form-label">위치</label>
				             <select class="form-select" id="state" required>
				               <option value="">Choose...</option>
				               <option>California</option>
				             </select>
				            
			         	 </div>
					</div>
		
		        <hr class="my-4">
		
		        <button class="w-100 btn btn-primary btn-lg" type="submit">Continue to checkout</button>
		  			</form>
		
		 </div>
			
		    <div>
			    <h1>스터디 소개</h1>
			    <div class="border-bottom pb-3 mb-5"></div>
			   	<div>
			   		제목,소개(summernote)
			   		 등록(2모달),취소(history.back()모달),위치)
			   	</div> 
		    </div>
		  	
		</main>
		<footer class="pt-5 my-5 text-muted border-top">
	  		<div class="mb-5">
		      <a href="#" class="btn btn-warning btn-lg px-4 text text-white">이전으로</a>
		      <a href="#" class="btn btn-warning btn-lg px-4 text text-white">참여하기</a>
		      <a href="#" class="btn btn-primary btn-lg px-4 text text-white">수정</a>
		      <a href="#" class="btn btn-danger btn-lg px-4 text text-white">삭제</a>
	  		</div>
		</footer>
	</div>
</body>
</html>