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
<title>UserMyPageReply.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/jquery-ui.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
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
<jsp:include page="Main.jsp" />

	<div id="loadArea">
		<div id="bbsList">
			<div id="bbsList_title" style="text-align: center;">내 댓글 보기</div>
			<select name="categoryKey" id="categoryKey" class="selectField">
				<option value="board">게시글</option>
				<option value="reply" selected="selected">댓글</option>
			</select>
			<table id="bbsList_list" class="table" style="text-align: center;">
				<tr>
					<th class="subject">제목</th>
					<th class="name">작성자</th>
					<th class="created">작성일</th>
				</tr>
				<tr>
					<td class="subject">오늘밤 진수는 혼자여요</td>
					<td class="name">진수123</td>
					<td class="created">2021-06-27</td>
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

			<div id="footer">
				<p>1 Prev 21 22 23 24 25 26 27 28 29 30 Next 63</p>
			</div>

		</div>
	</div>
</body>
</html>
