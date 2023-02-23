<!-- -------------------------------------------------------- -->
<!-- 최초작성자 : 박지원 -->
<!-- 최초작성일 : 2023/02/20 -->

<!-- 버전 기록 : ver1(시작 23/02/21) -->
<!-- -------------------------------------------------------- -->

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
	<%
		String sNo = request.getParameter("sNo");
		StudyDTO sdto = new StudyDAO().studyView(sNo);
	%>
	<%@ include file = "/includes/header.jsp" %>
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	<div class="col-lg-8 mx-auto p-4 py-md-5">
	<form action = "/study/studyModifyProc.jsp" method = "post" name = "form">
		<main>
			<div class = "pb-3 mb-5">	
			    <h4 class="pb-3 mb-3 border-bottom">스터디 기본 정보를 입력해주세요.</h4>	     
				<div class="row g-3">
			         <div class="col-sm-6">
				          <label for="process" class="form-label">진행방식</label>
			              <select class="form-select" name = "process" id = "process" required onchange = "changeValue2()">
			                <option value="온라인" <% if(sdto.getProcess().equals("온라인")){%>selected<%}%>>온라인</option>
			                <option value="오프라인" <% if(sdto.getProcess().equals("오프라인")){%>selected<%}%>>오프라인</option>
			              </select>
		          	  </div>
			          <div class="col-sm-6">
			           	 <label for="recruitCnt" class="form-label">총인원</label>
			             <select class="form-select" name="recruitCnt" id="recruitCnt" required>
			               <option value="1" <% if(sdto.getRecruitCnt().equals("1")){%>selected<%}%>>1명</option>
			               <option value="2" <% if(sdto.getRecruitCnt().equals("2")){%>selected<%}%>>2명</option>
			               <option value="3" <% if(sdto.getRecruitCnt().equals("3")){%>selected<%}%>>3명</option>
			               <option value="4" <% if(sdto.getRecruitCnt().equals("4")){%>selected<%}%>>4명</option>
			               <option value="5" <% if(sdto.getRecruitCnt().equals("5")){%>selected<%}%>>5명</option>
			               <option value="6" <% if(sdto.getRecruitCnt().equals("6")){%>selected<%}%>>6명</option>
			               <option value="7"<% if(sdto.getRecruitCnt().equals("7")){%>selected<%}%>>7명</option>
			               <option value="8"<% if(sdto.getRecruitCnt().equals("8")){%>selected<%}%>>8명</option>
			               <option value="9"<% if(sdto.getRecruitCnt().equals("9")){%>selected<%}%>>9명</option>
			               <option value="10"<% if(sdto.getRecruitCnt().equals("10")){%>selected<%}%>>10명</option>
			             </select>
		         	 </div>
		         	 <div class="col-sm-6">
			           	 <label for="startDate" class="form-label">시작예정</label>
			             <input class="form-select" value = "<%=sdto.getStartDate() %>" type="date" name="startDate" id = "startDate" required/>				            
		         	 </div>
		         	 <div class="col-sm-6">
			           	 <label for="expDate" class="form-label">예상기간</label>
			             <select class="form-select" name = "expDate" id="expDate" required>
			               <option value="" selected disabled>1개월~6개월</option>
			               <option value="1" <% if(sdto.getExpDate().equals("1")){%>selected<%}%>>1개월</option>
			               <option value="2" <% if(sdto.getExpDate().equals("2")){%>selected<%}%>>2개월</option>
			               <option value="3" <% if(sdto.getExpDate().equals("3")){%>selected<%}%>>3개월</option>
			               <option value="4" <% if(sdto.getExpDate().equals("4")){%>selected<%}%>>4개월</option>
			               <option value="5" <% if(sdto.getExpDate().equals("5")){%>selected<%}%>>5개월</option>
			               <option value="6" <% if(sdto.getExpDate().equals("6")){%>selected<%}%>>6개월</option>
			             </select>
			            
		         	 </div>
		         	 <div class="col-sm-6">
			           	 <label for="category1" class="form-label">카테고리1</label>
			             <select class="form-select" name = "category1" id="category1" required>
			               <%
								List<CategoryDTO> category1List = new CategoryDAO().category1List(); 
			           			for(CategoryDTO category1 : category1List){
		           				%>
			           				<option <% if(sdto.getCategory1().equals(category1.getCategory1())){%>selected<%}%> value = "<%=category1.getCategory1()%>"><%=category1.getCategory1()%></option>
			           			<%
			           				}
		           			%>
			             </select>
			            
		         	 </div>
		         	 <div class="col-sm-6">
			           	 <label for="category2" class="form-label">카테고리2</label>
			             <select class="form-select" name = "cNo" id="category2" required>
			                <%	
			                	List<CategoryDTO> category2List = new CategoryDAO().category2List(); 
			           			for(CategoryDTO category2 : category2List){
		           				%>
			           				<option <% if(sdto.getCategory2().equals(category2.getCategory2())){%>selected<%}%> value = "<%=category2.getCNo()%>"><%=category2.getCategory2()%></option>
			           			<%
			           				}
			           			//String getCategory = "<script>document.writeln(document.getElementById('category1').value)</script>";
			           			%>
			           			
			           			
			             </select>
			             
		         	 </div>
		         	 <div class = "col-sm-6" id = "addressDiv">
						<label for="addr1" class="form-label">도로명 주소</label>
							<input type = "text" class = "form-control" id = "addr1" name = "addr1" placeholder="오프라인 스터디만 입력해주세요.">
							<input type = "button" class = "form-control btn btn-outline-secondary" value = "검색"
							onclick="goPopup()"> 
					</div>
					 <div class = "col-sm-6" id = addressDiv2>
						<label for="addr2" class="form-label">상세 주소</label>
							<input type = "text" class = "form-control" id = "addr3" name = "addr3" placeholder="오프라인 스터디만 입력해주세요.">
							<input type = "text" class = "form-control" id = "addr2" name = "addr2">
							<input type = "hidden" name = "address" id = "address">
					</div>
					<input type = "hidden" name = "sNo" id = "sno" value="<%=sNo%>">
			</div>
					
					
				
			</div>
		    <div>
			    <h4 class="pb-3 mb-3 border-bottom">스터디를 소개해주세요.</h4>
			   	<div>
				   	<div class="col-sm-6">
					           	 <label for="sTitle" class="form-label">제목</label>
					             <input type = "text" class = "form-control" name = "sTitle" id = "sTitle" required value = "<%=sdto.getSTitle()%>">						            
		         	</div>
	         		<div class="col-sm-6">
				           	 <label for="sContent" class="form-label">내용</label>
							<textarea id="summernote" name = "sContent" class="form-control"><%=sdto.getSContent()%></textarea>         
	         		</div>
		         	 
			   	</div> 
		    </div>	
		</main>
			<footer class="pt-5 my-5 text-muted border-top">
		  		<div class="mb-5">
			      <a href="javascript:void(0);" onclick = "confirmBack();" class="btn btn-warning btn-lg px-4 text text-white">취소</a>
			      <button class="btn btn-warning btn-lg px-4 text text-white modifyBtn" type="submit">글 수정</button>
		  		</div>
			</footer>
		</form>  	
	</div>
	<script>
		$('#pageTitle').text("스터디 수정");
	</script>
	<script>
	$(function changeValue(){
		var value_str = document.getElementById('process');
		if(value_str.options[value_str.selectedIndex].text != "오프라인"){
			$("#addressDiv").hide();
			$("#addressDiv2").hide();
		}
		else{
			$("#addressDiv").show();
			$("#addressDiv2").show();
		}
	});
	function changeValue2(){
		var value_str = document.getElementById('process');
		if(value_str.options[value_str.selectedIndex].text != "오프라인"){
			$("#addressDiv").hide();
			$("#addressDiv2").hide();
		}
		else{
			$("#addressDiv").show();
			$("#addressDiv2").show();
		}
	}	
	</script>
	<script>
	 function confirmBack() {
	        if(confirm("작성한 내용이 저장되지 않습니다.\n정말 이전으로 돌아가시겠습니까?") ) {
	            location.href = "javascript:history.back();";
	        }
	    }
	</script>
	<script>
      $('#summernote').summernote({
    	  // 에디터 높이
    	  height: 300,
    	  width: 483,
    	  // 에디터 한글 설정
    	  lang: "ko-KR",
    	  // 에디터에 커서 이동 (input창의 autofocus라고 생각하시면 됩니다.)
    	  focus : true,
    	  toolbar: [
    		    // 글꼴 설정
    		    ['fontname', ['fontname']],
    		    // 글자 크기 설정
    		    ['fontsize', ['fontsize']],
    		    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
    		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
    		    // 글자색
    		    ['color', ['forecolor','color']],
    		    // 글머리 기호, 번호매기기, 문단정렬
    		    //['para', ['ul', 'ol', 'paragraph']],
    		    // 줄간격
    		    //['height', ['height']],
    		    // 그림첨부, 링크만들기, 동영상첨부
    		    ['insert',['picture']]
    		    //['insert',['picture','link','video']]
    		  ],
   		  // 추가한 글꼴
   		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
   		 // 추가한 폰트사이즈
   		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
      });
      
  	$('.modifyBtn').click(function(){
		$('#address').val($('#addr1').val() + " " + 
						$('#addr2').val() + " " +
						$('#addr3').val());
	})  
  	function goPopup(){
  		var pop = window.open("jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
  	}
  	function jusoCallBack(roadAddrPart1,addrDetail,roadAddrPart2){
  		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
  		document.form.addr1.value = roadAddrPart1;
		document.form.addr2.value = addrDetail;
		document.form.addr3.value = roadAddrPart2;
  }
    </script>
</body>
</html>