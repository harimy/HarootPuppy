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
<title>DiaryNutrientsInsertForm.jsp</title>
<style type="text/css">
.container-fluid {
	border: 1px solid;
	border-width: 2px;
	background-color: #E6E6E6;
	padding: 50px;
}
</style>

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

<!-- 다이어리 CSS -->
<link rel="stylesheet" href="<%=cp%>/css/diary.css">
<script type="text/javascript" src="<%=cp%>/js/diary.js"></script>

<style type="text/css">
.form-group {
	margin: 0px auto;
}

.starsDiv {
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	align-content: space-between;
}
</style>

<script type="text/javascript">
	function add_div() {
		var div = document.createElement('div');

		div.innerHTML = document.getElementById('privateBlock').innerHTML;

		document.getElementById('here').appendChild(div);
	}

	function remove_div(obj) {
		document.getElementById('here').removeChild(obj.parentNode);
	}

	
/*
	function add_private() 
 	{
		// alert("즐찾추가하시겠습니까?");
	
		var exampleModal = document.getElementById('exampleModal');
		exampleModal.addEventListener('show.bs.modal', function (event) 
		{
		  // Button that triggered the modal
		  
		  var button = event.relatedTarget
		  // Extract info from data-bs-* attributes
		  var recipient = button.getAttribute('data-bs-whatever')
		  // If necessary, you could initiate an AJAX request here
		  // and then do the updating in a callback.
		  //
		  // Update the modal's content.
		  var modalTitle = exampleModal.querySelector('.modal-title')
		  var modalBodyInput = exampleModal.querySelector('.modal-body input')

		  modalTitle.textContent = 'New message to ' + recipient
		  modalBodyInput.value = recipient 
		}) 
	} 
	즐겨찾기 등록 → 부트스트랩 모달 ()
	*/

	function add_private() {
		var inputString = prompt('즐겨찾기 이름을 입력하세요'); 
		alert(inputString)
		};
	
</script>


</head>
<body>
	<!-----------------------------
 DairyNutrientsInsertForm.jsp
  - 다이어리 영양제 입력폼
------------------------------->

	<div>

		<!-- content 영역 -->
		<div>
			<!-- 즐겨찾기 영역 (form 영역 바깥) -->
			<form action="" id="">

				<!-- 시작 시간 종료 시간 -->
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
				<button type="button" class="btn btn-primary"
					onclick="add_private()">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
  			<path
							d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
			</svg>
				</button>

				<!-- content 영역 -->
				<!-- 즐겨찾기 -->
				<div class="container-fluid favorite" id="privateBlock">
					즐겨찾기&nbsp; <select name="favorite">
						<option value="mirivogi">미리보기</option>
					</select> <br> <br>

					<button value="+" onclick="add_div()">+</button>

					<!-- text 박스 -->
					<br> 영양제 이름 <input type="text" id="nutName"> <br>
					투여량&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
						type="text" id="nutName">

					<!-- radio 영양제 종류 -->
					<br> 영양제 종류 <label><input type="radio" name="nutType1"
						value="영양제종류" checked="checked">알약</label> <label><input
						type="radio" name="nutType2" value="행동교정훈련">물약</label> <label><input
						type="radio" name="nutType3" value="사회화훈련">가루약</label>


					<!-- checkbox 관리종류 -->
					<br>관리 종류 <input type="checkbox" id="setType"> <label
						for="Type1">심혈관</label> <input type="checkbox" id="setType">
					<label for="Type2">관절</label> <input type="checkbox" id="setType">
					<label for="Type3">눈</label> <input type="checkbox" id="setType">
					<label for="Type4">구충제</label> <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
						type="checkbox" id="setType"> <label for="Type5">장건강</label>

					<input type="checkbox" id="setType"> <label for="Type6">구강</label>

					<input type="checkbox" id="setType"> <label for="Type7">피부/모질</label>

					<input type="checkbox" id="setType"> <label for="Type8">기타</label>
					<input type="text" id="setEtc"> <br>
					<button value="-" onclick="remove_div(this)">-</button>


					<div id="here"></div>
				</div>
				<br>
				<!-- 즐겨찾기 끝  -->


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

				<br> <br> <br> <input type="reset" value="취소"
					class="btn btn-outline-secondary"> <input type="button"
					value="저장" class="btn btn-secondary" onclick="">

			</form>
		</div>

		<!-- 하단 회사 설명 영역 -->
		<!-- 시간 -->
		<div>
			<%-- <c:import url="하단메뉴.jsp"></c:import> --%>
		</div>
	</div>




</body>
</html>