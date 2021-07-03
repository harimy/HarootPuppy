<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<jsp:include page="MainHeader.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/jquery-ui.css">
<style type="text/css">
	body
	{
		margin: 0px;
	}
</style>

<!-- <script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script> -->
<%-- <script type="text/javascript" src="<%=cp%>/js/jquery-ui.js"></script> --%>

</head>
<body>
<div id="menu">
	<ul>
		<li>
			<a href="DiaryMain.jsp" class="menu">나의 반려견</a>
			<!-- <a href="diary.action" class="menu">나의 반려견</a>-->
		</li>
		<li>
			<a href="WalkMain.jsp" class="menu">산책 메이트</a>
			<!-- <a href="walk.action" class="menu">산책 메이트</a> -->
		</li>
		<li>
			<a href="BoardList.jsp" class="menu">자유게시판</a>
			<!-- <a href="board.action" class="menu">자유게시판</a> -->
		</li>
		<li>
			<a href="FaqList.jsp" class="menu">고객지원</a>
			<!-- <a href="faq.action" class="menu">고객지원</a> -->
		</li>
	</ul>
</div>

</body>
</html>