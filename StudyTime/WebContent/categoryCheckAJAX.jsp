<%@page import="java.util.*"%>
<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
String check = request.getParameter("check");


if(check.equals("승인")){

UserDTO user = UserDAO.getOneTemp(id);
UserDAO.insert(id, user.getPassword(), user.getName(), user.getEmail(), user.getGender());
UserDAO.deleteTemp(id);

}else{

	UserDAO.deleteTemp(id);
	
}
%>
