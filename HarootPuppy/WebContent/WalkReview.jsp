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
<title>WalkReview.jsp</title>

<!-- jQuery JS -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-ui.js"></script>
<!-- jQuery-UI CSS -->
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/jquery-ui.css">

<!--  부트스트랩 JS -->
<script type="text/javascript" src="<%=cp%>/js/bootstrap.js"></script>
<!-- 부트스트랩 CSS -->
<link rel="stylesheet" href="<%=cp%>/css/bootstrap.css">

<style type="text/css">

#harootContent
{
	width: 100%;
	text-align: center;
}

#in
{
	display: inline-block;
	text-align: left;
	background: rgb(230, 230, 230);
}

.masterTag
{
	width: 100%;
	height: 25px;
	background: rgb(196, 91, 36);
	border-radius: 15px;
	text-align: center;
	vertical-align: center;
	color: white;
}

.radioSpan
{
	margin: 10px;
}

</style>

<script type="text/javascript">
	

	$(document).ready(function()
	{
		$("#ifShow1").css("display", "none");
		
		$("input[name='eval1']:radio").change(function()
		{
			alert($(this).val());
			
			if($(this).val() == "show")
			{
				/* alert("1"); */
				$("#ifShow1").css("display", "inline");
			}
			
			if($(this).val() == "noshow")
			{
				/* alert("1"); */
				$("#ifShow1").css("display", "none");
			}
			
		});
	});
	
</script>

</head>
<body>

<!-----------------------------
   WalkReview.jsp
   - 산책 완료 후 리뷰작성 페이지
------------------------------->
	<div>
		<!-- 메뉴영역 -->
		<div id="harootHeader">
			<c:import url="Main.jsp"></c:import>
		</div>

		<!-- content 영역 -->
		<div id="harootContent">
			<h1 style="text-align: center;">후기 작성</h1>
			<div id="in">
				<span id="walkIntro">
				산책 일자 : 2021년 6월 13일<br>
				산책 시간 : 18 : 30 ~ 21 : 00<br>
				산책 장소 : 안양천<br>
				글 제목 : 저녁 산책하GO 건강챙기GO<br>
				</span>
			</div>
			<br><br>
			<table class="table">
				<tr>
					<td width=30%>
							<div class="thumbnail">
								<div id="nickName">
									비투더아투더뱅뱅<img src="images/man.png" class="icons">
								</div>
								<br> <img class="img-responsive"
									src="<%=cp%>/images/jaerong.jpg">
								<div class="caption">
									<h3>재롱</h3>
									<p>
										로트와일러, 3세<br> 중성화 완료<br> 입질 안함<br> 낯가림 없음<br>
									</p>
								</div>
							</div>
							<div class="masterTag">방장</div>
					</td>
					
					<td width=70% style="text-align: left;">
						<br>
						<p>Nickname님은 어떠셨나요?</p>
						<span class="radioSpan"><label><input type="radio" name="eval1" value="show"> 약속장소에 나왔어요. </label></span>
						<span class="radioSpan"><label><input type="radio" name="eval1" value="noshow"> 약속장소에 나오지 않았어요.</label></span>
						<br><br><br>
						
						<div id="ifShow1">
							<p>친절하고 매너가 좋았나요?</p>
							<span class="radioSpan"><label><input type="radio" name="manner" value="5"> 매우 그렇다. </label></span>
							<span class="radioSpan"><label><input type="radio" name="manner" value="4"> 그렇다. </label></span>
							<span class="radioSpan"><label><input type="radio" name="manner" value="3"> 보통이다. </label></span>
							<span class="radioSpan"><label><input type="radio" name="manner" value="2"> 그렇지 않다. </label></span>
							<span class="radioSpan"><label><input type="radio" name="manner" value="1"> 매우 그렇지 않다. </label></span>
							<br><br>
							<p>시간 약속은 잘 지켰나요?</p>
							<span class="radioSpan"><label><input type="radio" name="time" value="5"> 매우 그렇다. </label></span>
							<span class="radioSpan"><label><input type="radio" name="time" value="4"> 그렇다. </label></span>
							<span class="radioSpan"><label><input type="radio" name="time" value="3"> 보통이다. </label></span>
							<span class="radioSpan"><label><input type="radio" name="time" value="2"> 그렇지 않다. </label></span>
							<span class="radioSpan"><label><input type="radio" name="time" value="1"> 매우 그렇지 않다. </label></span>
							<br><br>
							<p>반려견 케어는 잘 했나요?</p>
							<span class="radioSpan"><label><input type="radio" name="care" value="5"> 매우 그렇다. </label></span>
							<span class="radioSpan"><label><input type="radio" name="care" value="4"> 그렇다. </label></span>
							<span class="radioSpan"><label><input type="radio" name="care" value="3"> 보통이다. </label></span>
							<span class="radioSpan"><label><input type="radio" name="care" value="2"> 그렇지 않다. </label></span>
							<span class="radioSpan"><label><input type="radio" name="care" value="1"> 매우 그렇지 않다. </label></span>
							<br><br>
							<p>응답이 빨랐나요?</p>
							<span class="radioSpan"><label><input type="radio" name="response" value="5"> 매우 그렇다. </label></span>
							<span class="radioSpan"><label><input type="radio" name="response" value="4"> 그렇다. </label></span>
							<span class="radioSpan"><label><input type="radio" name="response" value="3"> 보통이다. </label></span>
							<span class="radioSpan"><label><input type="radio" name="response" value="2"> 그렇지 않다. </label></span>
							<span class="radioSpan"><label><input type="radio" name="response" value="1"> 매우 그렇지 않다. </label></span>
						</div>
					</td>
				</tr>
				
				<tr>
					<td width=30%>
							<div class="thumbnail">
								<div id="nickName">
									비투더아투더뱅뱅<img src="images/man.png" class="icons">
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
							<div class="masterTag">방장</div>
					</td>
					
					<td width=70%  style="text-align: left;">
						<br>
						<p>Nickname님은 어떠셨나요?</p>
						<span class="radioSpan"><label><input type="radio" name="eval2" value="show"> 약속장소에 나왔어요. </label></span>
						<span class="radioSpan"><label><input type="radio" name="eval2" value="noshow"> 약속장소에 나오지 않았어요.</label></span>
						<br><br><br>
						
						<div id="ifShow2">
							<p>친절하고 매너가 좋았나요?</p>
							<span class="radioSpan"><label><input type="radio" name="manner" value="5"> 매우 그렇다. </label></span>
							<span class="radioSpan"><label><input type="radio" name="manner" value="4"> 그렇다. </label></span>
							<span class="radioSpan"><label><input type="radio" name="manner" value="3"> 보통이다. </label></span>
							<span class="radioSpan"><label><input type="radio" name="manner" value="2"> 그렇지 않다. </label></span>
							<span class="radioSpan"><label><input type="radio" name="manner" value="1"> 매우 그렇지 않다. </label></span>
							<br><br>
							<p>시간 약속은 잘 지켰나요?</p>
							<span class="radioSpan"><label><input type="radio" name="time" value="5"> 매우 그렇다. </label></span>
							<span class="radioSpan"><label><input type="radio" name="time" value="4"> 그렇다. </label></span>
							<span class="radioSpan"><label><input type="radio" name="time" value="3"> 보통이다. </label></span>
							<span class="radioSpan"><label><input type="radio" name="time" value="2"> 그렇지 않다. </label></span>
							<span class="radioSpan"><label><input type="radio" name="time" value="1"> 매우 그렇지 않다. </label></span>
							<br><br>
							<p>반려견 케어는 잘 했나요?</p>
							<span class="radioSpan"><label><input type="radio" name="care" value="5"> 매우 그렇다. </label></span>
							<span class="radioSpan"><label><input type="radio" name="care" value="4"> 그렇다. </label></span>
							<span class="radioSpan"><label><input type="radio" name="care" value="3"> 보통이다. </label></span>
							<span class="radioSpan"><label><input type="radio" name="care" value="2"> 그렇지 않다. </label></span>
							<span class="radioSpan"><label><input type="radio" name="care" value="1"> 매우 그렇지 않다. </label></span>
							<br><br>
							<p>응답이 빨랐나요?</p>
							<span class="radioSpan"><label><input type="radio" name="response" value="5"> 매우 그렇다. </label></span>
							<span class="radioSpan"><label><input type="radio" name="response" value="4"> 그렇다. </label></span>
							<span class="radioSpan"><label><input type="radio" name="response" value="3"> 보통이다. </label></span>
							<span class="radioSpan"><label><input type="radio" name="response" value="2"> 그렇지 않다. </label></span>
							<span class="radioSpan"><label><input type="radio" name="response" value="1"> 매우 그렇지 않다. </label></span>
						</div>
					</td>
				</tr>
			
			</table>
		</div>

		<!-- 하단 회사 설명 영역 -->
		<div id="harootFooter">
			<c:import url="MainFooter.jsp"></c:import>
		</div>
	</div>


</body>

</html>