<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String message = request.getParameter("message");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WalkRoomMasterEnter.jsp</title>

<!-- 부트스트랩 CSS -->
<link rel="stylesheet" href="<%=cp%>/css/bootstrap.css">

<link rel="stylesheet" type="text/css" href="css/WalkRoom.css">

<!-- 산책방 태그들 관련 css : 산책메이트 특징태그, 방장태그, 레디 태그 -->
<link rel="stylesheet" type="text/css"
	href="<%=cp%>/css/WalkRoomTags.css">

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

<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
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
			var remain = "";
			
			if (distance < 0)
			{
				clearInterval(timer); // 반복되는 함수를 종료
				document.getElementById("leftTimer").innerHTML = '산책 완료';

				return;
			}
			
			var days = Math.floor(distance / _day);
			var hours = Math.floor((distance % _day) / _hour);
			var minutes = Math.floor((distance % _hour) / _minute);
			var seconds = Math.floor((distance % _minute) / _second);
			
			if( minutes == 30 )	// 산책 시작 시간까지 30분 남은 시점
			{
				// 매칭 버튼 클릭 기능
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

		timer = setInterval(showRemaining, 1000); // 1초마다 반복되는 함수
	}
	// Source: stackoverflow
	$(document).ready(function()
	{
		
		//alert($("#message").val());
		//alert($("#matchBtn").val());
		
		if($("#message").val() != "" && $("#message").val() != null)
		{
			if( $("#message").val() == "minMemError" )
			{
				alert("참여인원이 최소인원보다 많아야 합니다.");
				$("#message").val("");
			}
			else if( $("#message").val() == "readyStateError" )
			{
				alert("참여인원이 모두 READY 완료 상태여야 합니다.");
				$("#message").val("");
			}
			else if ( $("#message").val() == "Matched" )
			{
				alert("매칭이 성공적으로 완료되었습니다.");
				$("#message").val("");
			}
			else if ( $("#message").val() == "MatchCancel" )
			{
				alert("매칭이 취소되었습니다.");
				$("#message").val("");
			}
		}
		
		if( $("#matchBtn").val() == "1" ) // 매칭 완료 상태면
		{
			$("#matchBtn").css("background-color", "rgb(224, 224, 224)");
			$("#matchBtn").html("CANCEL");
		}
		else if( $("#matchBtn").val() == "0" ) // 매칭 대기 상태면
		{
			$("#matchBtn").css("background-color", "rgb(196, 91, 36)");
			$("#matchBtn").html("MATCHING");
		}
		
		$("#matchBtn").click(function()
		{
			
			if ($(this).val() == "1")
			{
				$(location).attr("href"
						, "walkroommatchcancel.action?num=${room.walkroom_code }");
				return;
			}
			else if ($(this).val() == "0")
			{
				$(location).attr("href"
						, "walkroommatch.action?num=${room.walkroom_code }");
				return;
			}

		});
		
	});
		
	$(function()
	{
		$("#changeRoomInfo").click(function()
		{
			//alert("방 정보 버튼 클릭");
			//alert($(this).val());
			$(location).attr("href", "walkroomupdateform.action?num=" + $(this).val());
		});
		
		
		$("#deleteRoom").click(function()
        {
			//alert("방 삭제 버튼 클릭");
          	if (confirm("이 산책방을 정말 삭제하시겠습니까?")) // 패널티에 대한 안내문구 추가하기
          	{
            	 $(location).attr("href", "walkroomdelete.action?num=" + $(this).val());
        	}
       	});
		
	});
</script>

<script type="text/javascript">
	function closeChild()
	{
		// 부모창 페이지 이동
		opener.location.href="walkroommaster.action"; 

		//자식 창 닫기
		window.close();
	}
</script>


</head>
<body onload="closeChild()">
<!-----------------------------
   WalkRoomMasterEnter.jsp
   - 방장용 산책방 페이지 
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
	
	<div class="alignCenter">
		<input type="hidden" id="message" value=<%=message %>>

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
		 	산책 시작까지 <span id="leftTime"></span> 남음
		</div>
	
		<!-- 매칭/준비 버튼 -->
		<button type="button" id="matchBtn" value="${matchState }" class="btn">MATCHING</button>
		<br><br>
	
		<!-- 참여자 프로필 -->
		<div class="row">
			<c:forEach var="rs" items="${rooms }" >
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
							<div style="display: inline-block;">
								<p style="display: inline-block;">
									${rs.pet_desex_content }<br> ${rs.pet_bite_content }<br>
									${rs.pet_char1_content}<br> ${rs.pet_char2_content }<br> ${rs.pet_char3_content }<br> ${rs.pet_char4_content }<br>
								</p>
							</div>
						</div>
					</div>
					<div class="masterTag" style="${ rs.walkroom_leader == rs.sid_code ? ''  : 'display: none;' }">방장</div>
					<div class="notReadyTag" style="${ rs.walkroom_leader != rs.sid_code && rs.readystate_code == '0' ? ''  : 'display: none;' }">Ready 대기</div>
					<div class="readyTag" style="${ rs.walkroom_leader != rs.sid_code && rs.readystate_code == '1' ? ''  : 'display: none;' }">Ready 완료</div>
					<br>
				</div>
			</c:forEach>	 
		</div>
	
	
		<!-- 댓글 -->
		<div id="walkReply">
			<table id="replyBoard" class="table replyArea">
				<tr id="reply">
					<td><span id="nickName">진수123</span></td>
					<td>산책끝나고 치맥어떠시어요?</td>
					<td>06/28/09:23</td>
					<td><button type="button" class="transparent-button">
							<img src="images/report.jpeg" class="icons">
						</button></td>
				</tr>
				<tr id="reply">
					<td><span id="nickName">진수사냥꾼</span></td>
					<td>이상한 소리좀 하지마라 ㅅㅂ</td>
					<td>06/28/14:21</td>
					<td><button type="button" class="transparent-button">
							<img src="images/report.jpeg" class="icons">
						</button></td>
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
			<button type="button" id="changeRoomInfo" value="${room.walkroom_code }" 
			name="changeRoomInfo">방 정보 수정</button>
			<button type="button" id="goToList" onclick="location.href='walkroommain.action'">목록으로</button>
			<button type="button" id="deleteRoom" value="${room.walkroom_code }" 
			name="deleteRoom">방 삭제</button>
		</div>
		<br><br>
	
	</div>
</div>
</body>
</html>