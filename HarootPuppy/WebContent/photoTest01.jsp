<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test1.jsp</title>
</head>
<body>

	<!-- 『enctype="multipart/form-data"』 : 파일을 물리적으로 업로드 하기 위한 필수 속성  -->
	<!-- 									→ 바이너리 형태로 전달 -->
	<form action="photoTest02.jsp" method="post" enctype="multipart/form-data">
		이름 : <input type="text" name="name"><br>
		파일 : <input type="file" name="upload"><br>
		<input type="submit" name="전송"><br>
	</form>

</body>
</html>