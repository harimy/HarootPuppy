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
}

.MainIcon
{
	width: 500px;
	margin: 0px auto;

}

.diarySpan
{
	text-align: center;
}

.HarootMain
{
	display: inline-block;
	margin-top: 10px;
}

</style>



</head>
<body>

<!-------------------------------------
  HarootPuppyMain.jsp
  - 홈페이지의 가장 첫 화면 (찐 메인)
--------------------------------------->
	<div>
		<!-- 메뉴영역 -->
		<div id="harootHeader">
			<c:import url="Main.jsp"></c:import>
		</div>

		<!-- content 영역 -->
		<div id="harootContent">
		
			<!-- 사진 → 다이어리 / 산책메이트로 이동 -->
			<div class="form-group HarootPuppyMain">
			
				<div class="form-group HarootMain">
				<a style="font-size:20px; font-weight: bold; 
				color:black;" href="DiaryMain.jsp">
				<img class="MainIcon" src="<%=cp%>/images/main1.png"
				alt="diary" id="diary" title="다이어리">
				<br>					
				반려견의 매일을 기록해보세요🎁								
				</a></div>
			
				<div class="form-group HarootMain">
				<a style="font-size:20px; font-weight: bold; 
				color:black;" href="산책메이트메인페이지.jsp">
				<img class="MainIcon" src="<%=cp%>/images/main1.png"
				alt="walkmate" id="walkmate" title="산책메이트">
				<br>					
				반려견에게 친구를 만들어주세요🎈
				</a></div>	
		
			</div>
		
			
		<br><br>	
		<!-- HOT 게시판 영역 -->
		<div class="tab">
		
			<div class="tabContent">
				<div id="tab01">
					<div id="bbsList">
						<div id="bbsList_title" style="text-align: center;">
							<h1>HOT 게시판</h1>
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
							<tr id="lists"> 
								<td class="cate">리뷰</td>
								<td class="num">리뷰</td>
								<td class="subject">리뷰</td>
								<td class="name">리뷰</td>
								<td class="created">리뷰</td>
								<td class="hitCount">리뷰</td> 
								<td class="like">리뷰</td>						
							</tr>
						</table>
						
						<div id="footer_number" style="text-align: center;">
							<p>1 Prev 21 22 23 24 25 26 27 28 29 30 Next 63</p>
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