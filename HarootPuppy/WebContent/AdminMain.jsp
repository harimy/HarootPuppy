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
<title>AdminMain.jsp</title>
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
			<a href="memberadmin.action" class="menu">회원 관리</a>
		</li>
		<li>
			<a href="boardadmin.action" class="menu">게시물 관리</a>
		</li>
		<li>
			<a href="reportadmin.action" class="menu">신고 관리</a>
		</li>
		<li>
			<a href="faqadmin.action" class="menu">고객지원</a>
		</li>
	</ul>
</div>
<jsp:include page="MainFooter.jsp" />
</body>
</html>