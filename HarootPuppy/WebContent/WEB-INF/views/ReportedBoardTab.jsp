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
<title>ReportedBoardTab.jsp</title>

<!-- jQuery JS -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-ui.js"></script>
<!-- jQuery-UI CSS -->
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/jquery-ui.css">

<!--  부트스트랩 JS -->
<script type="text/javascript" src="<%=cp%>/js/bootstrap.js"></script>
<script src="<%=cp%>/js/bootstrap.min.js"></script>

<!-- 부트스트랩 CSS -->
<link rel="stylesheet" href="<%=cp%>/css/bootstrap.css">


<style type="text/css">

	/* 탭 관련 css */
	.nav-tabs { border-bottom: 2px solid #DDD; }
    .nav-tabs > li.active > a, .nav-tabs > li.active > a:focus, .nav-tabs > li.active > a:hover { border-width: 0; }
    .nav-tabs > li > a { border: none; color: #ffffff; background: #0e6bca; }
        .nav-tabs > li.active > a, .nav-tabs > li > a:hover { border: none;  color: #0e6bca !important; background: #fff; }
        .nav-tabs > li > a::after { content: ""; background: #0e6bca; height: 2px; position: absolute; width: 100%; left: 0px; bottom: -1px; transition: all 250ms ease 0s; transform: scale(0); }
    .nav-tabs > li.active > a::after, .nav-tabs > li:hover > a::after { transform: scale(1); }
	.tab-nav > li > a::after { background: #0e6bca none repeat scroll 0% 0%; color: #fff; }
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

<!-----------------------------
  reportTabForm.jsp
  - 신고페이지 탭 폼
------------------------------->
<div>
	<!-- 메뉴영역 -->
	<div id="harootHeader">
		<c:import url="AdminMenu.jsp"></c:import>
	</div>

	<!-- content 영역 -->
	<div id="harootContent">
	
			
		<div style="text-align: center;">
			<h1>게시판신고 - 신고된 게시물</h1>
		</div>	
		
		<br><br><br><br>
			
		<!-- New 보라색 탭 디자인 -->
		<div class="container">
		  <div class="row">
		    <div class="col-md-12"> 
		      <!-- Nav tabs -->
		      <div class="card">
		        <ul class="nav nav-tabs nav-justified" role="tablist">
		          <li role="presentation" class="active"><a href="#reportMenu1" aria-controls="reportMenu1" role="tab" data-toggle="tab"><i class="fa fa-all"></i>
		          	<span>전체</span></a>
		          </li>
		          <li role="presentation"><a href="#reportMenu2" aria-controls="reportMenu2" role="tab" data-toggle="tab"><i class="fa fa-yet"></i>
		          	<span>미처리</span></a>
		          </li>
		          <li role="presentation"><a href="#reportMenu3" aria-controls="reportMenu3" role="tab" data-toggle="tab"><i class="fa fa-cancel"></i>
		          	<span>신고 해제</span></a>
		          </li>
		          <li role="presentation"><a href="#reportMenu4" aria-controls="reportMenu4" role="tab" data-toggle="tab"><i class="fa fa-complete"></i>
		          	<span>신고 확정</span></a>
		          </li>
		        </ul>
		        
		        <!-- Tab panes -->
		        <div class="tab-content">
		          <div role="tabpanel" class="tab-pane active" id="reportMenu1">
		          	<!-- 전체 신고 자리  -->
		          	<%-- 
		          	무한로딩 걸림 ㅠ
		          	<jsp:include page="/adminreportboardlist.action">
		          		<jsp:param value="1" name="test"/>
		          	</jsp:include> 
		          	 --%>
		          	<c:import url="ReportedBoardList.jsp"></c:import>
		          </div>
		          <div role="tabpanel" class="tab-pane" id="reportMenu2">
					<!-- 미처리 신고 자리  -->
		          	<c:import url="ReportedBoardList1.jsp"></c:import>
		          </div>
		          <div role="tabpanel" class="tab-pane" id="reportMenu3">
		          	<!-- 신고 해제 자리 -->
		          	<c:import url="ReportedBoardList2.jsp"></c:import>
		          </div>
		          <div role="tabpanel" class="tab-pane" id="reportMenu4">
		          	<!-- 신고 완료 자리 -->
		          	<c:import url="ReportedBoardList3.jsp"></c:import>
		          	
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