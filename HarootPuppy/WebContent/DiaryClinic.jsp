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
<title>DiaryClinic.jsp</title>
<%-- 
<!-- jQuery JS -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-ui.js"></script>
<!-- jQuery-UI CSS -->
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/jquery-ui.css">
 --%>
<!--  부트스트랩 JS -->
<script type="text/javascript" src="<%=cp%>/js/bootstrap.js"></script>
<!-- 부트스트랩 CSS -->
<link rel="stylesheet" href="<%=cp%>/css/bootstrap.css">

<style type="text/css">


div.diaryMenu
{
	text-align: center;
	margin: 0px auto !important;
	align-content: center;
}

.diaryIcon
{
	width: 50px;
	height: 50px;
	margin: 0px auto;

}

.diarySpan
{

	text-align: center;
}

label
{
	text-align: center;
	cursor:pointer;
	/* 아이콘 사이 간격 */
	margin: 100px;
}

</style>

</head>
<body>

<!--
	DiaryClinic.jsp
	- 진료 선택 시 (건강검진, 접종, 질환, 수술) 연결
-->


	<!-- 진료 메인 -->
	<!-- 건강검진, 접종, 질환, 수술 -->
	<div class="ClinicMenu">
		<label for="check" class="icons" onclick="">
			<img class="diaryIcon" src="<%=cp%>/images/icons/vet/043-stethoscope.png"
			alt="check" id="check" title="건강검진">
			<br>건강검진
		</label>
		
		<label for="injection" class="icons" onclick="">
			<img class="diaryIcon" src="<%=cp%>/images/icons/vet/023-eyedropper.png"
			alt="injection" id="injection" title="접종">
			<br>접종
		</label>
		
		
		<label for="disease" class="icons" onclick="">
			<img class="diaryIcon" src="<%=cp%>/images/icons/vet/034-medical-report.png"
			alt="disease" id="disease" title="질환">
			<br>질환
		</label>
		
		<label for="surgery" class="icons" onclick="">
			<img class="diaryIcon" src="<%=cp%>/images/icons/vet/038-hamster.png"
			alt="surgery" id="surgery" title="수술">
			<br>수술
		</label>
		
	</div>


</body>
</html>