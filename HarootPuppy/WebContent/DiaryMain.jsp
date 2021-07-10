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
<title>DiaryMain.jsp</title>

<!-- jQuery JS -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-ui.js"></script>
<!-- jQuery-UI CSS -->
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/jquery-ui.css">

<!--  부트스트랩 JS -->
<script type="text/javascript" src="<%=cp%>/js/bootstrap.js"></script>
<!-- 부트스트랩 CSS -->
<link rel="stylesheet" href="<%=cp%>/css/bootstrap.css">

<!-- 반려견다이어리 CSS / JS -->
<link rel="stylesheet" href="<%=cp%>/css/diary.css">
<script type="text/javascript" src="<%=cp%>/js/diary.js"></script>

<style type="text/css">
h1 {
	text-align: center !important;
}

h1>span {
	margin: 0px auto !important;
	text-align: center !important;
	font-size: 25pt !important;
}
#calendarArea
{
	width: 900px;
	margin: 0px auto;
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
	
/* 기본, 특별관리 관련 css */
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
	
// 상태 ~ 출산 까지의 메뉴 버튼 클릭 시 AJAX 처리로 InsertForm 가져오기
		$("#mood").click(function()
		{
			$("#timeline").load("DiaryStateMoodInsertForm.jsp");	
		});
		
		$("#meal").click(function()
		{
			$("#timeline").load("DiaryMealInsertForm.jsp");	
		});

		$("#snack").click(function()
		{
			$("#timeline").load("DiarySnackInsertForm.jsp");	
		});
		
		$("#walk").click(function()
		{
			$("#timeline").load("DiaryWalkInsertForm.jsp");	
		});
		
		$("#clean").click(function()
		{
			$("#allMenu").load("DiaryClean.jsp");
		});
		
		$("#check").click(function()
		{
			$("#allMenu").load("DiaryClinic.jsp");	
		});
		
		$("#beauty").click(function()
		{
			$("#timeline").load("DiaryBeautyInsertForm.jsp");	
		});
		
		$("#nutrients").click(function()
		{
			$("#timeline").load("DiaryNutrientsInsertForm.jsp");	
		});
		
		$("#train").click(function()
		{
			$("#timeline").load("DiaryTrainInsertForm.jsp");	
		});
		
		$("#etc").click(function()
		{
			$("#timeline").load("DiaryEtcInsertForm.jsp");	
		});
		
		$("#poop").click(function()
		{
			$("#timeline").load("DiaryToiletInsertForm.jsp");	
		});
		
		$("#phil").click(function()
		{
			$("#timeline").load("DiaryMedicineInsertForm.jsp");	
		});
		
		$("#birth").click(function()
		{
			$("#timeline").load("DiaryBirthInsertForm.jsp");	
		});
		

// 기본관리, 특별관리 탭 클릭 시 timeline 보이지 않게 하기
		$("#basicForm").click(function()
		{
			if($("#timeline").css("display") != "none")
			{
				$("#timeline").hide();
			}
		
		});
		
		$("#specialForm").click(function()
				{
					if($("#timeline").css("display") != "none")
					{
						$("#timeline").hide();
					}
				
				});
		
		$("#clean").click(function()
				{
					if($("#timeline").css("display") != "none")
					{
						$("#timeline").hide();
					}
				
				});
		
		$("#check").click(function()
				{
					if($("#timeline").css("display") != "none")
					{
						$("#timeline").hide();
					}
				
				});
		
// 기본관리, 특별관리 탭 클릭 후 (timeline이 아예 안보여짐)
// timeline div에 insertform이 (AJAX) 보이도록 하기
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
   DiaryMain.jsp
   - 페이지 설명
------------------------------->

	<div>
		<!-- 메뉴영역 -->
		<div id="harootHeader">
			<c:import url="Main.jsp"></c:import>
		</div>

		<!-- content 영역 -->
		<div>
			<!-- 반려견 이름 출력 -->
			<div>
				<h1 class="badge-parent">
					<br>
					<br> <span class="badge badge-pill badge-warning">${list.pet_name }</span>
				</h1>
				<br>
			</div>
			<!-- 정보보기 버튼 -->
			<div style="text-align: right; margin-right: 500px;">
				<button type="button" class="btn btn-success" id="petInfo" value="${list.pet_code }">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-lightbulb" viewBox="0 0 16 16">
              		<path
							d="M2 6a6 6 0 1 1 10.174 4.31c-.203.196-.359.4-.453.619l-.762 1.769A.5.5 0 0 1 10.5 13a.5.5 0 0 1 0 1 .5.5 0 0 1 0 1l-.224.447a1 1 0 0 1-.894.553H6.618a1 1 0 0 1-.894-.553L5.5 15a.5.5 0 0 1 0-1 .5.5 0 0 1 0-1 .5.5 0 0 1-.46-.302l-.761-1.77a1.964 1.964 0 0 0-.453-.618A5.984 5.984 0 0 1 2 6zm6-5a5 5 0 0 0-3.479 8.592c.263.254.514.564.676.941L5.83 12h4.342l.632-1.467c.162-.377.413-.687.676-.941A5 5 0 0 0 8 1z" />
            		</svg>
					정보 보기
				</button>
				<input type="hidden" value="${list.pet_code }" name="pet_code" id="pet_code">
			</div>
			<br>

			<!-- 달력영역 -->
			<div id="calendarArea" style="background-color: RGB(253,239,142); height: 800px;">
				<c:import url="DiaryCalendarArea.jsp"></c:import>
			</div>
			
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
			          	<c:import url="DiaryBasicMenu.jsp"></c:import>
			          </div>
			          <div role="tabpanel" class="tab-pane" id="menu2">
			          	<c:import url="DiarySpecialMenu.jsp"></c:import>
			          </div>
			        </div>
			      </div>
			    </div>
			  </div>
			</div>
			</div> 
			
			
			
			
			<!-- 타임라인 -->
			<div id="timeline">
			<c:import url="DiaryTimeLine.jsp"></c:import>
			</div>
			
			</div>
			<!-- 기본관리 / 특별관리 탭 영역 끝 -->



		


		<!-- 하단 회사 설명 영역 -->
		<div>
			<c:import url="MainFooter.jsp"></c:import>
		</div>
	</div>

</body>
</html>