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
<title>DiaryBasicMenu.jsp</title>
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

	<!-- 기본관리 > 상태 메인 -->
	<!-- 체중, 기분 -->
	<div class="diaryMenu">
		<label for="weight" class="icons" onclick="">
			<img class="diaryIcon" src="<%=cp%>/images/icons/main/scale.png"
			alt="weight" id="weight" title="체중">
			<br>체중
		</label>
		<label for="mood" class="icons" onclick="">
			<img class="diaryIcon" src="<%=cp%>/images/icons/main/mood.png"
			alt="mood" id="mood" title="기분">
			<br>기분
		</label>
		
	</div>


</body>
</html>