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

#focusedInput 
{
	width: 80px !important;
}

.form-group 
{
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



</head>
<body>

<!-----------------------------
  특별관리 > 출산 입력 폼 
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
			
			
			<!-- 즐겨찾기 영역 -->
			<div style="background-color: powderblue; width:500px; height: 400px;">
				
				<div>
					즐겨찾기드롭다운
				</div>
				
				<div>
					<label for="input1"> 
						<span class="" id="">체온</span> 
					</label> 
					<input class="" id="input1" name="input1" type="text" placeholder="체온 입력">˚C
				</div>
				
				<div>
					<label for="input2"> 
						<span class="" id="">새끼 수</span> 
					</label> 
					<input class="" id="input2" name="input2" type="text" placeholder="">마리
				</div>
				
				<div>
					<label for="input2"> 
						<span class="" id="">수컷 종류</span> 
					</label> 
					<input class="" id="input2" name="input2" type="text" placeholder="">
					
					<button type="button" class="btn btn-default">
					<span class="glyphicon glyphicon-search"></span>
					</button>
					<input type="checkbox" id="mix" name="mix">믹스
					<span style="font: small;">중형견</span>
					
				</div>
				
				
			</div>

			<!-- input div-->
			<div class="form-group">
				<label for="focusedInput"> <span class="input-group-text">샘플</span>
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
	</div>

</body>
</html>