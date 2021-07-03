<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WalkHistoryMain.jsp</title>
<!-- 부트스트랩 css -->
<link rel="stylesheet" href="<%=cp%>/css/bootstrap.min.css">

<!-- 제이쿼리 script -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<!-- 부트스트랩 script -->
<script src="<%=cp%>/js/bootstrap.min.js"></script>

</head>
<body>

<!-----------------------------
   WalkHistoryMain.jsp
   - 산책 히스토리 메인
------------------------------->
	<div>
		<!-- 메뉴영역 -->
		<div id="harootHeader">
			<c:import url="Main.jsp"></c:import>
		</div>

		<!-- content 영역 -->
		<div id="harootContent">

			<ul class="nav nav-pills nav-justified">
				<li class="nav-item">
					<a class="nav-link" data-toggle="tab" href="#home">신청완료</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" data-toggle="tab" href="#menu1">산책예정</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" data-toggle="tab" href="#menu2">산책완료</a>
				</li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane container fade active" id="home">
					<c:import url="WalkApplyDone.jsp"></c:import>
				</div>
				<div class="tab-pane container fade" id="menu1">
					<c:import url="WalkScheduled.jsp"></c:import>
				</div>
				<div class="tab-pane container fade" id="menu2">
					<c:import url="WalkFinished.jsp"></c:import>
				</div>
			</div>
		</div>
		<!-- 하단 회사 설명 영역 -->
		<div id="harootFooter">
			<c:import url="MainFooter.jsp"></c:import>
		</div>
	</div>
</body>
</html>