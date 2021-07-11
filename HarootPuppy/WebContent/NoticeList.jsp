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
<title>AdminNotice.jsp</title>

<!-- 게시판 CSS -->
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/list.css">

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

.titleNotice
{
	text-align: center;
}

#bbsList_list td, th
{
	text-align: center;
}


</style>

</head>
<body>

<!-----------------------------
  AdminNotice.jsp
  - 관리자 공지 페이지
------------------------------->
<div>
	<!-- 메뉴영역 -->
	<div id="harootHeader">
		
		<c:import url="AdminMenu.jsp"></c:import>
	</div>


	<!-- content 영역 -->
	<div id="harootAdminNoticeList">

		<!-- 관리자 공지 title -->
		<div class="from-group titleNotice">
			<h1 style="font-weight: bold;">공지 관리</h1>
		</div>
		<br>

		<!-- 게시판  -->
		<div id="bbsList" style="width:900px; margin:30px auto; text-align: left; ">
			<div>
		      <form action="" name="categoryForm" method="post">
		         <select name="categoryKey" class="selectField">
		            <option value="guidance">안내</option>
		            <option value="mustRead">필독</option>
		            <option value="notice">공지</option>
		         </select>
		      </form>
		    </div>
		    <br>
			
			<table id="bbsList_list" class="table"
				style="text-align: center; width: 100%;">
				<tr id="title">
					<th class="cate">카테고리</th>
					<th class="num">번호</th>
					<th class="subject">제목</th>
					<th class="name">작성자</th>
					<th class="">작성일</th>
					<th class="hitCount">조회수</th>
					<th class="like">좋아요</th>
				</tr>
				<tr id="lists">
					<td class="cate">공지</td>
					<td class="num">001</td>
					<td class="subject">리뷰관련건</td>
					<td class="name">관리자001</td>
					<td class="">2021-07-03</td>
					<td class="hitCount">10</td>
					<td class="like">1</td>
				</tr>
			</table>
	
			<br>
			<div id="bbsList_header">
				<br>
				<div id="leftHeader">
					<form action="" name="searchForm" method="post">
						<select name="searchKey" class="selectField">
							<option value="subject">제목</option>
							<option value="name">작성자</option>
						</select> <input type="text" name="searchValue" style="width: 150px;">
						<input type="button" value="검색" class="btn btn-outline-dark"" onclick="sendIt()">
					</form>
				</div>
				<!-- #leftHeader -->
	
				<div id="rightHeader">
					<input type="button" value="글쓰기" class="btn btn-outline-dark""
						onclick="javascript:location.href='<%=cp%>/NoticeInsertForm.jsp'">
				</div>
	
			</div>
			<!-- #bbsList_header -->
			<br>
			<br>
			<div id="footer_number" style="text-align: center;">
				<p>1 Prev 21 22 23 24 25 26 27 28 29 30 Next 63</p>
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