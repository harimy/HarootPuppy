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
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>

<!-- 부트스트랩 script -->
<script src="<%=cp%>/js/bootstrap.min.js"></script>

<style type="text/css">
.nameArea, .tabArea
{
	display: inline-block !important;
}
</style>
</head>
<body>

<!-----------------------------
  UserMyPage.jsp
  - 마이페이지 메인
  - 탭으로 구성하여 각각의 페이지 import
------------------------------->
	<div>
		<!-- 메뉴영역 -->
		<div id="harootHeader">
			<c:import url="Main.jsp"></c:import>
		</div>

		<!-- content 영역 -->
		<div id="harootContent">
			<div class="nameArea">
				<img src="images/user.jpg" width=200px /> <br> 이름(닉네임)<br>
				아이디@test.com<br>
			</div> 
			<div class="tabArea">
				<ul class="nav nav-pills nav-justified">
					<li class="nav-item"><a class="nav-link active" 
					data-toggle="tab" href="#menu1">나의 게시물</a></li>
					<li class="nav-item"><a class="nav-link"
						data-toggle="tab" href="#menu2">차단 회원 관리</a></li>
					<li class="nav-item"><a class="nav-link"
						data-toggle="tab" href="#menu3">나의 신고 관리</a></li>
					<li class="nav-item"><a class="nav-link"
						data-toggle="tab" href="#menu4">회원 정보 수정</a></li>
					<li class="nav-item"><a class="nav-link"
						data-toggle="tab" href="#menu5">회원 탈퇴</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane container active" id="menu1">
						<c:import url="UserMyPageBoard.jsp"></c:import>
					</div>
					<div class="tab-pane container fade" id="menu2">
						<c:import url="UserMyPageBlock.jsp"></c:import>
					</div>
					<div class="tab-pane container fade" id="menu3">
						<c:import url="UserMyPageReport.jsp"></c:import>
					</div>
					<div class="tab-pane container fade" id="menu4">
						<c:import url="RegisterForm.jsp"></c:import>
					</div>
					<!-- RegisterForm.jsp가 수정용으로 불러와져야 함. 
					이 때, RegisterForm의 Form이 채워지고 
					헤더, 푸터를 포함하는 div는 display:none 상태여야 함.
					-->					
					<div class="tab-pane container fade" id="menu5">
						<c:import url="UserMyPageOut.jsp"></c:import>
					</div>
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