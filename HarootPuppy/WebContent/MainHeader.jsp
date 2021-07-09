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
<%-- <link rel="stylesheet" type="text/css" href="<%=cp %>/css/menuStyle.css"> --%>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/jquery-ui.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-ui.js"></script>
<style type="text/css">
	table
	{
		width: 300px;
	}
	
	#harootHeader
	{
		padding: 5px;

		background-color: rgb(244,188,23);
	}
	
	.transparent-button
	{
	    background-color: transparent !important;
	    background-image: none !important;
	    border-color: transparent;
	    border: none;
	    color: #FFFFFF; 
	}


</style>
</head>
<body>

<div id="harootHeader">
	<div style="float:left;">로그아웃&nbsp;&nbsp;&nbsp;</div>
	<div style="float:left;">마이페이지</div>
	<div style="float:right;">알림</div>
	<div style="float:right;">환영합니다!&nbsp;&nbsp;&nbsp;</div>
	<div id="logo" style="text-align : center;">
		<button type="button" class="transparent-button"onclick="location.href='HarootPuppyMain.jsp'">
		<img alt="" src="images/mainlogo.png" width="250" height="100" border="0"></button>
	</div>
</div>

</body>
</html>