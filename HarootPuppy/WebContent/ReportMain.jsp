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
<title>ReportMain.jsp</title>
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

<style type="text/css">
	/* body
	{
		margin: 0px !important;
	} 
	*/
	 
	a.link { text-decoration: none; color: black; }
    a.link:visited { text-decoration: none; }
    a.link:hover { text-decoration: none; font-weight: bold; }
    a.link:focus { text-decoration: none; }
    a.link:hover, a:active { text-decoration: none; }
    
    /* 추가 */
    
    .adminTd1, .adminTd2
    {
    	width: 450px;
    	vertical-align: text-top; /* 수직 중앙정렬 해제 */
    	
    }
    
    /*
     .color1
    {
    	background-color: rgb(208,208,208); 
    }
    
    .color2
    {
    	background-color: rgb(239,239,239); 
    }
    */
    
    #out
    {
    	width: 1700px; 
    	margin: 20px auto;
    }
    
    .spanSt1
    {
    	color: rgb(51,122,183);
    	font-weight: bold;
    	font_underline: rgb(51,122,183);
    	
    }
    
    .tableIn
    {
    	display: inline-block;
    	margin: 20px;
    }
  
    .bold
    {
    	font-weight: bold;
    }
    
    /*
     #bodyCss h1
    { text-align: center; }
    #bodyCss h2
    { text-align: center; }
    #bodyCss h3
    { text-align: center; } 
    */

	 #bodyCss h1, h2, h3
    { text-align: center; }
    
</style>
</head>
<body id="bodyCss">

<div id="harootHeader">
	<c:import url="AdminMenu.jsp"></c:import>
</div>

<br><br>

<div style="text-align: center;">
	<h1 class="bold">신고 관리</h1>
	<hr>
</div>

<div id="out">
	<div class="in">
		<table style="width:1600px;" id="adminMenu">
				<tr>
					<th>
						<h3 class="bold">게시판 신고</h3>
					</th>
					<!-- <th style="text-align: center;"> -->
					
					<th>
						<h3 class="bold">산책메이트 온라인 신고</h3>
					</th>
					<!-- <th style="text-align: center;"> -->
					<th>
						<h3 class="bold">산책메이트 오프라인 신고</h3>
					</th>
				</tr>
				<tr>
					<td class="adminTd1 color2">
						<ul>
							<!-- <li><a href="ReportedBoardTab.jsp" class="link">미처리 게시물 50건</a></li> -->
							<li>
								<a href="ReportedBoardTab.jsp" class="link">
									미처리 게시물 <span class="spanSt1">${boardNotHandled }</span>건
								</a>
							</li>
							<!-- <li><a href="ReportedReplyTab.jsp" class="link">미처리 댓글 50건</a></li> -->
							<li>
								<a href="ReportedReplyTab.jsp" class="link">
								미처리 댓글 <span class="spanSt1">${boardCommNotHandled }</span>건
								</a>
							</li>
						</ul>
					</td>
					<td class="adminTd2 color1">
						<h4 style="font-weight: bold;">&nbsp;&nbsp;&nbsp;온라인 신고</h4>
						<ul>
							
							<li>
								<a href="adminreportboardlist.action" class="link">
								미처리 게시물 <span class="spanSt1">${walkNotHandled }</span>건
								</a>
							</li>
							
							<!-- <li>미처리 댓글 50건</li> -->
							
							<li>
								<a href="" class="link">
								미처리 댓글 <span class="spanSt1">${walkCommNotHandled }</span>건
								</a>
							</li>
							
						</ul>
						
					</td>
					<td class="adminTd1 color2">
						<h4 class="bold">&nbsp;&nbsp;&nbsp;오프라인 신고</h4>
						<ul>
							<li>
								<a href="" class="link">
								미처리 무단결석 의견 <span class="spanSt1">${walkOffNotHandled }</span>건
								</a>
							</li>
							
						
						</ul>
					</td>
				</tr>
		</table>
	</div>
	<br><br><br><br>
	<div class="in tableIn">
		 <table class="table table-hover table-striped table-condensed " style="width:480px; ">
		 	<tr>
		 		<th>>> 신고된 게시물 바로가기</th>
		 		<th style="text-align: right">
		 			NEW <span class="spanSt1">${boardNotRead }</span>
		 		</th>
		 	</tr>
		 	 <!-- 게시판 > 게시물 -->
		 	 <!-- c:forEach end 속성으로 일단 2개만 출력(0,1) -->
		 	 <c:forEach var="a1" items="${list1}" end="1">
		 	 	<tr>
		 	 		<!-- 게시물 제목 -->
		 	 		<td>
		 	 			<a class="link" href="adminreportboardview.action?rep_log_code=${a1.rep_log_code }">${a1.board_title }</a>
		 	 		</td>
		 	 		<!-- 신고날짜 -->
		 	 		<td>${a1.rep_log_date }</td>
		 	 	</tr>
		 	 </c:forEach>
		</table>
	</div>
	<div class="in tableIn">
		 <table class="table table-hover table-striped table-condensed" style="width:480px; ">
		 	<tr>
		 		<th>>> 신고된 산책방 바로가기</th>
		 		<th style="text-align: right">
		 			NEW <span class="spanSt1">${walkNotRead }</span>
		 		</th>
		 	</tr>
		 	
			<!-- c:forEach 반복 출력-->
			<!-- end 속성 부여 -->
			<c:forEach var="a2" items="${list2}" end="1">
				<tr>
					<!-- 산책방 제목 -->
					<td>
					<a class="link" href="">${a2.walkroom_title }</a>
					</td>
					<!-- 신고날짜 -->
					<td>${a2.rep_log_date }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div class="in tableIn">
		 <table class="table table-hover table-striped table-condensed" style="width:480px; ">
		 	<tr>
		 		<th>>> 오프라인신고 의견 바로가기</th>
		 		<th style="text-align: right">
		 			NEW <span class="spanSt1">${offNotRead }</span>
		 		</th>
		 	</tr>
			<!-- c:forEach 로 한.. 5개까지만 출력 해주자-->
			<c:forEach var="a3" items="${list3}" end="1">
				<tr>
					<!-- 오프라인신고 의견 제목 -->
					<td>${a3.offopinion_title }</td>
					<!-- 신고날짜 -->
					<td>${a3.offopinion_date }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>	

<br><br><br><br>

<div id="harootFooter">
	<c:import url="MainFooter.jsp"></c:import>
</div>

</body>
</html>