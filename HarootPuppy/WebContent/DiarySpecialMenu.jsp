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
<title>DiarySpecialMenu.jsp</title>
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
	margin-top: 5px;
	margin-left: 15px;
	margin-right: 15px;
}

</style>


</head>
<body>
	<!-----------------------------
  DiarySpecialMenu.jsp
  - 페이지 설명
------------------------------->




	<!-- 배변 복약 출산 -->
	<div class="diaryMenu">
		<label for="poop" class="icons" onclick="">
			<img class="diaryIcon" src="<%=cp%>/images/icons/main/poop.png"
			alt="poop" id="poop" title="배변">
			<br>배변
		</label>
		<label for="phil" class="icons">
			<img class="diaryIcon" src="<%=cp%>/images/icons/main/nutrients.png"
			alt="phil" id="phil" title="복약">
			<br>복약
		</label>
		<label for="birth" class="icons">
			<img class="diaryIcon" src="<%=cp%>/images/icons/main/birth.png"
			alt="birth" id="birth" title="출산">
			<br>출산
		</label>
		
		
	</div>



</body>
</html>