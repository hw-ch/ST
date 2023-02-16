<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>uploadFrom.jsp</title>
</head>
<body>
	<h3>FILE UPLOAD with cos.jar</h3>
	<!--input type가 file이면 꼭 enctype를 multipart ~를 써야한다.  -->
	<form action="test2.jsp" method="post"
			enctype="multipart/form-data">
	이름 : <input type="text" name="usernm"><br>
	첨부파일 : <input type="file" name="userfile" multiple="multiple"><hr>
	<input type="submit" value="전송">
	</form>

</body>
</html>