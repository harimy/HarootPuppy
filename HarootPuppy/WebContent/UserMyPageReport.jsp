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
<title>UserMyPageReported.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/jquery-ui.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javaScript">
	$(document).ready(function()
	{
		$("#categoryKey").on('change', function()
		{
			alert(this.value);

			if (this.value == "reported")
				$("#loadArea").load("UserMyPageReported.jsp");
			else if (this.value == "report")
				$("#loadArea").load("UserMyPageReport.jsp");
		});
	});
	
</script>
</head>
<body>

	<div id="loadArea">
		<div id="bbsList">
			<div id="bbsList_title" style="text-align: center;">내가 접수한 신고 보기</div>
			<select name="categoryKey" id="categoryKey" class="selectField">
				<option value="reported" >내가 받은 신고</option>
				<option value="report" selected="selected">내가 접수한 신고</option>
			</select>
			
			<!-- selecet 시 게시판이 정렬되어야 함 -->
			<select name="categoryKey1" id="categoryKey1" class="selectField">
				<option value="reportType" selected="selected" >신고유형</option>
				<option value="reportBoard">게시판</option>
				<option value="reportReply">댓글</option>
				<option value="reportWalkOn">산책메이트:온라인</option>
				<option value="reportWalkOff">산책메이트:오프라인</option>

			</select>
			<select name="categoryKey1" id="categoryKey1" class="selectField">
				<option value="reportStatus"selected="selected">신고상태</option>
				<option value="reportWaiting">처리대기</option>
				<option value="reportFinished">처리완료</option>
			</select>
			
			<table id="bbsList_list" class="table" style="text-align: center;">
				<tr>
					<th class="cate">신고상태</th>
					<th class="num">신고유형</th>
					<th class="subject">게시물제목/산책일</th>
					<th class="name">신고처리</th>
					<th class="created">작성일</th>
					<th class="hitCount"></th>
				</tr>
				<tr>
					<td class="cate">처리완료</td>
					<td class="num">게시판</td>
					<td class="subject">진수새끼 존나 나대네</td>
					<td class="name" style="color:red;">신고확정</td>
					<td class="created">2021-06-26</td>
					<td class="hitCount"><button type="button" value="자세히">자세히</button></td>
				</tr>
				<tr>
					<td class="cate" style="color:yellow;">처리대기</td>
					<td class="num">산책메이트:온라인</td>
					<td class="subject">진수123님 이상한 말 그만해요</td>
					<td class="name" style="color:red;">-</td>
					<td class="created">2021-06-28</td>
					<td class="hitCount"><button type="button" value="자세히">자세히</button></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>
