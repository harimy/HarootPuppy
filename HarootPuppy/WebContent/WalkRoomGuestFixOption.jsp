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
<title>WalkRoomGuestFixOption.jsp</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/jquery-ui.css">
<script type="text/javascript">
	$(function() {
		$("#enter").click(function() {
			$("#errMsg").css("display", "none");
			if ($("input:radio[name='autoOption']").is(":checked") == false) {
				$("#errMsg").css("display", "inline");
				return;
			}

			// $("input:radio[name='autoOption']:checked").val() 넘겨주며
			window.opener.location.href = "WalkRoomGuestEnter.jsp";
			//자식 창 닫기
			window.close();
		});
		

	});
	
	function openCommReportChild()
	{
	    // window.name = "부모창 이름"; 
	    window.name = "parentForm";
	    // window.open("open할 window", "자식창 이름", "팝업창 옵션");
	    openWin = window.open("WalkRoomReportInsertForm.jsp",
	            "childForm", "width=570, height=350, resizable = no, scrollbars = no");
	    
	    close.window();
	  
	} 
	
	/* $("#enter").click(function() {
		
		window.opener.location.href = "WalkRoomReportInsertForm.jsp";
		//자식 창 닫기
		window.close();
	}); */


</script>
<style>
body {
	background-color: #EEE;
}

#errMsg {
	color: red;
	font-size: small;
	display: none;
}
</style>
</head>
<body>
	<!-----------------------------
  WalkRoomGuestFixOption.jsp
  
  일반회원이 산책방 입장 시 뜨는 
  자동 선택 옵션 창
------------------------------->
	<div>
		<form action="WalkRoomGuestEnter.jsp">
			<h1>[Ready] 고정 옵션을 활성화 하시겠습니까?</h1>
			<br>
			<h3>※ [Ready] 고정 옵션 활성화 시, 방 옵션 또는 다른 참여자의 Ready 상태 변화에 상관 없이
				[Ready] 상태를 유지하게 됩니다.</h3>
			<input type="radio" name="autoOption" class="autoOption" id="deactive"> 
			<label for="deactive">비활성화</label> 
			<input type="radio" name="autoOption" class="autoOption" id="active">
			<label for="active">활성화</label><br><br>
			<button type="button" id="cancel" onclick="window.close()">취소</button>
			<button type="button" id="enter" onclick="location.href='walkroomview.action'">입장</button>
			<span id="errMsg">필수 선택 사항을 선택하세요</span><br><br>
		</form>
	</div>
	<div class="replyReport">
		<form action="WalkRoomReportInsertForm.jsp">
			<details>
				<summary>이 방에 대한 문제를 제기하겠습니까?</summary>
				<div>
					<button type="button" id="report" onclick="openCommReportChild()">신고하기</button>
				</div>
			</details>
		</form>
	</div>
</body>
</html>