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
<title>UserMyPageBoard.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/list.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/jquery-ui.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<style type="text/css">

	#bbsList_title, .table th, .table td
	{
		text-align: center;
		
	}
	
</style>
<script type="text/javaScript">
	$(document).ready(function()
	{
		$("#categoryKey").on('change', function()
		{
			if (this.value == "board")
				$("#loadArea").load("UserMyPageBoard.jsp");
			else if (this.value == "reply")
				$("#loadArea").load("UserMyPageReply.jsp");

		});
	});

	/*
	 $("#categoryKey").change(function() {

	 $("#categoryKey option:selected").each(function() {

	 alert($("#itemNm").val($(this).val()));

	 });

	 });
	 */
</script>
</head>
<body>
	<div id="loadArea">
		<div id="bbsList">
			<div id="bbsList_title">내 게시글 보기</div>
			<select name="categoryKey" id="categoryKey" class="selectField">
				<option value="board" selected="selected">게시글</option>
				<option value="reply">댓글</option>
			</select><br>
			<table id="bbsList_list" class="table">
				<tr>
					<th class="cate">카테고리</th>
					<th class="num">번호</th>
					<th class="subject">제목</th>
					<th class="name">작성자</th>
					<th class="created">작성일</th>
					<th class="hitCount">조회수</th>
					<th class="like">좋아요</th>
				</tr>
				<tr>
					<td class="cate">리뷰</td>
					<td class="num">1</td>
					<td class="subject">진수여요</td>
					<td class="name">진수123</td>
					<td class="created">2021-06-26</td>
					<td class="hitCount">23</td>
					<td class="like">12</td>
				</tr>
			</table>
			<div id="bbsList_header">
				<br>
				<div id="leftHeader">
					<form action="" name="searchForm" method="post">
						<select name="searchKey" class="selectField">
							<option value="subject">제목</option>
							<option value="name">작성자</option>
						</select> <input type="text" name="searchValue" class="textField">
						<input type="button" value="검색" class="btn2" onclick="sendIt()">
					</form>
				</div>
				<!-- #leftHeader -->

				<div id="rightHeader">
					<input type="button" value="글쓰기" class="btn2"
						onclick="javascript:location.href='<%=cp%>/Created.jsp'">
				</div>

			</div>

			<div id="footer_number">
				<p>1 Prev 21 22 23 24 25 26 27 28 29 30 Next 63</p>
			</div>

		</div>
	</div>
</body>
</html>
