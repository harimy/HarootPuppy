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
<title>UserMyPage.jsp</title>
<!-- 부트스트랩 css -->
<link rel="stylesheet" href="<%=cp%>/css/bootstrap.min.css">

<!-- 제이쿼리 script -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<!-- 부트스트랩 script -->
<script src="<%=cp%>/js/bootstrap.min.js"></script>

<style type="text/css">
</style>
</head>
<body>

	<!-----------------------------
  Sample.jsp
  - 페이지 설명
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
					<a class="nav-link" data-toggle="tab" href="#home">Home</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" data-toggle="tab" href="#menu1">Menu1</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" data-toggle="tab" href="#menu2">Menu2</a>
				</li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane container fade active" id="home">
					<c:import url="UserMyPageBoard.jsp"></c:import>
				</div>
				<div class="tab-pane container fade" id="menu1">
					<c:import url="UserMyPageBlock.jsp"></c:import>
				</div>
				<div class="tab-pane container fade" id="menu2">
					<c:import url="UserMyPageReport.jsp"></c:import>
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