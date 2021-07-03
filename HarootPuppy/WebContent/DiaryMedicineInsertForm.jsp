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
<title>DiaryMedicineInsertForm.jsp</title>

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



</style>


<script type="text/javascript">

	
	$(document).ready(function(){
		
		// 라디오버튼 클릭시 이벤트 발생(복용량 단위 변경)
		$("input:radio[name=medicineKind]").click(function(){
		
		    if($("input[name=medicineKind]:checked").val() == "1")
		    {
		        $('#amountSpan').html('개');
		        // radio 버튼의 value 값이 1이면 '개'
		
		    }else if($("input[name=medicineKind]:checked").val() == "2")
		    {
		   	 	$('#amountSpan').html('ml');
		        // radio 버튼의 value 값이 2이면 'ml'
		    }else if($("input[name=medicineKind]:checked").val() == "3")
		    {
		   	 	$('#amountSpan').html('g');
		        // radio 버튼의 value 값이 3이면 'g'
		    }
	
		});
		
		// js 폴더, css 폴더 파일 확인 
		// jQuery-UI 캘린더를 불러오는 함수 처리 (datepicker())
		$("#nextMeet").datepicker(
		{
			dateFormat: "yy-mm-dd"
			, changeMonth: true
			, changeYear: true
		});
		
	});



</script>

</head>
<body>
<!-----------------------------
  특별관리 > 복약 입력폼
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
			<div style="background-color: powderblue; width: 600px; height: 300px;">
				
				<!-- 
					질병 이름 input text
					약 이름
					약 종류
					투여량
					약의 효능 input text
					처방 병원 input text
					의료 비용 input text
					다음 방문 일정 달력
				 -->
			
				<!-- 질병 이름 입력 -->
				<div>
					즐겨찾기드롭다운
				</div>
				
				<div>
					<label for="input1"> 
						<span class="" id="">질병 이름</span> 
					</label> 
					<input class="" id="input1" name="input1" type="text" placeholder="내용 입력">
				</div>
				
				<!-- 약 이름 입력 -->
				<div>
					<label for="input2"> 
						<span class="" id="">약 이름</span> 
					</label> 
					<input class="" id="input2" name="input2" type="text" placeholder="내용 입력">
				</div>
				
				
				<!-- 약 종류 라디오버튼 선택 -->
				<div>
					<span class="" id="">약 종류</span>
					<input type="radio" name="medicineKind" id="Medicine1" value="1" checked="checked">
					<label for="Medicine1">알약</label>
					<input type="radio" name="medicineKind" id="Medicine2" value="2">
					<label for="Medicine2">물약</label>
					<input type="radio" name="medicineKind" id="Medicine3" value="3">
					<label for="Medicine3">가루약</label>
				</div>
				
				<!-- 투여량 -->
				<div class="">
					<label for="input3"> 
						<span class="" id="">투여량</span>
					</label> 
					<input class="" id="input3" name="input3" type="text"><span id="amountSpan">개</span>
				</div>
				
				<!-- 약 효능 -->
				<div>
					<label for="input4"> 
						<span class="" id="">약 효능</span> 
					</label> 
					<input class="" id="input4" name="input4" type="text" placeholder="내용 입력">
				</div>
				
				<!-- 처방 병원 -->
				<div>
					<label for="input5"> 
						<span class="" id="">처방 병원</span> 
					</label> 
					<input class="" id="input5" name="input5" type="text" placeholder="내용 입력">
				</div>
				
				<!-- 의료 비용 -->
				<div>
					<label for="input6"> 
						<span class="" id="">의료 비용</span> 
					</label> 
					<input class="" id="input6" name="input6" type="text" placeholder="내용 입력">
				</div>
				
				<!-- 다음 방문 일정 -->
				<span class="" id="">다음 방문일</span> 
				<input type="text" id="nextMeet" name="nextMeet" placeholder="다음방문일" />
			
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
			<input type="submit" id="submitBtn" name="submitBtn" value="저장" class="btn btn-secondary" onclick="">
			
		</form>
	</div>


</body>
</html>