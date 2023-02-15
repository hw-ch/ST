<%@page import="jdbc.UserDAO"%>
<% 

	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("password");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	
	if(UserDAO.join(id, pw, name, phone)){
		out.print("회원가입 성공");
	}
%>	