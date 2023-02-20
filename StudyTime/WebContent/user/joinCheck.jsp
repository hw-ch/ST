<%@page import="smtp.SendMail"%>
<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.oreilly.servlet.MultipartRequest,
			com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%
	String uploadPath = application.getInitParameter("uploadPath");// 파일 업로드 폴더명 
	String savePath = application.getRealPath(uploadPath);// 실제 업로드 폴더 경로
	int maxSize = 1024 * 1024 * 5;	// 최대 업로드 크기 5MB
	String encType = "UTF-8";
	
	MultipartRequest multiReq = 
			new MultipartRequest(request, savePath, maxSize, encType, 
										new DefaultFileRenamePolicy());
	
	request.setCharacterEncoding("UTF-8");

	String id = multiReq.getParameter("userId");
	String pw = multiReq.getParameter("password");
	String name = multiReq.getParameter("name");
	String nickname = multiReq.getParameter("nickname");
	String gender = multiReq.getParameter("gender");
	String phone = multiReq.getParameter("phone");
	
	String userFileName = multiReq.getFilesystemName("image");	//이미지
	
	boolean result = UserDAO.join(id, pw, name, nickname, gender, phone, userFileName);
	
	if(result == true){
		SendMail.sending(id, name);	//메일 보내기
		out.print("회원가입 성공");
	}	else{
		out.print("회원가입 실패");
	}
%>	
