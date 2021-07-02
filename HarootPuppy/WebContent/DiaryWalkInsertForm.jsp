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
<title>DiaryInsertFormSample.jsp</title>

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

<!-- 반려견다이어리 CSS / JS -->
<link rel="stylesheet" href="<%=cp%>/css/diary.css">
<script type="text/javascript" src="<%=cp%>/js/diary.js"></script>

<style type="text/css">
.form-control, #focusedInput 
{
	display: inline !important;
}

/* input 칸 넓이 */
#focusedInput 
{
	width: 210px !important;
}

.form-group 
{
	margin: 0px auto;
}



</style>



</head>
<body>
<!-----------------------------
  DiaryWalkInsertForm.jsp
  - 다이어리 산책 입력 
------------------------------->



	<!-- content 영역 -->
	<div>
		<form action="" id="">

			<!-- 공통항목 (시작 시간) -->
			<div class="form-time">
				<label for="focusedtime">시작 시간</label> <input type="time"
					class="focusedInput form-time-control" id="start1">

				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


				<!-- 공통항목 (종료 시간) -->

				<label for="focusedtime">종료 시간</label> <input type="time"
					class="focusedInput form-time-control" id="end1">
			</div>
			
			
			<!-- 날씨 라디오버튼 -->
			<div>
				<br />
				<label for="sunny" class="icons"> 

					<img class="diaryIcon" src="<%=cp%>/images/icons/main/sunny.png" 
					alt="suuny" title="맑음">
					<br>
					<span>
						<input type="radio" name="weather" id="sunny" value="sunny">
						맑음
					</span>
				</label>
				
				<label for="cloudy" class="icons"> 

					<img class="diaryIcon" src="<%=cp%>/images/icons/main/cloudy.png" 
					alt="cloudy" title="구름">
					<br>
					<span>
						<input type="radio" name="weather" id="cloudy" value="cloudy">
						구름
					</span>
				</label>
				
				<label for="cloudy2" class="icons"> 

					<img class="diaryIcon" src="<%=cp%>/images/icons/main/cloudy2.png" 
					alt="cloudy2" title="흐림">
					<br>
					<span>
						<input type="radio" name="weather" id="cloudy2" value="cloudy2">
						흐림
					</span>
				</label>
				
				<label for="rain" class="icons"> 

					<img class="diaryIcon" src="<%=cp%>/images/icons/main/rain.png" 
					alt="rain" title="비">
					<br>
					<span>
						<input type="radio" name="weather" id="rain" value="rain">
						비
					</span>
				</label>
				
				<label for="snow" class="icons"> 

					<img class="diaryIcon" src="<%=cp%>/images/icons/main/snow.png" 
					alt="snow" title="눈">
					<br>
					<span>
						<input type="radio" name="weather" id="snow" value="snow">
						눈
					</span>
				</label>
			</div>
			<br />
			<!-- input div-->
			<div class="form-group">
				<label for="focusedInput"> <span class="input-group-text"
					id="basic-addon1">산책장소</span>
				</label> <input class="form-control" id="focusedInput" type="text"
					placeholder="">
			</div>

			<!-- 공통항목 (메모) -->
			<div style="display: block !important;">
				<div class="form-floating">
					<label for="floatingTextarea"></label>
					<textarea class="form-control" placeholder="특이사항(메모)"
						id="floatingTextarea" style="width: 300px; height: 100px;"></textarea>
					<br>
				</div>
			</div>
			<!-- 공통항목 (사진 첨부) -->
			<input type="file" name="profile_pt" id="profile_pt"
				onchange="previewImage(this,'View_area')">
			<!-- 사진 미리보기 -->
			<div id="View_area"></div>

			<!-- 사진첨부시 미리보기 출력영역 -->

			<br>
			<br>
			<br> <input type="reset" value="취소"
				class="btn btn-outline-secondary"> <input type="button"
				value="저장" class="btn btn-secondary" onclick="">

		</form>
	</div>


</body>
</html>