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
<title>DiaryClean.jsp</title>
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

<!-- 반려견다이어리 CSS / JS -->
<link rel="stylesheet" href="<%=cp%>/css/diary.css">
<script type="text/javascript" src="<%=cp%>/js/diary.js"></script>

<style type="text/css">
</style>


</head>
<body>
	<!-----------------------------
  Sample.jsp
  - 페이지 설명
------------------------------->


	<!-- content 영역 -->
	<!-- 양치 귀청소 목욕 -->
	<div class="diaryMenu">
		<label for="clean" class="icons" onclick="">
			<img class="diaryIcon" src="<%=cp%>/images/icons/main/toothbrush.png"
			alt="toothbrush" id="toothbrush" title="양치">
			<br>양치
		</label>
		<label for="clean" class="icons">
			<img class="diaryIcon" src="<%=cp%>/images/icons/main/earClean.png"
			alt="earClean" id="earClean" title="귀청소">
			<br>귀청소
		</label>
		<label for="clean" class="icons">
			<img class="diaryIcon" src="<%=cp%>/images/icons/main/clean.png"
			alt="bath" id="bath" title="목욕">
			<br>목욕
		</label>
	</div>


</body>
</html>