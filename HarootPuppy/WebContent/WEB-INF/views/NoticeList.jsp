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
		<div class="form-group titleNotice">
			<h1 style="font-weight: bold;">공지 관리</h1>
		</div>
		<br>

		<!-- 게시판  -->
		<div id="bbsList1" style="width:900px; margin:30px auto; text-align: left; ">
			<div>
		      <form action="" name="categoryForm" method="post">
		         <select name="categoryKey" style="width: 70px; height: 28px;">
		            <option value="1">안내</option>
		            <option value="2">필독</option>
		            <option value="3">공지</option>
		         </select>
		         
		      </form>
		    </div>
		    <br>
			
			<table class="table table-striped table-condensed table-hover"
				style="text-align: center; width: 100%;">
				<tr id="title">
					<th class="cate" style="text-align: center;">카테고리</th>
					<th class="num" style="text-align: center;">공지번호</th>
					<th class="subject" style="text-align: center;">제목</th>
					<th class="name" style="text-align: center;">작성자</th>
					<th class="" style="text-align: center;">작성일</th>
					<!-- <th class="hitCount" style="text-align: center;">조회수</th>
					<th class="like" style="text-align: center;">좋아요</th> -->
				</tr>
				<!-- 
				<tr id="lists1">
					<td class="cate">공지</td>
					<td class="num">001</td>
					<td class="subject">리뷰관련건</td>
					<td class="name">관리자001</td>
					<td class="">2021-07-03</td>
					<td class="hitCount">10</td>
					<td class="like">1</td>
				</tr>
				 -->
				<c:forEach var="list" items="${list }">
					<tr>
						<td>${list.notice_cate_content }</td>					
						<td>${list.notice_code }</td>					
						<td>${list.notice_title }</td>					
						<td>관리자</td>					
						<td>${list.notice_date }</td>					
						<%-- <td>${list.notice_view }</td>	 --%>		
						<%-- <td>${list.notice_like }</td> --%>					
					</tr>
				</c:forEach>
			</table>
	
			<br>
			<div>
				<br>
				<div style="display: inline-block; width:360px;">
					<form action="" name="searchForm" method="post">
						<select name="searchKey" style="width: 70px; height: 28px;">
							<option value="subject">제목</option>
							<option value="name">작성자</option>
						</select> <input type="text" name="searchValue" class="textField">
						<input type="button" value="검색" class="btn btn-secondary" onclick="sendIt()">
					</form>
				</div>
				<!-- #leftHeader -->
	
				<div style="display: inline-block; float: right;">
					<input type="button" value="글쓰기" class="btn btn-secondary"
						onclick="location.href='adminnoticeinsertform.action'">
				</div>
	
			</div>
			<!-- #bbsList_header -->
			<br>
			<br>
			<div id="footer_number" style="text-align: center;">
				<p><span style="font-weight: bold;">1</span> 2 3 4 5 6 7 8 9 10</p>
			</div>
		</div>
	</div>



</div>


</body>
</html>