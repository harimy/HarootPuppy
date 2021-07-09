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

<!-- 다이어리 CSS -->
<link rel="stylesheet" href="<%=cp%>/css/diary.css">
<script type="text/javascript" src="<%=cp%>/js/diary.js"></script>


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


/* 탭 관련 css */
	.nav-tabs { border-bottom: 2px solid #DDD; }
    .nav-tabs > li.active > a, .nav-tabs > li.active > a:focus, .nav-tabs > li.active > a:hover { border-width: 0; }
    .nav-tabs > li > a { border: none; color: #ffffff; background: #F7819F; }
        .nav-tabs > li.active > a, .nav-tabs > li > a:hover { border: none;  color: #F7819F !important; background: #fff; }
        .nav-tabs > li > a::after { content: ""; background: #F7819F; height: 2px; position: absolute; width: 100%; left: 0px; bottom: -1px; transition: all 250ms ease 0s; transform: scale(0); }
    .nav-tabs > li.active > a::after, .nav-tabs > li:hover > a::after { transform: scale(1); }
	.tab-nav > li > a::after { background: #F7819F none repeat scroll 0% 0%; color: #fff; }
	.tab-pane { padding: 15px 0; }
	.tab-content{padding:20px}
	.nav-tabs > li  {width:20%; text-align:center;}
	.card {background: #FFF none repeat scroll 0% 0%; box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.3); margin-bottom: 30px; }
	
	@media all and (max-width:724px){
	.nav-tabs > li > a > span {display:none;}	
	.nav-tabs > li > a {padding: 5px 5px;}

</style>

<script type="text/javascript">
// AJAX 처리를 위함
	
$(function()
{
	
	$("#check").click(function()
			{
				$("#timeline").load("DiaryClinicCheckInsertForm.jsp");	
			});
			
	$("#injection").click(function()
			{
				$("#timeline").load("DiaryClinicInjectionInsertForm.jsp");	
			});
			
	$("#disease").click(function()
			{
				$("#timeline").load("DiaryClinicDiseaseInsertForm.jsp");	
			});
			
	$("#surgery").click(function()
			{
				$("#timeline").load("DiaryClinicSurgeryInsertForm.jsp");	
			});
	
	$("#basicForm").click(function()
			{
				$("#allMenu").load("DiaryAllMenu.jsp");	
			});
	
	// 기본관리, 특별관리 탭 클릭 시 timeline 보이지 않게 하기
	$("#specialForm").click(function()
			{
				if($("#timeline").css("display") != "none")
				{
					$("#timeline").hide();
				}
			
			});
			
	$("#basicForm").click(function()
			{
				if($("#timeline").css("display") != "none")
				{
					$("#timeline").hide();
				}
			
			});
	
// 클릭 시 timeline div에 보여지도록 하기	
	$("#check").click(function()
			{
				if($("#timeline").css("display") == "none")
				{
					$("#timeline").show();
				}
			
			});
			
	$("#injection").click(function()
			{
				if($("#timeline").css("display") == "none")
				{
					$("#timeline").show();
				}
			
			});
	
	$("#disease").click(function()
			{
				if($("#timeline").css("display") == "none")
				{
					$("#timeline").show();
				}
			
			});
	
	$("#surgery").click(function()
			{
				if($("#timeline").css("display") == "none")
				{
					$("#timeline").show();
				}
			
			});
	
	$("#poop").click(function()
			{
				if($("#timeline").css("display") == "none")
				{
					$("#timeline").show();
				}
			
			});
	
	$("#phil").click(function()
			{
				if($("#timeline").css("display") == "none")
				{
					$("#timeline").show();
				}
			
			});
	
	$("#birth").click(function()
			{
				if($("#timeline").css("display") == "none")
				{
					$("#timeline").show();
				}
			
			});
});
	
</script>

</head>
<body>

<!--
	DiaryClinic.jsp
	- 진료 선택 시 (건강검진, 접종, 질환, 수술) 연결
-->


	<!-- 진료 메인 -->
	<!-- 기본관리 / 특별관리 탭 영역-->
	<div class="container" id="allMenu">
	  <div class="row">			
	    <div class="col-md-12" style="width:80%; margin-left :10%;">
	    
	      <!-- Nav tabs -->
	      <div class="card">
	        <ul class="nav nav-tabs nav-justified" role="tablist">
	          <li role="presentation" class="active" id="basicForm"><a href="#menu1" aria-controls="home" role="tab" data-toggle="tab"><i class="fa fa-home"></i>  <span>기본관리</span></a></li>
	          <li role="presentation" id="specialForm"><a href="#menu2" aria-controls="profile" role="tab" data-toggle="tab"><i class="fa fa-user"></i>  <span>특별관리</span></a></li>
	        </ul>
	        
	        <!-- Tab panes -->
	        <div class="tab-content">
	          <div role="tabpanel" class="tab-pane active" id="menu1">
					
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

	          </div>
	          <div role="tabpanel" class="tab-pane" id="menu2">
	          	<c:import url="DiarySpecialMenu.jsp"></c:import>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
	
	


</body>
</html>