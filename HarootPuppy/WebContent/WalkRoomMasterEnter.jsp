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
<title>WalkRoomMasterEnter.jsp</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	CountDownTimer('06/30/2021 09:30 PM', 'leftTime');

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
			var days = Math.floor(distance / _day);
			var hours = Math.floor((distance % _day) / _hour);
			var minutes = Math.floor((distance % _hour) / _minute);
			var seconds = Math.floor((distance % _minute) / _second);

			document.getElementById(id).innerHTML = hours + ':';
			document.getElementById(id).innerHTML += minutes + ':';
			document.getElementById(id).innerHTML += seconds;
		}

		timer = setInterval(showRemaining, 1000); // 1초마다 반복되는 함수
	}
	// Source: stackoverflow
	$(document).ready(function()
	{
		$("#matchBtn").click(function()
		{
			if ($(this).val() == "notMatched")
			{
				$(this).css("background-color", "rgb(224, 224, 224)");
				$(this).html("CANCEL");
				$(this).val("matched");
				return;
			} else if ($(this).val() == "matched")
			{
				$(this).css("background-color", "rgb(196, 91, 36)");
				$(this).html("MATCHING");
				$(this).val("notMatched");
				return;
			}

		});
	});
</script>
<!-- 부트스트랩 CSS -->
<link rel="stylesheet" href="<%=cp%>/css/bootstrap.css">

<link rel="stylesheet" type="text/css" href="css/WalkRoom.css">

<!-- 산책방 태그들 관련 css : 산책메이트 특징태그, 방장태그, 레디 태그 -->
<link rel="stylesheet" type="text/css"
	href="<%=cp%>/css/WalkRoomTags.css">

<style type="text/css">
.transparent-button {
	background-color: transparent !important;
	background-image: none !important;
	border-color: transparent;
	border: none;
	color: #FFFFFF;
}
</style>

</head>
<body>
	<jsp:include page="Main.jsp" />
	<!-- 방 개설하면서 정보 불러오기 -->
	<div>

		<!-- 방 제목 -->
		<div id="walkTitle">재롱이랑 동구랑 산책하실</div>
		<!-- 방 정보 -->
		<div id="walkInfo">
			산책 장소 : 안양천 <br> 산책 일시 : 2021년 06월 13일 18:30 ~ 21:00<br> 산책
			인원 : 최소 3명 최대 4명<br> 방장 한 마디 : 같이 즐겁게 산책해요 ~~ <br>


			<!-- 산책메이트 특징 -->
			원하는 산책 메이트 특징<br> <span id="dogSize" class="mateOp">대형견</span> <span
				id="dogSize" class="mateOp">중형견</span> <span id="gender"
				class="mateOp">동일 성별 양육자</span> <span id="mouth" class="mateOp">입질하는
				반려견 금지</span> <span id="auto" class="mateOp">자동 확정 옵션 OFF</span>
		</div>
		<br>

		<!-- 매칭 타이머 -->
		<div id="leftTimer">
			<div id="timerMsg">
				매칭 완료까지 <span id="leftTime"></span> 남음
			</div>
		</div>

		<!-- 매칭/준비 버튼 -->
		<div id="mr">
			<button type="button" id="matchBtn" value="notMatched" class="btn">MATCHING</button>
		</div>

	</div>


	<!-- 참여자 프로필 -->
	<div class="row">
		<div class="col-sm-4 col-md-3">
			<div class="thumbnail">
				<div class="nickName">
					<div class="thumbLeft">나와 재롱이와 동구<img src="images/man.png" class="icons">
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
					<h3>재롱</h3>
					<p>
						로트와일러, 3세<br> 중성화 완료<br> 입질 없음<br> 낯가림 없음<br>
					</p>
				</div>
			</div>
			<div class="masterTag">방장</div>
			<br>
		</div>

		<div class="col-sm-4 col-md-3">
			<div class="thumbnail">
				<div class="nickName">
					<div class="thumbLeft">비투더아투더뱅뱅<img src="images/man.png" class="icons">
					</div>
					<div class="thumbRight">
						<button type="button" class="menuBtn transparent-button">
  							<span class="glyphicon glyphicon-option-vertical" style="color: #000000"></span>
						</button>
					</div>
				</div>
				<br> <img class="img-responsive"
					src="<%=cp%>/images/puppy1.png">
				<div class="caption">
					<h3>코코</h3>
					<p>
						골든 리트리버, 4세<br> 중성화 완료<br> 입질 함<br> 낯가림 있음<br>
					</p>
				</div>
			</div>
			<div class="readyTag">Ready 완료</div>
		</div>

		<div class="col-sm-4 col-md-3">
			<div class="thumbnail">
				<div class="nickName">
					<div class="thumbLeft">코코는우리코코<img src="images/girl.png" class="icons">
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
					<h3>콩이</h3>
					<p>
						푸들, 5세<br> 중성화 완료<br> 입질 없음<br> 낯가림 있음<br>
					</p>
				</div>
			</div>
			<div class="notReadyTag">Ready 대기</div>
		</div>
	</div>


	<!-- 댓글 -->
	<div id="walkReply">
		<table id="replyBoard" class="table">
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

		<textarea rows="10" cols="150" placeholder="댓글을입력하세요"></textarea>
		<button type="button">등록</button>
		<!-- onclick 필요 -->
	</div>

	<!-- 방장/일반 개별 버튼 -->
	<div id="buttonArea">
		<button type="button" id="changeInfo"
			onclick="location.href='WalkRoomInsertForm.jsp'">방 정보 변경</button>
		<button type="button" id="list"
			onclick="location.href='WalkRoomList.jsp'">목록으로</button>
		<button type="button" id="delete">방 삭제하기</button>
	</div>
</body>
</html>