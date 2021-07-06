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
<title>WalkRoomReplyBlock.jsp</title>

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
	$("#register").click(function()
	{
		// alert($('input[name="reportOption"]:checked').val());
		if(typeof $('input[name="reportOption"]:checked').val() == 'undefined' )
		{
			 $("#errMsg").css("display" ,"inline");
			 return ; 
			//alert("됨");
		} 
		
		document.replyReport.submit();
		// form을 일단 넘기고 속성값은 나중에 받아가기
	});
	
	$("#cancel").click(function()
		{
			window.close();
		});
}); 


function reportReply()
{
	var forsubmit = document.replyReport;
	
	if(forsubmit.reportOption.val() == "")
	{
		alert("안됨");
	}
	
	
}



</script>
<style>
	body
	{
		background-color : #EEE;
	}
	
	#errMsg
	{
		color: red;
		font-size: small;
		display: none;
	}
	
	.replyReport
	{
		width:600px;
		margin: 0px auto;
	}
</style>
</head>
<body>
<!-----------------------------
  WalkRoomReplyBlock.jsp
  
  - 산책방 입장 이후 댓글 신고
------------------------------->
	<div class="replyReport">
	<form action="WalkRoomReplyBlockConfirm.jsp" method="post" name="replyReport">

		<h1>댓글 신고하기</h1>
		<br>
		
		<h3>내용 : 우와</h3>
		<br>
		
		<h3>※ 사유선택 (여러 사유에 해당되는 경우 대표 1가지 사유만 선택해주세요)</h3>
		<input type="radio" name="reportOption" class="reportOption"id="replyReport1"
		value="스팸"> 
		<label for="replyReport">스팸/광고/도배 컨텐츠</label> 
		<br>
		<input type="radio" name="reportOption" class="reportOption"id="replyReport2"
		value="음란"> 
		<label for="replyReport">음란/외설적인 컨텐츠</label> 
		<br>
		<input type="radio" name="reportOption" class="reportOption"id="replyReport3"
		value="폭력"> 
		<label for="replyReport">폭력/혐오 컨텐츠</label>
		<br>
		<input type="radio" name="reportOption" class="reportOption"id="replyReport4"
		value="증오"> 
		<label for="replyReport">증오/학대 컨텐츠</label>
		<br> 
		<input type="radio" name="reportOption" class="reportOption"id="replyReport5"
		value="유해"> 
		<label for="replyReport">유해/위험 컨텐츠</label> 
		<br>
		<input type="radio" name="reportOption" class="reportOption"id="replyReport6"
		value="기타"> 
		<label for="replyReport">기타(사유 직접입력)</label> 
		<br><br>

		<button type="button" id="cancel">취소</button>
		<button type="button" id="register">확인</button>
		<span id="errMsg">필수 선택 사항을 선택하세요</span>
	

	</form>	
	</div>
</body>
</html>