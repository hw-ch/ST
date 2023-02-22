<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
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
		String sNo = request.getParameter("sNo");
		StudyDTO sdto = new StudyDAO().studyView(sNo);
		
		UserDTO udto = UserDAO.getOneList(sdto.getSWriter());
		List<StudyJoinDTO> slist = new StudyJoinDAO().selectJoinTable(sNo);
		
		int cnt = 0;
		
		for(StudyJoinDTO list : slist){
			if(list.getUserId().equals(sid)){
				cnt++;
			}
		}
		
	%>
	<div class="col-lg-8 mx-auto p-4 py-md-5">
		<header class="d-flex align-items-center pb-3 mb-5 border-bottom">
	    	<img src="/images/favicon.ico" width="40" height="32" class="me-2"></img>
	    	<span class="fs-4"><%=udto.getNickName()%></span>
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
					      <td>시작일시</td>
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
				<%
					if(sdto.getAddress()!=null && sdto.getProcess().equals("오프라인") && sdto.getAddress().length()!=0){%>
						 <h1>스터디 위치</h1>
						 <div id="map" class ="pb-3 mb-5" style="width:700px;height:300px;"></div>
						<!-- 카카오맵API-->	
					<%}
				%>
				
			    <h1>스터디 소개</h1>
			    <div class="border-bottom pb-3 mb-5"></div>
			   	<div>
			   		 <%=sdto.getSContent() %>
			   	</div> 
		    </div>
		  	
		</main>
		
		<% 
			
		%>
		<footer class="pt-5 my-5 text-muted border-top">
	  		<div class="mb-5">
		      <a href="javascript:history.back();" class="btn btn-danger btn-lg px-4 text text-white">이전으로</a>
		   <%if(sid!=null && cnt == 0) { %>
   				<a href="/study/studyJoinProc.jsp?sNo=<%=sNo %>" class="btn btn-warning btn-lg px-4 text text-white">참여하기</a>
   			<%}%>
		      
		  	<%if(sid!=null && (sid.equals("admin") || sdto.getSWriter().equals(sid))){ %>
	      		 <a href="/study/studyModify.jsp?sNo=<%=sNo %>" class="btn btn-primary btn-lg px-4 text text-white">수정</a>
		     	 <a href="/study/studyRemoveProc.jsp?sNo=<%=sNo %>" class="btn btn-danger btn-lg px-4 text text-white">삭제</a>
	      	<%}%>
		     
		     
	  		</div>
		</footer>
	</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b228c636b51d3c9d389fa37c9bd68e8e&libraries=services"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
	    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};  
	
	//지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new kakao.maps.MapTypeControl();
	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
	//주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	//주소로 좌표를 검색합니다
	geocoder.addressSearch('<%=sdto.getAddress()%>', function(result, status) {
	// 정상적으로 검색이 완료됐으면 
	 if (status === kakao.maps.services.Status.OK) {
	    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	    // 결과값으로 받은 위치를 마커로 표시합니다
	    var marker = new kakao.maps.Marker({
	        map: map,
	        position: coords
	    });
	    // 인포윈도우로 장소에 대한 설명을 표시합니다
	    var infowindow = new kakao.maps.InfoWindow({
	        content: '<div style="width:300px;text-align:center;padding:6px 0;"><%=sdto.getAddress()%></div>'
	    });
	    infowindow.open(map, marker);
	    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	    map.setCenter(coords);
	  
	   
	  
	} 
	}); 
		    
		   
		
	</script>
</body>
</html>
