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
<title>WalkFinishedInfo.jsp</title>

<!-- jQuery JS -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-ui.js"></script>
<!-- jQuery-UI CSS -->
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/jquery-ui.css">

<!--  부트스트랩 JS -->
<script type="text/javascript" src="<%=cp%>/js/bootstrap.js"></script>
<!-- 부트스트랩 CSS -->
<link rel="stylesheet" href="<%=cp%>/css/bootstrap.css">

<link rel="stylesheet" type="text/css" href="css/WalkRoom.css">

<!-- 산책방 태그들 관련 css : 산책메이트 특징태그, 방장태그, 레디 태그 -->
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

</head>
<body>

<!----------------------------------------------------
   WalkFinishedInfo.jsp
   - 산책 히스토리 > 산책 완료 탭의 정보보기 버튼 클릭시 뜨는 페이지
   - 방의 정보를 수정, 삭제 할 수 없으며 댓글을 달 수도 없음
----------------------------------------------------->
	<div>
		<!-- 메뉴영역 -->
		<div id="harootHeader">
			<c:import url="Main.jsp"></c:import>
		</div>

		<!-- content 영역 -->
		<div id="harootContent">
			<!-- 방 개설하면서 정보 불러오기 -->
			<div>

				<!-- 방 제목 -->
				<div id="walkTitle">재롱이랑 동구랑 산책하실</div>
				<!-- 방 정보 -->
				<div id="walkInfo">
					산책 장소 : 안양천 <br> 산책 일시 : 2021년 06월 13일 18:30 ~ 21:00<br>
					산책 인원 : 최소 3명 최대 4명<br> 방장 한 마디 : 같이 즐겁게 산책해요 ~~ <br>

					<!-- 산책메이트 특징 -->
					원하는 산책 메이트 특징<br>
					<span id="dogSize" class="mateOp"> 대형견 </span>
					<span id="dogSize" class="mateOp"> 중형견 </span>
					<span id="gender" class="mateOp"> 동일 성별 양육자 </span>
					<span id="mouth" class="mateOp"> 입질하는 반려견 금지 </span>
					<span id="auto" class="mateOp"> 자동 확정 옵션 OFF </span><br>
				</div>
				<br>
			</div>

			<!-- 참여자 프로필 -->
			<!-- 
			<div id="profileArea">
				<div id="nickName">
					나와 재롱이와 동구<img src="images/man.png" class="icons">
				</div>
				<div id="score">산책점수 85</div>
				<div id="profile">
					<img src="images/jaerong.jpg"><br> 재롱<br> 로트와일러,
					3세<br> 중성화 완료<br> 입질 없음<br> 낯가림 없음<br> <span
						id="status">방장</span>
				</div>
			</div>
			 -->

			<div class="row">
				<div class="col-sm-4 col-md-3">
					<div class="thumbnail">
						<div class="nickName">
							<div class="thumbLeft">나의 재롱이와 동구<img src="images/man.png" class="icons">
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
				</div>
			</div>


			<!-- 댓글 -->
			<div id="walkReply">
				<table id="replyBoard" class="table">
					<tr id="reply">
						<td><span id="nickName">진수123</span></td>
						<td>산책끝나고 치맥어떠시어요?</td>
						<td>06/28/09:23</td>
						<td>
							<button type="button" class="transparent-button">
								<img src="images/report.jpeg" class="icons">
							</button>
						</td>
					</tr>
					<tr id="reply">
						<td><span id="nickName">진수사냥꾼</span></td>
						<td>이상한 소리좀 하지마라 ㅅㅂ</td>
						<td>06/28/14:21</td>
						<td>
							<button type="button" class="transparent-button">
								<img src="images/report.jpeg" class="icons">
							</button>
						</td>
					</tr>
				</table>
			</div>

			<!-- 목록으로 -->
			<div id="buttonArea">
				<button type="button" id="list"
					onclick="location.href='WalkHistoryMain.jsp#menu2'">목록으로</button>
				<!-- 목록으로 버튼을 누르면 산책완료 탭이 눌린채 히스토리 메인 페이지로 이동해야함! -->
			</div>
			<br>
			<br>
		</div>

		<!-- 하단 회사 설명 영역 -->
		<div id="harootFooter">
			<c:import url="MainFooter.jsp"></c:import>
		</div>
	</div>


</body>

</html>