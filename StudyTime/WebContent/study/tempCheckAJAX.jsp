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
	String check = request.getParameter("check");
String tempSNo = request.getParameter("tempSNo");


if(check.equals("승인")){

StudyDAO.apply(tempSNo);
StudyDTO study = StudyDAO.getOneList(tempSNo);
StudyJoinDAO.insertManager(study.getSWriter(), study.getSNo());

}else{

	StudyDAO.deny(tempSNo);
	
}
%>
