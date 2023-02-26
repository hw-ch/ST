<!-- -------------------------------------------------------- -->
<!-- 최초작성자 : 김도영(difbfl4750@naver.com) -->
<!-- 최초작성일 : 2023/02/15 -->

<!-- 버전 기록 : ver1(시작 23/02/15) -->
<!-- -------------------------------------------------------- -->
<%@page import="java.util.*"%>
<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String category3 = request.getParameter("category3");
ArrayList<StudyDTO> studys = StudyDAO.getAllCategoryList(category3);

for(StudyDTO study : studys) {
	String userid = study.getSWriter();
	UserDTO user = UserDAO.getOneList(userid);
%>
<div onclick="location.href = '/study/studyView.jsp?sNo=<%=study.getSNo() %>'" style="cursor: pointer;">
 <div class="col" style="font-family: 'PyeongChangPeace-Bold';">

        <div class="card mb-4 rounded-3 shadow-sm">
                                     <div class="card-header py-3 bg-warning">
            <div class="card-title pricing-card-title display-5"><%=study.getSTitle() %></div>
          </div>
          <div class="card-body" style="height: 350px;">
          	<div style="padding-right: 200px; padding-top: 10px;">
          	<a class="btn btn-lg btn-light border-dark rounded-5" href="../product/productList.jsp"><%=study.getCategory1() %></a> 
          	 <a class="btn btn-lg btn-light border-dark rounded-5" href="../product/productList.jsp"><%=study.getCategory2() %></a>
          	</div>
              <div style="padding-top: 50px;" class="card-title pricing-card-title h3">
               <%if(study.getSContent().length() >= 20){
            	  %><%=study.getSContent().substring(0, 20) + "..." %>
              <%}else{ %>
              <%=study.getSContent() %><%} %></div>
              <div style="padding-top: 50px; padding-right: 300px;" class="card-title pricing-card-title h5">모집인원 : <%=study.getRecruitCnt() %> </div>
              <hr class="divider">
         		                
         <div style="padding-right: 250px;" class="card-title pricing-card-title h5"><img class="box" style="width: 40px; height: 40px;" src="/images/study3.png"> <%=user.getNickName() %></div>
         
                </div>
        </div>
      </div>
     </div>
	<%} %>
	
	