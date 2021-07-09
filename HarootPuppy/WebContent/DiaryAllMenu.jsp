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
<title>Sample.jsp</title>

<!-- 제이쿼리 -->
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<!-- jQuery-UI CSS -->
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/jquery-ui.css">

<!-- 부트스트랩 -->
<script type="text/javascript" src="js/bootstrap.js"></script>

<!-- 부트스트랩 CSS -->
<link rel="stylesheet" href="<%=cp%>/css/bootstrap.css">

<script type="text/javascript">
</script>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/jquery-ui.css">
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

<script type="text/javascript">
$(function()
		{
	$("#mood").click(function()
			{
				if($("#timeline").css("display") == "none")
				{
					$("#timeline").show();
				}
			
			});
			
	$("#meal").click(function()
			{
				if($("#timeline").css("display") == "none")
				{
					$("#timeline").show();
				}
			
			});
	
	$("#snack").click(function()
			{
				if($("#timeline").css("display") == "none")
				{
					$("#timeline").show();
				}
			
			});
	
	$("#walk").click(function()
			{
				if($("#timeline").css("display") == "none")
				{
					$("#timeline").show();
				}
			
			});
	
		
	$("#beauty").click(function()
			{
				if($("#timeline").css("display") == "none")
				{
					$("#timeline").show();
				}
			
			});
	
	$("#nutrients").click(function()
			{
				if($("#timeline").css("display") == "none")
				{
					$("#timeline").show();
				}
			
			});
	
	$("#train").click(function()
			{
				if($("#timeline").css("display") == "none")
				{
					$("#timeline").show();
				}
			
			});
	
	$("#etc").click(function()
			{
				if($("#timeline").css("display") == "none")
				{
					$("#timeline").show();
				}
			
			});
	
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
	<div>

		<!-- 기본관리 / 특별관리 탭 영역-->
			<div class="container" id="allMenu">
			  <div class="row">			
			    <div class="col-md-12" style="width:80%; margin-left :10%;">
			    
			      <!-- Nav tabs -->
			      <div class="card">
			        <ul class="nav nav-tabs nav-justified" role="tablist">
			          <li role="presentation" class="active" id="basicForm"><a href="#menu1" aria-controls="home" role="tab" data-toggle="tab"><i class="fa "></i>  <span>기본관리</span></a></li>
			          <li role="presentation" id="specialForm"><a href="#menu2" aria-controls="profile" role="tab" data-toggle="tab"><i class="fa fa-user"></i>  <span>특별관리</span></a></li>
			        </ul>
			        
			        <!-- Tab panes -->
			        <div class="tab-content">
			          <div role="tabpanel" class="tab-pane active" id="menu1">
			          	<!-- 상태, 식사, 간식, 산책, 청결
							 진료, 미용, 영양제, 훈련, 기타 -->
						<div class="diaryMenu">
							<label for="mood" class="icons" >
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
							<label for="walk" class="icons" >
								<img class="diaryIcon" src="<%=cp%>/images/icons/main/walk.png"
								alt="walk" id="walk" title="산책">
								<br>산책
							</label>
							<label for="clean" class="icons" >
								<img class="diaryIcon" src="<%=cp%>/images/icons/main/clean.png"
								alt="clean" id="clean" title="청결">
								<br>청결
							</label>
							<br><br>
						
							<label for="check" class="icons" >
								<img class="diaryIcon" src="<%=cp%>/images/icons/main/check.png"
								alt="check" id="check" title="진료">
								<br>진료
							</label>
							<label for="beauty" class="icons" >
								<img class="diaryIcon" src="<%=cp%>/images/icons/main/beauty.png"
								alt="beauty" id="beauty" title="미용">
								<br>미용
							</label>
							<label for="nutrients" class="icons" >
								<img class="diaryIcon" src="<%=cp%>/images/icons/main/nutrients.png"
								alt="nutrients" id="nutrients" title="영양제">
								<br>영양제
							</label>
							<label for="train" class="icons" >
								<img class="diaryIcon" src="<%=cp%>/images/icons/main/train.png"
								alt="train" id="train" title="훈련">
								<br>훈련
							</label>
							<label for="etc" class="icons" >
								<img class="diaryIcon" src="<%=cp%>/images/icons/main/etc.png"
								alt="etc" id="etc" title="기타">
								<br>기타
							</label>
							
						</div>
			          </div>
			          <div role="tabpanel" class="tab-pane" id="menu2">
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
			         
			          </div>
			        </div>
			      </div>
			    </div>
			  </div>
			</div>
			</div>



</body>

</html>