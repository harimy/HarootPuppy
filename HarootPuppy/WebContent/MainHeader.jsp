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
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/jquery-ui.css">

<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-ui.js"></script>
<style type="text/css">
table {
	width: 300px;
}
#harootHeader {
	padding: 5px;
	background-color: rgb(244, 188, 23);
}
.transparent-button {
	background-color: transparent !important;
	background-image: none !important;
	border-color: transparent;
	border: none;
	color: #FFFFFF;
}
#notice, #myPage{
	display: none;
}
span{
	margin: 5px;
}
</style>
<script type="text/javascript">
	$(document).ready(function()
	{
		$('#loginCheck').click(function()
		{
			alert($('#loginCheck1').val());
		});
		
		$("#myPage").css('display', "none");
		$("#notice").css('display', "none");
		
		if (  $("#loginCheck1").val() != "")
		{
			$("#log").attr("onclick", "location.href='logoutmem.action'");
			$("#log").html("로그아웃");
			$("#myPage").css('display', "inline-block");
			$("#notice").css('display', "inline-block");
			var nickname = $("#nickname").val();
			// alert(nickname);
			$("#welcome").html(nickname + " 님 환영합니다!");
			$("#welcome").attr("onclick", "");
		}
		
		if (  $("#loginCheck1").val() == null || $("#loginCheck1").val() == "" )
		{
			$("#log").attr("onclick", "location.href='login.action'");
			$("#log").html("로그인");
			$("#myPage").css('display', "none");
			$("#notice").css('display', "none");
			var nickname = $("#nickname").val();
			// alert(nickname);
			$("#welcome").html("회원가입");
			$("#welcome").attr("onclick", "location.href='registerform.action'");
		}
		if (  $("#loginCheck1").val() == null)
		{
			$("#log").attr("onclick", "location.href='login.action'");
			$("#log").html("로그인");
			$("#myPage").css('display', "none");
			$("#notice").css('display', "none");
			var nickname = $("#nickname").val();
			// alert(nickname);
			$("#welcome").html("회원가입");
			$("#welcome").attr("onclick", "location.href='registerform.action'");
		}
	});
	
</script>
</head>
<body>
	<form method="POST">
		<div id="harootHeader">
			<div style="float: left;">
				<span id="log" onclick="location.href='login.action'">로그인&nbsp;&nbsp;&nbsp;</span>
			</div>
			<div style="float: left;">
				<span id="myPage" onclick="location.href='UserMyPage.jsp'">마이페이지</span>
			</div>
			<div style="float: right;">
				<span id="notice">알림</span>
			</div>
			<div style="float: right;">
				<span id="welcome" onclick="location.href='registerform.action'">회원가입</span>&nbsp;&nbsp;&nbsp;
			</div>
			<div id="logo" style="text-align: center;">
				<button type="button" class="transparent-button"
					onclick="location.href='beforemain.action'">
					<img alt="" src="images/mainlogo.png" width="250" height="100"
						border="0">
				</button>
				<!-- <button type="button" id="loginCheck"></button> -->
				<input type="hidden" id="loginCheck1" value="${sid_code }">
				<input type="hidden" id="nickname" value="${nickname }">
			</div>
		</div>
	</form>

</body>
</html>