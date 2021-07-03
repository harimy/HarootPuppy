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
<title>Main.jsp</title>
<style type="text/css">
	body
	{
		margin: 0px;
	}
</style>

</head>
<body>

<div id="menu">
	<ul>
		<li>
			<a href="diary.action" class="menu">나의 반려견</a>
		</li>
		<li>
			<a href="walk.action" class="menu">산책 메이트</a>
		</li>
		<li>
			<a href="board.action" class="menu">자유게시판</a>
		</li>
		<li>
			<a href="faq.action" class="menu">고객지원</a>
		</li>
	</ul>
</div>

</body>
</html>