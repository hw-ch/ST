<%
    //세션 무효화
    session.invalidate();
	response.sendRedirect("/main.jsp");
%>