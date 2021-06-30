<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>common.jsp</title>

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
.form-time-control, 
{
	width: 50px; 
}

.form-time 
{
    margin: 0px auto;
    text-align : center;
    
}

.form-floating
{
	display: block !important; 
	text-align:center;
}

.form-photo
{
	text-align:center;
}

.form-button
{
	text-align:center;
}



</style>


</head>
<body>
<div>
	<form>
		 	<!-- 공통항목 (시작 시간) -->
		    <div class="form-time">
		      <label for="focusedtime">시작 시간</label>
		      <input type="time" class="focusedInput form-time-control" id="start1">
		    
		    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

		    
		    <!-- 공통항목 (종료 시간) -->
		   
		      <label for="focusedtime">종료 시간</label>
		      <input type="time" class="focusedInput form-time-control" id="end1">

		    </div>
		    
		    <br><br><br>
		    <!-- 공통항목 (메모) -->
			    <div class="form-floating">
				  <label for="floatingTextarea"></label>
				  <textarea class="form-control" placeholder="특이사항(메모)" id="floatingTextarea" style="width: 520px; height: 300px;"></textarea>
					<br>
				</div>
			
			
		    <!-- 공통항목 (사진 첨부) -->
		    <div class="form-photo">
		    <input type="file" name="profile_pt" id="profile_pt" onchange="previewImage(this,'View_area')">		
			<!-- 사진 미리보기 -->
			<div id="View_area"></div>
			</div>
		    
		    <!-- 사진첨부시 미리보기 출력영역 -->
		   
		    <br><br><br>
		    
		    <div class="form-button">
		    <input type="reset" value="취소" class="btn btn-outline-secondary">
	
		    <input type="button" value="저장" class="btn btn-secondary" onclick="">
		    </div>
  </form>
</div>

</body>
</html>