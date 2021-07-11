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
<title>DiaryClinicDiseaseInsertForm.jsp</title>
<style type="text/css">


.form-control, #focusedInput
{
   display: inline !important;
   
}

#focusedInput, #clinicDate
{
   width: 200px; !important;
}

.form-group {
    margin: 0px auto;
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

<!-- jQuery JS -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-ui.js"></script>
<!-- jQuery-UI CSS -->
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/jquery-ui.css"> 

<!--  부트스트랩 JS -->
<script type="text/javascript" src="<%=cp%>/js/bootstrap.js"></script>
<!-- 부트스트랩 CSS -->
<link rel="stylesheet" href="<%=cp%>/css/bootstrap.css">

<!-- 다이어리 CSS -->
<link rel="stylesheet" href="<%=cp%>/css/diary.css">
<script type="text/javascript" src="<%=cp%>/js/diary.js"></script>


<script type="text/javascript">
		
		$(function()
		{
			
			// js 폴더, css 폴더 파일 확인 
			// jQuery-UI 캘린더를 불러오는 함수 처리 (datepicker())
			$("#clinicDate").datepicker(
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
  DiaryClinicDiseaseInsertForm.jsp
  - 다이어리 진료(질환) 부분 
------------------------------->

<div>
	

	<!-- content 영역 -->
	<div class="out">
	<div class="in">
		<!-- 즐겨찾기 영역 (form 영역 바깥) -->
		<form action="" id="">

			<!-- 공통항목 (시작 시간) -->
			<div class="form-time">
				<label for="focusedtime">시작 시간</label> 
				<input type="time" class="focusedInput form-time-control" id="start1">

				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

				<!-- 공통항목 (종료 시간) -->
				<label for="focusedtime">종료 시간</label> 
				<input type="time" class="focusedInput form-time-control" id="end1">
			</div>
			
			<!-- 병원명  -->
			<div class="form-group hospitalName">
				<label for="focusedInput"> 
				<span class="input-group-text">병원명</span>
				</label> 
				<input class="form-control" id="focusedInput" type="text"
					placeholder="병원명">
			</div>

			<!-- 의사명  -->
			<div class="form-group doctorName">
				<label for="focusedInput"> 
				<span class="input-group-text" >의사명</span>
				</label> <input class="form-control" id="focusedInput" type="text"
					placeholder="의사명">
			</div>
			
			<!-- 의료비용  -->
			<div class="form-group pay">
				<label for="focusedInput"> 
				<span class="input-group-text" >의료비용</span>
				</label> <input class="form-control" id="focusedInput" type="text"
					placeholder="의료비용">원
			</div>
			
			
			<!-- 다음 방문 일정  -->
			<div class="form-group clinicDate">
				<label for="focusedInput"> 
				<span class="input-group-text" >다음 방문 일정</span>
				</label> <input class="form-control" id="clinicDate" type="text"
					placeholder="다음방문일정">
			</div>
			
			<!-- 질병명  -->
			<div class="form-group clinicName">
				<label for="focusedInput"> 
				<span class="input-group-text" >진단명</span>
				</label> <input class="form-control" id="focusedInput" type="text"
					placeholder="질병명">
			</div>
			

			<!-- 공통항목 (메모) -->
			<div style="display: block !important;">
				<div class="form-floating">
					<label for="floatingTextarea"></label>
					<textarea class="form-control" placeholder="특이사항(메모)"
						id="floatingTextarea" style="width: 300px; height: 100px;"> </textarea>
					<br>
				</div>
			</div>

			<!-- 공통항목 (사진 첨부) -->
			<input type="file" name="profile_pt" id="profile_pt"
				onchange="previewImage(this,'View_area')">
			<!-- 사진 미리보기 -->
			<div id="View_area"></div>

			<!-- 사진첨부시 미리보기 출력영역 -->
			<br><br><br> 
			<input type="reset" value="취소" class="btn btn-outline-secondary"> 
			<input type="button" value="저장" class="btn btn-secondary" onclick="">

		</div>
		</form>
	</div>

	<!-- 하단 회사 설명 영역 -->
	<div>
		<%-- <c:import url="하단메뉴.jsp"></c:import> --%>
	</div>
</div>

</body>
</html>