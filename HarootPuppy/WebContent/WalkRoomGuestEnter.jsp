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
<title>WalkRoomGuestEnter.jsp</title>

<!-- 부트스트랩 CSS -->
<link rel="stylesheet" href="<%=cp%>/css/bootstrap.css">

<!-- 산책방 관련 css : 산책메이트 특징태그, 방장태그, 레디 태그 -->
<link rel="stylesheet" type="text/css" href="css/WalkRoom.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/WalkRoomTags.css">

<style type="text/css">
	.transparent-button	
	{
	    background-color: transparent !important;
	    background-image: none !important;
	    border-color: transparent;
	    border: none;
	    color: #FFFFFF; 
	}
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	CountDownTimer("${room.walkroom_start }", 'leftTime');

	function CountDownTimer(walkStart, id)
	{
		var end = new Date(walkStart);

		var _second = 1000;
		var _minute = _second * 60;
		var _hour = _minute * 60;
		var _day = _hour * 24;
		var timer;

		function showRemaining()
		{
			var now = new Date();
			var distance = end - now;
			if (distance < 0)
			{
				clearInterval(timer); // 반복되는 함수를 종료
				document.getElementById("leftTimer").innerHTML = '산책 완료';

				return;
			}
			
			if( days > 0) remain += days + "일 ";
			if( hours < 10) hours = "0" + hours;
			remain += hours + ":";
			if( minutes < 10) minutes = "0" + minutes;
			remain += minutes + ":";
			if( seconds < 10) seconds = "0" + seconds;
			remain += seconds + "";
			
			document.getElementById(id).innerHTML = remain;
		}

		timer = setInterval(showRemaining, 1000); // 1초마다 반복되는 함

	};
	// Source: stackoverflow

	$(document).ready(function()
	{	
		//alert($("#readyBtn").val());
		
		if( $("#readyBtn").val() == "1" ) // 레디 완료 상태면
		{
			$("#readyBtn").css("background-color", "rgb(224, 224, 224)");
			$("#readyBtn").html("CANCEL");
		}
		else if( $("#readyBtn").val() == "0" ) // 레디 대기 상태면
		{
			$("#readyBtn").css("background-color", "rgb(232, 159, 60)");
			$("#readyBtn").html("READY");
		}
		
		$("#readyBtn").click(function()
		{
			//alert("READY 버튼 눌림"); 
			if ( $(this).val() == "1" )		// 레디 완료 상태면
			{
				$(this).css("background-color", "rgb(224, 224, 224)");
				$(this).html("CANCEL");
				$(this).val("0");
			}
			else if ( $(this).val() == "0" )	// 레디 대기 상태면
			{
				$(this).css("background-color", "rgb(232, 159, 60)");
				$(this).html("READY");
				$(this).val("1");
			}
			
			$(location).attr("href"
					, "readystateupdate.action?readystate=" + $(this).val());
			
		});
	});
	
	function openChild()
	{
	    // window.name = "부모창 이름"; 
	    window.name = "parentForm";
	    // window.open("open할 window", "자식창 이름", "팝업창 옵션");
	    openWin = window.open("WalkRoomReplyBlock.jsp",
	            "childForm", "width=570, height=350, resizable = no, scrollbars = no");    
	}

</script>

</head>
<body>
<!-----------------------------
   WalkRoomGuestEnter.jsp
   - 일반 사용자용 산책방 페이지 
------------------------------->

<!-- 메뉴영역 주석처리 : 산책방 안에서는 메뉴 필요 X -->
<%-- 
<div id="harootHeader">
	<c:import url="Main.jsp"></c:import>
</div>
--%>

<!-- content 영역 -->
<div id="harootContent">
	<!-- 방 정보 불러오기 -->
	
	<form class="alignCenter" id="roomForm">

		<!-- 방 제목 -->
		<div id="walkTitle">${room.walkroom_title }</div> 
		<!-- 방 정보 -->
		<div id="walkInfo">
			산책 장소 : ${room.walkroom_place } <br> 산책 일시 : ${room.walkroom_start } ~ ${room.walkroom_end }<br> 산책
			인원 : 최소 ${room.walkroom_min }명 최대 ${room.walkroom_max }명<br> 방장 한 마디 : ${room.walkroom_words } <br>

			<!-- 산책메이트 특징 -->
			원하는 산책 메이트 특징<br>
			<span id="dogDesex" class="mateOp"> ${room.desex_content } </span>
			<span id="gender" class="mateOp"> 양육자 성별 ${room.samesex_content } </span>
			<span id="mouth" class="mateOp"> ${room.bite_content } </span>
			<span id="auto" class="mateOp"> ${room.auto_content } </span><br>
		</div>
		<br>
		
		<!-- 매칭 타이머 -->
		<div id="leftTimer">
			매칭 완료까지 <span id="leftTime"></span> 남음
		</div>

		<!-- 매칭/준비 버튼 -->
		<button type="button" id="readyBtn" class="btn" value="${room.readystate_code }">READY</button>
		<br><br>

		<!-- 참여자 프로필 -->
		<div class="row">
			<c:forEach var="rs" items="${rooms }">
				<div class="col-sm-4 col-md-3">
					<div class="thumbnail">
						<div class="nickName">
							<div class="thumbLeft">${rs.mem_nickname }<img src="${ rs.mem_gender == 'F' ? 'images/girl.png'  : 'images/man.png' }" class="icons">
							</div>
							<div class="thumbRight">
								<button type="button" class="menuBtn transparent-button">
		  							<span class="glyphicon glyphicon-option-vertical" style="color: #000000"></span>
								</button>
							</div>
						</div>
						<br> <img class="img-responsive"
							src="<%=cp%>/images/jaerong.jpg">
						<div class="caption">
							<div style="font-size: 20px; font-weight: bold;">${rs.pet_name } (${rs.pet_type_name }, ${rs.pet_age })</div><br>

							<p style="display: inline-block;">
								${rs.pet_desex_content }<br> ${rs.pet_bite_content }<br>
								${rs.pet_char1_content}<br> ${rs.pet_char2_content }<br> ${rs.pet_char3_content }<br> ${rs.pet_char4_content }<br>
							</p>
						</div>
					</div>
					<div class="masterTag" style="${ rs.walkroom_leader == rs.sid_code ? ''  : 'display: none;' }">방장</div>
					<div class="notReadyTag" style="${ rs.walkroom_leader != rs.sid_code && rs.readystate_code == '0' ? ''  : 'display: none;' }">Ready 대기</div>
					<div class="readyTag" style="${ rs.walkroom_leader != rs.sid_code && rs.readystate_code == '1' ? ''  : 'display: none;' }">Ready 완료</div>
					<br>
				</div>
			</c:forEach>
		</div>
	
		<!-- 댓글  -->
		<div id="walkReply">
			<table id="replyBoard" class="table">
				<tr id="reply">
					<td><span id="nickName">진수123</span></td>
					<td>산책끝나고 치맥어떠시어요?</td>
					<td>06/28/09:23</td>
					<td><button type="button" class="transparent-button"
					onclick="openChild()"><img src="images/report.jpeg" class="icons"></button></td>
				</tr>
				<tr id="reply">
					<td><span id="nickName">진수사냥꾼</span></td>
					<td>이상한 소리좀 하지마라 ㅅㅂ</td>
					<td>06/28/14:21</td>
					<td><button type="button" class="transparent-button"
					onclick="openChild()"><img src="images/report.jpeg" class="icons"></button></td>
				</tr>
			</table>
	
			<div class="newReply">
				<textarea rows="3" cols="80" placeholder="댓글을 입력하세요."></textarea>
				<button type="button" id="insertReply">등록</button>
				<!-- onclick 필요 -->
			</div>
		</div>
		<br><br>
	
		<!-- 방장/일반 개별 버튼 -->
		<div id="buttonArea" style="float: right;">
			<button type="button" id="list" onclick="location.href='walkroommain.action'">목록으로</button>
			<button type="button" id="out" onclick="location.href='walkroomexit.action'">방 나가기</button>
		</div>
		<br><br>
	
	</form>
</div>
</body>
</html>