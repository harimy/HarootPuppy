<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<jsp:include page="AdminMainHeader.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminMain.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/drop.css">
<style type="text/css">
	
</style>

<!-- <script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script> -->
<%-- <script type="text/javascript" src="<%=cp%>/js/jquery-ui.js"></script> --%>

</head>
<body>
<header id="topbox">
<nav id="gnbBox">
<ul id="gnb">
	<li><a href="">회원관리</a>
		<ol class="submenu1">
			<li><a href="AllUserInfoList.jsp">전체 회원정보 조회</a></li>
			<li><a href="OutUserInfoList.jsp">탈퇴 회원정보 조회</a></li>
			<li><a href="AdminInfoList.jsp">관리자 정보 조회</a></li>
		</ol>
	</li>
	<li><a href="">게시물 관리</a></li>
	<li><a href="">신고관리</a>
		<ol class="submenu2">
			<li><a href="">게시판 신고</a></li>
			<li><a href="">산책메이트 온라인 신고</a></li>
			<li><a href="">산책메이트 오프라인 신고</a></li>
		</ol>
	</li>
	<li><a href="">고객지원</a>
		<ol class="submenu3">
			<li><a href="">전체</a></li>
			<li><a href="">미처리</a></li>
			<li><a href="">신고해제</a></li>
			<li><a href="">신고처리</a></li>
		</ol>
	</li>
</ul>
</nav>
</header>

</body>
</html>