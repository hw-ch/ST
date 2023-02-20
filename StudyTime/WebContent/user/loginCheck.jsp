<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.*" %>

<%
    String userId = request.getParameter("userId");
    String password = request.getParameter("password");
        
        
        
    int result = UserDAO.login(userId, password);
        
    if(result ==0){        // 로그인 성공 -> 세션 생성 후 메인으로 이동
        out.print("로그인 성공");
         session.setAttribute("sid", userId);
        response.sendRedirect("/main.jsp"); 
    }    else if(result ==1){    //DB에 정보가 없음 -> 회원 가입으로 이동
         response.sendRedirect("/user/join.jsp"); 
        out.print("존재하지 않는 아이디");
    }    else{        // 비번이 틀린 경우 다시 로그인 페이지로 이동
         response.sendRedirect("/user/login.jsp"); 
        out.print("비밀번호 다름");
    }
%>