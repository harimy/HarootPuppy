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
	
	a.adminMain { text-decoration: none; color: black; }
    	a.adminMain:visited { text-decoration: none; }
    	a.adminMain:hover { text-decoration: none; }
    	a.adminMain:focus { text-decoration: none; }
    	a.adminMain:hover, a:active { text-decoration: none; }
</style>
</head>
<body>

<div id="harootHeader">
	<div style="float:left; margin-right: 5px;"><a href="Main.jsp" class="adminMain">로그아웃</a></div>
	<!-- <div style="float:right;">ADMIN</div> -->
	<div style="float:right; padding-right: 5px;">ADMIN ${adminName }님, 환영합니다.</div>
	<div id="logo" style="text-align : center;">
		<!-- <a href="adminmain.action"> -->
		<!-- 메인로고 클릭하면 메인페이지로 돌아가게 수정 -->
		<a href="adminmainlogo.action">
			<img alt="" src="images/mainlogo.png" width="250px;" height="100px;" border="0">
		</a>
	</div>
</div>



</body>
</html>