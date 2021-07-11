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
<title>DiaryToiletInsertForm.jsp</title>

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

#focusedInput 
{
	width: 80px !important;
}

.form-group 
{
	margin: 0px auto;
}

#peeInput
{
	display: none;
}

#poopInput
{
	display: none;
}

.out
{
	width:100%;
	text-align: center;
}

.in
{
	display:inline-block;
}

</style>

<script type="text/javascript">

$(window).load(function(){

	// 소변상태 > 기타 선택시 사용자 직접 입력
	$('#pee').change(function() {
		
		//alert("선택");
		var state = jQuery('#pee option:selected').val();
		if (state == '기타')
		{
			$('#peeInput').show();
		} else
		{
			$('#peeInput').hide();
		}
		
	});
	
	
	// 대변상태 > 기타 선택시 사용자 직접 입력
	$('#poop').change(function() {
		
		//alert("선택");
		var state = jQuery('#poop option:selected').val();
		if (state == '기타')
		{
			$('#poopInput').show();
		} else
		{
			$('#poopInput').hide();
		}
	});
	
});
</script>




</head>
<body>

<!-----------------------------
  특별관리 > 배변상태 입력폼
------------------------------->



	<!-- content 영역 -->
	<div class="out">
	<div class="in">
		<form action="" id="">

			<!-- 공통항목 (시작 시간/ 종료 시간) -->
			<div class="form-time">
				<label for="focusedtime">시작 시간</label>
				 <input type="time" class="focusedInput form-time-control" id="start1" name="">

				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

				<label for="focusedtime">종료 시간</label>
				 <input type="time" class="focusedInput form-time-control" id="end1" name="">
			</div>
			
			<br>
			<!-- input div-->
			
			<!-- 소변상태 -->
			<div>
			소변상태 
				<select name="pee" id="pee">
					<option id="pee1" value="정상" selected="selected">정상</option>
					<option id="pee2" value="혈뇨">혈뇨</option>
					<option id="pee3" value="거품(당뇨)">거품(당뇨)</option>
					<option id="pee4" value="기타">기타(직접입력)</option>
				</select>
				
				<!-- 기타 선택시 사용자 직접 입력칸 보이기(소변) -->
				<input id="peeInput" name="peeInput" type="text">

			</div>
			
			<br>
			
			<!-- 대변상태 -->
			<div>
			대변상태 
				<select name="poop" id="poop">
					<option id="poop1" value="정상" selected="selected">정상</option>
					<option id="poop2" value="변비">변비</option>
					<option id="poop3" value="묽은변">묽은변</option>
					<option id="poop4" value="혈변">혈변</option>
					<option id="poop5" value="기타">기타(직접입력)</option>
				</select>
				
				<!-- 기타 선택시 사용자 직접 입력칸 보이기(대변) -->
				<input id="poopInput" name="poopInput" type="text">
			</div>
			
			<br>

			<!-- 공통항목 (메모) -->
			<div style="display: block !important;">
				<div class="form-floating">
					<label for="floatingTextarea"></label>
					<textarea class="form-control" placeholder="특이사항(메모)"
						id="floatingTextarea" name="" style="width: 300px; height: 100px;"></textarea>
					<br>
				</div>
			</div>
			<!-- 공통항목 (사진 첨부) -->
			<input type="file" name="profile_pt" id="profile_pt" onchange="previewImage(this,'View_area')">
			<!-- 사진 미리보기 -->
			<div id="View_area"></div>

			<!-- 사진첨부시 미리보기 출력영역 -->

			<br>
			<br>
			<br> <input type="reset" id="resetBtn" name="resetBtn" value="취소" class="btn btn-outline-secondary"> 
				<input type="button" id="submitBtn" name="submitBtn" value="저장" class="btn btn-secondary" onclick="">

		</form>
	</div>
	</div>

</body>
</html>