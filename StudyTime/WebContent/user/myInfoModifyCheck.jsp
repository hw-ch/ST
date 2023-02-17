<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.oreilly.servlet.MultipartRequest,
 			com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	
	String uploadPath = application.getInitParameter("uploadPath"); 	//파일 업로드 폴더명
	String savePath = application.getRealPath(uploadPath);	//실제 업로드 폴더 경로
	int maxSize = 1024 * 1024 * 5;	//최대 업로드 크기 5MB
	String encType = "UTF-8";
	System.out.println(savePath);
	
	MultipartRequest multiReq = new MultipartRequest(request, savePath, maxSize, encType, new DefaultFileRenamePolicy());	%>
	
	<sql:setDataSource var="dataSource"
					   driver="com.mysql.jdbc.Driver"
					   url="jdbc:mysql://localhost:3306/studytime?serverTimezoneUTC"
					   user="studytime"
				       password="0000" 	/>
		
	<sql:update var="result" dataSource="${dataSource }">
		UPDATE	user
		SET 	userId=?, password=?, nickName=?, name=?,
				gender=?, image=?(?, 'default.png'), phone=? 
		WHERE	userId=?
		<sql:param value='<%=multiReq.getParameter("userId")%>'/> 
		<sql:param value='<%=multiReq.getParameter("password")%>'/>
		<sql:param value='<%=multiReq.getParameter("nickName")%>'/>
		<sql:param value='<%=multiReq.getParameter("name")%>'/>
		<sql:param value='<%=multiReq.getParameter("gender")%>'/>
		<sql:param value='<%=multiReq.getFilesystemName("image")%>'/>
		<sql:param value='<%=multiReq.getParameter("phone")%>'/>
	</sql:update>
	
<%
	session.setAttribute("msg", "내 정보 수정 성공");	//세션의 msg 속성에 '상품 수정 성공'을 저장하고
	response.sendRedirect("myInfo.jsp");		//상품편집 화면으로 리다이렉트
%>	
	