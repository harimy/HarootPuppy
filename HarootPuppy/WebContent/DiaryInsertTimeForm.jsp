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

.form-group
{
    margin: 0px auto;
    text-align : center;
    
}




</style>


</head>
<body>
<div>
	<form>
		 	<!-- 공통항목 (시작 시간) -->
		    <div class="form-group">
		      <label for="focusedInput">시작 시간</label>
		      <input type="time" class="focusedInput form-time-control" id="start1">
		    
		    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

		    
		    <!-- 공통항목 (종료 시간) -->
		   
		      <label for="focusedInput">종료 시간</label>
		      <input type="time" class="focusedInput form-time-control" id="end1">

		    </div>
		  

  	</form>
</div>

</body>
</html>