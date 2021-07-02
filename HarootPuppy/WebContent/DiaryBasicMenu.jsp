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
</style>


</head>
<body>
	<!-----------------------------
  Sample.jsp
  - 페이지 설명
------------------------------->


	<!-- content 영역 -->
	<!-- 상태, 식사, 간식, 산책, 청결
		 진료, 미용, 영양제, 훈련, 기타 -->
	<div class="diaryMenu">
		<label for="mood" class="icons" onclick="">
			<img class="diaryIcon" src="<%=cp%>/images/icons/main/mood.png"
			alt="mood" id="mood" title="상태">
			<br>상태
		</label>
		<label for="meal" class="icons">
			<img class="diaryIcon" src="<%=cp%>/images/icons/main/food.png"
			alt="meal" id="meal" title="식사">
			<br>식사
		</label>
		<label for="snack" class="icons">
			<img class="diaryIcon" src="<%=cp%>/images/icons/main/snack.png"
			alt="snack" id="snack" title="간식">
			<br>간식
		</label>
		<label for="walk" class="icons">
			<img class="diaryIcon" src="<%=cp%>/images/icons/main/walk.png"
			alt="walk" id="walk" title="산책">
			<br>산책
		</label>
		<label for="clean" class="icons">
			<img class="diaryIcon" src="<%=cp%>/images/icons/main/clean.png"
			alt="clean" id="clean" title="청결">
			<br>청결
		</label>
		<br><br>
	
		<label for="check" class="icons">
			<img class="diaryIcon" src="<%=cp%>/images/icons/main/check.png"
			alt="check" id="check" title="진료">
			<br>진료
		</label>
		<label for="beauty" class="icons">
			<img class="diaryIcon" src="<%=cp%>/images/icons/main/beauty.png"
			alt="beauty" id="beauty" title="미용">
			<br>미용
		</label>
		<label for="nutrients" class="icons">
			<img class="diaryIcon" src="<%=cp%>/images/icons/main/nutrients.png"
			alt="nutrients" id="nutrients" title="영양제">
			<br>영양제
		</label>
		<label for="train" class="icons">
			<img class="diaryIcon" src="<%=cp%>/images/icons/main/train.png"
			alt="train" id="train" title="훈련">
			<br>훈련
		</label>
		<label for="etc" class="icons">
			<img class="diaryIcon" src="<%=cp%>/images/icons/main/etc.png"
			alt="etc" id="etc" title="기타">
			<br>기타
		</label>
		
	</div>


</body>
</html>