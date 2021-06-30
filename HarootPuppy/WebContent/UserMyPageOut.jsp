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
<title>UserMyPageOut.jsp</title>
</head>
<body>
<div>
	<label>정말로 탈퇴를 하시궜어요?</label>
	<button type="submit">탈퇴하기</button>
</div>
</body>
</html>