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
<title>AdminMenu.jsp</title>
<style type="text/css">
body
{
	margin: 10px;
}
</style>
</head>
<body>

<div style="text-align: center;">
	<h1>관리자 페이지</h1>
	<hr>
</div>

<div>
	<table style="width: 100%;">
		<tr>
			<th>
				<h3>게시판 신고</h3>
			</th>
			<th>
				<h3>산책메이트 신고</h3>
			</th>
			<th>
				<h3>고객 지원</h3>
			</th>
		</tr>
		<tr>
			<td style="background-color: rgb(239,239,239);">
				<ul>
					<li>미처리 게시물 50건</li>
					<li>미처리 댓글 50건</li>
				</ul>
			</td>
			<td style="background-color: rgb(208,208,208);">
				<h4>&nbsp;&nbsp;&nbsp;온라인 신고</h4>
				<ul>
					<li>미처리 게시물 50건</li>
					<li>미처리 댓글 50건</li>
				</ul>
				<h4>&nbsp;&nbsp;&nbsp;오프라인 신고</h4>
				<ul>
					<li>미처리 무단결석 의견 50건</li>
				</ul>
			</td>
			<td style="background-color: rgb(239,239,239);">
				<ul>
					<li>미처리 문의 50건</li>
				</ul>
			</td>
		</tr>
	</table>
</div>
<br><br><br><br>
<div>
	<table style="width: 100%;">
		<tr>
			<th>
				>> 신고 게시물 바로가기
				&nbsp;&nbsp;&nbsp;&nbsp;NEW 3!
			</th>
			<th>>> 신고된 방 바로가기&nbsp;&nbsp;&nbsp;&nbsp;NEW 3!</th>
			<th>>> 고객 지원 바로가기&nbsp;&nbsp;&nbsp;&nbsp;NEW 3!</th>
		</tr>
		<tr>
			<td style="background-color: rgb(208,208,208);">안보면 후회 지금 클릭해보세요</td>
			<td style="background-color: rgb(239,239,239);">안보면 후회 지금 클릭해보세요</td>
			<td style="background-color: rgb(208,208,208);">안보면 후회 지금 클릭해보세요</td>
		</tr>
	</table>
</div>

<br><br><br><br>

</body>
</html>