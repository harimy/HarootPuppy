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
<title>WalkRoomReportInsertSuccess.jsp</title>
<!-- jQuery JS -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-ui.js"></script>
<!-- jQuery-UI CSS -->
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/jquery-ui.css">

<!--  부트스트랩 JS -->
<script type="text/javascript" src="<%=cp%>/js/bootstrap.js"></script>
<!-- 부트스트랩 CSS -->
<link rel="stylesheet" href="<%=cp%>/css/bootstrap.css">
<script type="text/javascript">
	$(function() 
	{
	   $("#submit").click(function()
	   {
	       window.opener.location.href = "WalkMain.jsp";
	       window.close(); 
	       
	     //alert("check");
	   })	   
	   
	});
</script>
<style type="text/css">
	body {
	background-color: #EEE;
	}
</style>
</head>
<body style="text-align: center;">

<div>
	<h3>신고가 완료되었습니다.</h3>
	<h4>신고 내역은 마이페이지 > 신고 관리 내역에서 확인하실 수 있습니다.</h4>
	<br>
	<button type="button" id="submit">확인</button>
</div>

</body>
</html>