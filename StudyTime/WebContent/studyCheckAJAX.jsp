<%@page import="java.util.*"%>
<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%


	ArrayList<StudyDTO> studys = StudyDAO.getAllList();


for(StudyDTO study : studys) {
%>
 <div class="col" style="font-family: 'PyeongChangPeace-Bold';">

        <div class="card mb-4 rounded-3 shadow-sm">
                                     <div class="card-header py-3 bg-warning">
            <div class="card-title pricing-card-title display-5"><%=study.getSTitle() %></div>
          </div>
          <div class="card-body" style="height: 350px;">
          	<div style="padding-right: 400px; padding-top: 10px;">
          	<a class="btn btn-lg btn-light border-dark rounded-5" href="../product/productList.jsp"><%=study.getCategory1() %></a> 
          	<a class="btn btn-lg btn-light border-dark rounded-5" href="../product/productList.jsp"><%=study.getCategory2() %></a>
          	</div>
   
          					<input type="hidden" name="sNo" value="<%=study.getSNo() %>">

              <div style="padding-top: 50px;" class="card-title pricing-card-title h3"><%=study.getSContent() %></div>
              <div style="padding-top: 50px; padding-right: 450px;" class="card-title pricing-card-title h5">모집인원 : <%=study.getRecruitCnt() %> </div>
              <hr class="featurette-divider">
         		                
         <div style="padding-right: 400px;" class="card-title pricing-card-title h5"><img class="box" style="width: 40px; height: 40px;" src="/images/study3.png"> <%=study.getSWriter() %></div>
         
                </div>
        </div>
      </div>
	<%} %>


