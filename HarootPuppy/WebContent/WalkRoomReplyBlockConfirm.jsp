<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WalkRoomReplyBlockConfirm.jsp</title>

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
$(function() {
	if( $('input[name="autoOption"]:checked').val() == 'undefined' )
	{
		$("#errMsg").css("display" ,"inline");
		return;
	}
	
	// 부모창 reload + 현재 확인창 닫기
	$("#submit").click(function()
	{
		window.opener.location.reload();
	    window.close();
	})
});

</script>
<style>
	body{
		background-color : #EEE;
	}
	
	#errMsg
	{
		color: red;
		font-size: small;
		display: none;
	}
	
	.replyReportConfirm
	{
		width:600px;
		margin: 0px auto;
	}
</style>
</head>
<body>
<!-----------------------------
  WalkRoomReplyBlockConfirm.jsp
  
  - 산책방 입장 이후 댓글 신고 
  → 확인 창 (새 창)
------------------------------->
	<div class="replyReportConfirm">

		<h1>댓글 신고가 완료되었습니다.</h1>
		<br>
		
		<button type="button" id="submit">확인</button>
	

		
	</div>
</body>
</html>