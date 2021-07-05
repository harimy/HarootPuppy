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
<title>DiaryCleanToothInsertForm.jsp</title>

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
.form-control, #focusedInput 
{
	display: inline !important;
}

#focusedInput 
{
	width: 230px !important;
}

.form-group 
{
	margin: 0px auto;
}
</style>



</head>
<body>
<!-----------------------------
  다이어리 청결 > 양치,귀청소, 목욕
------------------------------->


	<!-- content 영역 -->
	<div>
		<form action="" id="">

			<!-- 공통항목 (시작 시간/ 종료 시간) -->
			<div class="form-time">
				<label for="focusedtime">시작 시간</label>
				 <input type="time" class="focusedInput form-time-control" id="start1" name="">

				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

				<label for="focusedtime">종료 시간</label>
				 <input type="time" class="focusedInput form-time-control" id="end1" name="">
			</div>
			
			
			<!-- 즐겨찾기 추가 버튼 (하트)  -->	
			<button type="button" class="btn btn-primary" onclick="add_private()"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
  			<path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
			</svg></button>
		
			
			<div class="form-group">
				<label for="focusedInput"> <span class="input-group-text">제목</span>
				</label>
				 <input class="form-control" id="focusedInput" name="" type="text" placeholder="">
			</div>

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


</body>
</html>