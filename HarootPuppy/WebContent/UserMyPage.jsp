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
<link rel="stylesheet" href="<%=cp%>/css/bootstrap.css">

<!-- 제이쿼리 script -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>

<!-- 부트스트랩 script -->
<script src="<%=cp%>/js/bootstrap.min.js"></script>

<style type="text/css">
	
	.nameArea
	{
	
	
		margin-left: 50px;
		margin-right: 30px;
		float: left;
	}
	
	.container
	{
		display: inline-block;
	}
	

	/* 탭 관련 css */
	.nav-tabs { border-bottom: 2px solid #DDD; }
    .nav-tabs > li.active > a, .nav-tabs > li.active > a:focus, .nav-tabs > li.active > a:hover { border-width: 0; }
    .nav-tabs > li > a { border: none; color: #ffffff; background: #5a4080; }
        .nav-tabs > li.active > a, .nav-tabs > li > a:hover { border: none;  color: #5a4080 !important; background: #fff; }
        .nav-tabs > li > a::after { content: ""; background: #5a4080; height: 2px; position: absolute; width: 100%; left: 0px; bottom: -1px; transition: all 250ms ease 0s; transform: scale(0); }
    .nav-tabs > li.active > a::after, .nav-tabs > li:hover > a::after { transform: scale(1); }
	.tab-nav > li > a::after { background: #5a4080 none repeat scroll 0% 0%; color: #fff; }
	.tab-pane { padding: 15px 0; }
	.tab-content{padding:20px}
	.nav-tabs > li  {width:20%; text-align:center;}
	.card {background: #FFF none repeat scroll 0% 0%; box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.3); margin-bottom: 30px; }
	
	@media all and (max-width:724px){
	.nav-tabs > li > a > span {display:none;}	
	.nav-tabs > li > a {padding: 5px 5px;}
	
</style>
</head>
<body>

<jsp:include page="Main.jsp"></jsp:include>

<!-----------------------------
  UserMyPage.jsp
  - 마이페이지 메인
  - 탭으로 구성하여 각각의 페이지 import
------------------------------->
	<div>

		<br><br><br>

		<!-- content 영역 -->
		<div id="harootContent">
		
			<!-- 기존의 파란색 탭 디자인 -->
			<%-- 
			<div class="nameArea">
				<img src="images/user.jpg" width=200px /> <br> 이름(닉네임)<br>
				아이디@test.com<br>
			</div> 
			<div class="tabArea">
				<ul class="nav nav-pills nav-justified">
					<li class="nav-item"><a class="nav-link active" 
					data-toggle="tab" href="#menu1">나의 게시물</a></li>
					<li class="nav-item"><a class="nav-link"
						data-toggle="tab" href="#menu2" >차단 회원 관리</a></li>
					<li class="nav-item"><a class="nav-link"
						data-toggle="tab" href="#menu3" id="#menu3">나의 신고 관리</a></li>
					<li class="nav-item"><a class="nav-link"
						data-toggle="tab" href="#menu4" id="#menu4">회원 정보 수정</a></li>
					<li class="nav-item"><a class="nav-link"
						data-toggle="tab" href="#menu5" id="#menu5">회원 탈퇴</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane container active" id="menu1">
						<c:import url="UserMyPageBoard.jsp"></c:import>
					</div>
					<div class="tab-pane container" id="menu2">
						<c:import url="UserMyPageBlock.jsp"></c:import>
					</div>
					<div class="tab-pane container" id="menu3">
						<c:import url="UserMyPageReport.jsp"></c:import>
					</div>
					<div class="tab-pane container" id="menu4">
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
			--%>
			
			
			<div class="nameArea thumbnail">
				<img src="images/user.jpg" width=200px/> <br> 이름(닉네임)<br>
				아이디@test.com<br>
			</div> 
			<div class="container">
			  <div class="row">			
			    <div class="col-md-12">
			    
			      <!-- Nav tabs -->
			      <div class="card">
			        <ul class="nav nav-tabs nav-justified" role="tablist">
			          <li role="presentation" class="active"><a href="#menu1" aria-controls="home" role="tab" data-toggle="tab"><i class="fa fa-home"></i>  <span>나의 게시물</span></a></li>
			          <li role="presentation"><a href="#menu2" aria-controls="profile" role="tab" data-toggle="tab"><i class="fa fa-user"></i>  <span>차단 회원 관리</span></a></li>
			          <li role="presentation"><a href="#menu3" aria-controls="messages" role="tab" data-toggle="tab"><i class="fa fa-envelope-o"></i>  <span>나의 신고 관리</span></a></li>
			          <li role="presentation"><a href="#menu4" aria-controls="settings" role="tab" data-toggle="tab"><i class="fa fa-cog"></i>  <span>회원 정보 수정</span></a></li>
			          <li role="presentation"><a href="#menu5" aria-controls="settings" role="tab" data-toggle="tab"><i class="fa fa-plus-square-o"></i>  <span>회원 탈퇴</span></a></li>
			        </ul>
			        
			        <!-- Tab panes -->
			        <div class="tab-content">
			          <div role="tabpanel" class="tab-pane active" id="menu1">
			          	<c:import url="UserMyPageBoard.jsp"></c:import>
			          </div>
			          <div role="tabpanel" class="tab-pane" id="menu2">
			          	<c:import url="UserMyPageBlock.jsp"></c:import>
			          </div>
			          <div role="tabpanel" class="tab-pane" id="menu3">
			          	<c:import url="UserMyPageReport.jsp"></c:import>
			          </div>
			          <div role="tabpanel" class="tab-pane" id="menu4">
			          	<c:import url="RegisterForm.jsp"></c:import>
			          </div>
			          <div role="tabpanel" class="tab-pane" id="menu5">
			          	<c:import url="UserMyPageOut.jsp"></c:import>
			          </div>
			        </div>
			      </div>
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