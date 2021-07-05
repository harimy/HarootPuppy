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
<title>WalkRoomReportInsertForm.jsp</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/jquery-ui.css">
<script type="text/javascript">
	$(function()
	{
		$("#report").click(
				function()
				{
					//alert("됨");
					// 데이터 검사(공란이 있는지 없는지에 대한 여부 확인)
					$("#errForm").css("display", "none");

					// alert($('input:radio[name="walkRoomReportInsert"]:checked').val());

					if (typeof $('input:radio[name="walkRoomReportInsert"]:checked').val() == 'undefined') )
					{
						$("#errForm").css("display", "inline");
						return; 
					}
		

					if ($("#etcWrite").html()=="")
					{
						$("#errForm").css("display", "inline");
						return;
					}
					// $('input:radio[name="walkRoomReportInsert"]:checked').val() == 'etc' && 
					("#reportForm").submit();

				});
	});

	function openChild()
	{

		var _width = '650';
		var _height = '380';

		// 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
		var _left = Math.ceil((window.screen.width - _width) / 2);
		var _top = Math.ceil((window.screen.height - _height) / 2);

		/* window.open('WalkRoomReportInsertSuccess.jsp', 'popup-test', 'width='
				+ _width + ', height=' + _height + ', left=' + _left + ', top='
				+ _top); */
				
	}
</script>
<style type="text/css">
#errForm {
	color: red;
	font-size: small;
	display: none;
}
</style>
</head>
<body style="text-align: center;">

	<div>
		<h3>
			<p>
				산책 메이트 방을 신고하시겠습니까?<br> 신고 사유를 선택해주십시오.</p>
		</h3>
	</div>

	<div>
		<form id="reportForm">
			<input type="radio" id="sexual" name="walkRoomReportInsert"
				value="sexual"> <label for="sexual">불건전한 목적의 방</label> <br>
			<input type="radio" id="curse" name="walkRoomReportInsert"
				value="curse"> <label for="curse">비방 / 욕설<br></label> 
			<input type="radio" id="etc" name="walkRoomReportInsert" value="etc">
			<label for="etc">기타(직접 입력)</label><br>
			<textarea rows="10" cols="30" id="etcWrite" name="etcWrite"></textarea>
		</form>
	</div>
	<br>
	<div>
		<button type="button" id="report" onclick="openChild()" value="report">확인</button>
		<button type="button">취소</button>
		<span id="errForm">필수 입력 항목을 입력하세요.</span>
	</div>


					if ($('input:radio[name="walkRoomReportInsert"]:checked').val()=='etc' && $("#etcWrite").val()=="")
					{
						$("#errForm").css("display", "inline");
						return; 
						//alert(check);
					}
					// $('input:radio[name="walkRoomReportInsert"]:checked').val() == 'etc' && 
					//$("#reportForm").submit();
					
					/* openChild(); */
					
					document.replyReport.submit();
				});
		});

	function reportReply()
	{
		var forsubmit = document.replyReport;
		
		if(forsubmit.walkRoomReportInsert.val() == "")
		{
			alert("안됨");
		}
		
		
	}
</script>
<style type="text/css">
	#errForm {
		color: red;
		font-size: small;
		display: none;
	}
	
	body {
		background-color: #EEE;
	}
</style>
</head>
<body style="text-align: center;">
<div class="replyReport">
	<form action="WalkRoomReportInsertSuccess.jsp" method="post" name="replyReport">
		<h3>
			<p>
				산책 메이트 방을 신고하시겠습니까?	
				<br>신고 사유를 선택해주십시오.
			</p>
		</h3>
		<br>
		<input type="radio" id="sexual" name="walkRoomReportInsert" value="sexual">
		<label for="sexual">불건전한 목적의 방</label> <br>
		<input type="radio" id="curse" name="walkRoomReportInsert" value="curse"> 
		<label for="curse">비방 / 욕설<br></label> 
		<input type="radio" id="etc" name="walkRoomReportInsert" value="etc">
		<label for="etc">기타(직접 입력)</label><br>
		<textarea rows="10" cols="30" id="etcWrite" name="etcWrite"></textarea>
		<br>
		<button type="button" id="report" value="report" onclick="openChild()">확인</button>
		<button type="button">취소</button>
		<span id="errForm">필수 입력 항목을 입력하세요.</span>
	</form>
</div>
  
</body>
</html>