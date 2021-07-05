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
<link rel="stylesheet" href="<%=cp%>/css/bootstrap.css">
<style type="text/css">
	a.link { text-decoration: none; color: black; }
    a.link:visited { text-decoration: none; }
    a.link:hover { text-decoration: none; }
    a.link:focus { text-decoration: none; }
    a.link:hover, a:active { text-decoration: none; }
</style>
</head>
<body>

<div>

<!-- 메뉴영역 -->
<div id="harootHeader">
	<c:import url="AdminMain.jsp"></c:import>
</div>

<br><br><br><br>

<div style="text-align: center;">
	<h1>신고 관리</h1>
	<hr>
</div>

<div>
	<table style="width: 100%;">
		<tr>
			<th>
				<h3>게시판 신고</h3>
			</th>
			<th>
				<h3>산책메이트 온라인 신고</h3>
			</th>
			<th>
				<h3>산책메이트 오프라인 신고</h3>
			</th>
		</tr>
		<tr>
			<td style="background-color: rgb(239,239,239);">
				<ul>
					<li><a href="ReportedBoardTab.jsp" class="link">미처리 게시물 50건</a></li><br>
					<li><a href="ReportedReplyTab.jsp" class="link">미처리 댓글 50건</a></li>
				</ul>
			</td>
			<td style="background-color: rgb(208,208,208);">
				<ul>
					<li>미처리 게시물 50건</li><br>
					<li>미처리 댓글 50건</li>
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

<!-- 하단 회사 설명 영역 -->
<div id="harootFooter">
	<c:import url="MainFooter.jsp"></c:import>
</div>

</div>
	
</body>
</html>