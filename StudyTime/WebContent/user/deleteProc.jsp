<!-- -------------------------------------------------------- -->
<!-- 최초작성자 : 김도영(difbfl4750@naver.com) -->
<!-- 최초작성일 : 2023/02/15 -->

<!-- 버전 기록 : ver1(시작 23/02/15) -->
<!-- -------------------------------------------------------- -->

<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"%>
<%@page import="com.oreilly.servlet.MultipartRequest,
    		com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




<%	//productRemoveProc.jsp

	//0.한글 인코딩 처리
	request.setCharacterEncoding("UTF-8");						
	response.setContentType("text/html; charset=UTF-8");

%>
	
<%-- 	<jsp:useBean id="mdao" class="market.dao.MemberDAO"/> --%>

	<sql:setDataSource 
			var="dataSource"
			driver="oracle.jdbc.OracleDriver"
			url="jdbc:oracle:thin:@localhost:1521:xe"
			user="madang"
			password="1111" />
			
	<sql:update var="result" dataSource="${dataSource }">
	DELETE member where userid=?
		<sql:param value="${sid }"/>
	</sql:update>
	result : ${result }
<%
	session.removeAttribute("sid");
	session.setAttribute("msg", "회원탈퇴 완료");
	response.sendRedirect("login.jsp");
%>





