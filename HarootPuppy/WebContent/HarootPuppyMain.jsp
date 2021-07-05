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
<title>HarootPuppyMain.jsp</title>

<!-- 핫게 CSS -->
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">

<!-- jQuery JS -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-ui.js"></script>
<!-- jQuery-UI CSS -->
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/jquery-ui.css">

<!--  부트스트랩 JS -->
<script type="text/javascript" src="<%=cp%>/js/bootstrap.js"></script>
<!-- 부트스트랩 CSS -->
<link rel="stylesheet" href="<%=cp%>/css/bootstrap.css">


<style type="text/css">

div.HarootPuppyMain
{
	text-align: center;
	margin: 0px auto !important;
	align-content: center;
	display: inline-block;
	margin-left: 50px;
}



.mainButton
{
	display: inline-block;	
}

#bbsList_list td, th
{
	text-align: center;
}

.button1
{
	background-color : #337AB7;
	border: 1px solid #337AB7;
	font-size: 15px;
	font-weight : bold;
	color: #FFFFFF;
	text-align: center;
	
	width : 350px;
	height: 350px;
	border-radius: 30px;
	
	margin-left :300px;
	margin-top : 150px;
}

.button2
{
	background-color : #5a4080;
	border: 1px solid #5a4080;
	font-size: 15px;
	font-weight : bold;
	margin-left:20px;
	color: #FFFFFF;
	text-align: center;
	margin: 0px auto;
	width : 350px;
	height: 350px;
	border-radius: 30px;
}

.tdMain
{
	color: #FFFFFF;
}

/* img.mainPhoto
{
	opacity: 0.5; 
	filter: alpha(opacity=50);
} */

.mainPhoto
{
	position: fixed; 
  	top: 0; 
  	left: 0; 
  	
	width : 100%;
	z-index: -1;
}

</style>



</head>
<body>

<!-------------------------------------
  HarootPuppyMain.jsp
  - 홈페이지의 가장 첫 화면 (찐 메인)
--------------------------------------->
<div class="allIn">
<img class="allIn mainPhoto" src="<%=cp%>/images/gogo.png" id="photo" title="배경"> 

	<!-- 메뉴영역 -->
	<div id="harootHeader">
		<c:import url="Main.jsp"></c:import>
	</div>

	<!-- content 영역 -->
	<div id="HarootMainContent">
	
		<!-- 사진 → 다이어리 / 산책메이트로 이동 -->
		<div class="form-group HarootPuppyMain">
		
			<div class="form-group mainButton">	
				
			<button class="HarootMain button1" 
			style="margin-right: 50px;"
			onclick="location.href='DiaryMain.jsp'">
			<p style="color:#FFFFFF; font-size:20px;
			font-weight:bold;">반려견의 매일을
			<br>기록해보세요💌</p>
			</button>						
			
			<button class="HarootMain button2"
			style="margin-right: 50px;"
			onclick="location.href='DiaryMain.jsp'">
			<p style="color:#FFFFFF; font-size:20px;
			font-weight:bold;">나의 반려견에게 
			<br>친구를 만들어주세요✨</p>
			</button>
			
			</div>
	
		</div>
	
		
	<br><br><br>
	<!-- HOT 게시판 영역 -->
	<div id="bbsList" style="width:900px; margin:30px auto; text-align: left; ">
	<div class="tab">
	
		<div class="tabContent">
			<div id="tab01">
				<div id="bbsList">
					<div id="bbsList_title" style="text-align: center;">
						<h1 style="font-weight: bold; color:#FFFFFF;">HOT 게시판</h1>
					</div>
					<div>
					      <form action="" name="categoryForm" method="post">
					         <select name="categoryKey" class="selectField">
					            <option value="notic">공지</option>
					            <option value="event">행사/할인정보</option>
					            <option value="review">리뷰</option>
					            <option value="talk">수다</option>
					            <option value="used">중고장터</option>
					         </select>
					      </form>
					</div><br>
					<table id="bbsList_list" class="table" style="text-align: center;">
						<tr id="title">
							<th class="cate">카테고리</th>
							<th class="num">번호</th>
							<th class="subject">제목</th>
							<th class="name">작성자</th>
							<th class="created">작성일</th>
							<th class="hitCount">조회수</th>
							<th class="like">좋아요</th>
						</tr>
						<tr id="lists" style="color:#FFFFFF;"> 
							<td class="tdMain cate">리뷰</td>
							<td class="tdMain num">리뷰</td>
							<td class="tdMain subject">리뷰</td>
							<td class="tdMain name">리뷰</td>
							<td class="tdMain created">리뷰</td>
							<td class="tdMain hitCount">리뷰</td> 
							<td class="tdMain like">리뷰</td>						
						</tr>
					</table>
					
					<div id="footer_number" style="text-align: center;">
						<p class="tdMain">1 Prev 21 22 23 24 25 26 27 28 29 30 Next 63</p>
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