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
<title>DiarySnackInsertForm.jsp</title>

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

<script type="text/javascript">
function add_private() {
	var inputString = prompt('즐겨찾기 이름을 입력하세요'); 
	alert(inputString);
}
</script>

<style type="text/css">
.form-control, #focusedInput {
	display: inline !important;
}

#focusedInput {
	width: 80px !important;
}

.form-group {
	margin: 0px auto;
}

.starsDiv {
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	align-content: space-between;
}

/* star rating CSS */
@import
	url('https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap')
	;

.stars {
	display: inline;
	text-align: left;
}

.stars input {
	display: none;
}

.stars label {
	float: right;
	font-size: 25px;
	color: lightgrey;
	margin: 0 5px;
	text-shadow: 1px 1px #bbb;
}

.stars label:before {
	content: '★';
}

.stars input:checked ~ label {
	color: gold;
	text-shadow: 1px 1px #c60;
}

.stars:not (:checked ) >label:hover, .stars:not (:checked ) >label:hover 
	~ label {
	color: gold;
}

.stars input:checked>label:hover, .stars input:checked>label:hover ~
	label {
	color: gold;
	text-shadow: 1px 1px goldenrod;
}

.stars .result:before {
	position: absolute;
	content: "";
	width: 100%;
	left: 50%;
	transform: translateX(-47%);
	bottom: -30px;
	font-size: 30px;
	font-weight: 500;
	color: gold;
	font-family: 'Poppins', sans-serif;
	display: none;
}

.stars input:checked ~ .result:before {
	display: block;
}

.stars #five:checked ~ .result:before {
	content: "I love it ";
}

.stars #four:checked ~ .result:before {
	content: "I like it ";
}

.stars #three:checked ~ .result:before {
	content: "It's good ";
}

.stars #two:checked ~ .result:before {
	content: "I don't like it ";
}

.stars #one:checked ~ .result:before {
	content: "I hate it ";
}

#etcSnack
{
	width : 120px;
	display: none;
}

</style>


<script type="text/javascript">



</script>

</head>
<body>
	<!-----------------------------
  DiarySnackInsertForm.jsp
  - 페이지 설명
------------------------------->




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
			
			<!-- 즐겨찾기 추가 버튼 (하트)  -->	
			<button type="button" class="btn btn-primary" onclick="add_private()"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
  			<path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
			</svg></button>
		
			<!-- 즐겨찾기 영역 -->
			<div style="background-color: powderblue; width: 600px; height: 200px;">
				<div class="form-group">
				<label for="focusedInput"> <span class="input-group-text" id="">간식이름</span> </label> 
				<input class="form-control" id="focusedInput" type="text" placeholder="">
				</div>
				<div class="form-group">
				<label for="focusedInput"> 
				<span class="input-group-text" id="">급여양</span>
				</label> <input class="form-control" id="focusedInput" type="text"
					placeholder="">g
				</div>
				
				<span class="input-group-text form-control" id="">간식 종류</span>
				<!-- 껌 비스킷 져키 캔 육포 기타-->
				<input type="radio" name="snackKind" id="chew" value="chew">
				<label for="chew">껌</label>
				<input type="radio" name="snackKind" id="biscuit" value="biscuit">
				<label for="Biscuit">비스킷</label>
				<input type="radio" name="snackKind" id="jerky" value="jerky">
				<label for="jerky">져키</label>
				<input type="radio" name="snackKind" id="dryMeat" value="dryMeat">
				<label for="dryMeat">육포</label>
				<input type="radio" name="snackKind" id="can" value="can">
				<label for="can">캔</label>
				<input type="radio" name="snackKind" id="etc" value="">
				<label for="etc">기타</label>
				
			</div>

			<!-- input meal (기호도) -->
			<div class="form-group starsDiv">
				<label for="focusedInput"> <span class="input-group-text"
					id="">기호도</span>
				</label>
				<div class="stars">
					<input type="radio" id="five" name="rate" value="5"> <label
						for="five"></label> <input type="radio" id="four" name="rate"
						value="4"> <label for="four"></label> <input type="radio"
						id="three" name="rate" value="3"> <label for="three"></label>
					<input type="radio" id="two" name="rate" value="2"> <label
						for="two"></label> <input type="radio" id="one" name="rate"
						value="1"> <label for="one"></label> <span class="result"></span>
				</div>
			</div>

			<!-- 공통항목 (메모) -->
			<div style="display: block !important;">
				<div>
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
			<br> 
			<input type="reset" id="resetBtn" name="resetBtn" value="취소" class="btn btn-outline-secondary"> 
			<input type="button" id="submitBtn" name="submitBtn" value="저장" class="btn btn-secondary" onclick="">
			
		</form>
	</div>


</body>
</html>