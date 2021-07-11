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
<title>DiaryStateWeightInsertForm.jsp</title>

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

.form-group {
    margin: 0px auto;
}

.container
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
  DiaryStateWeightInsertForm.jsp
  - 페이지 설명
------------------------------->

	

		<!-- content 영역 -->
		
		<div class="container">
		<div class="in">
		  <form action="" id="">
		  	
		  	<!-- input -->
		    <div class="form-group">
		      <label for="focusedInput">
		      	<span class="input-group-text" id="basic-addon1">체중</span>
		      	</label>
		      <input class="form-control" id="focusedInput" type="text" placeholder="x.x">kg
		    </div>
		    
		    <!-- 공통항목 (메모) -->
		    <div style="display: block !important;">
			    <div class="form-floating">
				  <label for="floatingTextarea2"></label>
				  <textarea class="form-control" placeholder="특이사항(메모)" id="floatingTextarea2" style="width: 300px; height: 100px;"></textarea>
					<br>
				</div>
		    </div>
		    <!-- 공통항목 (사진 첨부) -->
		    <input type="file" name="profile_pt" id="profile_pt" onchange="previewImage(this,'View_area')">
			<!-- 사진 미리보기 -->
			<div id="View_area"></div>
			
		    <!-- 사진첨부시 미리보기 출력영역 -->
		    
		    <br><br><br>
		    <input type="reset" value="취소" class="btn btn-outline-secondary">
		    <input type="button" value="저장" class="btn btn-secondary" onclick="">
		    
		  </form>
		</div>
		</div>

</body>
</html>