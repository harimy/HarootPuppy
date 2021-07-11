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

.container
{
	width:100%;
	text-align: center;
}

.row
{
	display:inline-block;
}
</style>

<script type="text/javascript">
// AJAX 처리를 위한 
$(function()
{
	$("#toothbrush").click(function()
			{
				$("#timeline").load("DiaryCleanToothInsertForm.jsp");	
			});
			
	$("#earClean").click(function()
			{
				$("#timeline").load("DiaryCleanEarInsertForm.jsp");	
			});
			
	$("#bath").click(function()
			{
				$("#timeline").load("DiaryCleanBathInsertForm.jsp");	
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
	$("#toothbrush").click(function()
			{
				if($("#timeline").css("display") == "none")
				{
					$("#timeline").show();
				}
			
			});
			
	$("#earClean").click(function()
			{
				if($("#timeline").css("display") == "none")
				{
					$("#timeline").show();
				}
			
			});
	
	$("#bath").click(function()
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
	<!-----------------------------
  Sample.jsp
  - 페이지 설명
------------------------------->


	<!-- content 영역 -->
	
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
					
					<!-- 양치 귀청소 목욕 -->
					<div class="diaryMenu">
						<label for="clean" class="icons">
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