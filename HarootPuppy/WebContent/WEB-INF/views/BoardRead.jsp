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
<title>BoardRead.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/list.css">
<!-- 부트스트랩 css -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 제이쿼리 script -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<!-- 부트스트랩 script -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- 부트스트랩 테마 css -->
<script src="<%=cp %>/js/bootstrap.min.js"></script>
<style type="text/css">
.submitbtn
{
	width: 60px;
	height: 60px;
	margin-left:10px;
	font-weight: bold;
}
body
 {
 	margin: 30px;
 }
</style>
</head>
<body>
<jsp:include page="Main.jsp" />
<div id="content" style="width: 85%; margin: auto;">
	<form>ß
		<div style="width: 85%; margin: auto;">
			<div>
				<h1>${view.board_title }</h1>
				<input type="hidden" name="board_code" value="${view.board_code }">
			</div>
			<div style="display: inline-block;">
				<div style="float: left; font-weight: bold;">${view.nickname }&nbsp;&nbsp;</div>
				<div style="display: inline-block;">${view.board_content_date }&nbsp;&nbsp;</div>
			</div>
			<div>
				<div style="float: left; font-weight: bold;">카테고리 &nbsp;&nbsp;</div>
				<div style="display: inline-block;">${view.board_cate_content}&nbsp;&nbsp;</div>
			</div>
			<div>
				<div style="float: left;">조회수 ${view.viewNum }&nbsp;&nbsp;</div>
				<div style="display: inline-block;">좋아요 ${view.likeNum }&nbsp;&nbsp;</div>
				<div style="display: inline-block; float: right;">
					<img alt="" src="images/like2.png" width="35" height="35" id="like">
					<img alt="" src="images/report2.png" width="35" height="35" id="report">
				</div>
			</div>
		</div>
		<br>
		<div style="width: 85%; margin: auto;">
			<textarea rows="20" class="form-control" disabled="disabled">${view.board_content }</textarea>
		</div><br>
		<div style="width: 85%; margin: auto;">
			<div>
				댓글
			</div>
			<div>
			<table>
			<c:forEach var="view" items="${commView }">
			<tr>
				<td>${view.board_comm_content }</td>
			</tr>
			</c:forEach>
			</table>
			</div>
		</div>
		<br>
		<div style="width: 85%; margin: auto;">
			<textarea rows="3" cols="125" placeholder="댓글을 입력해주세요."></textarea>
			<input type="button" value="등록" id="submitBtn" class="submitbtn">
		</div>
		<br>
		
		<div style="width: 85%; margin: auto;" class="bbsArticle_bottomLine" style="width: 80%;">
			<p><a href="">이전글 : ${view.board_title }</a></p>
			<hr>
		</div>
		<div style="width: 85%; margin: auto;" class="bbsArticle_noLine" style="width: 80%;">
			<p><a href="">다음글 : ${view.board_title }</a></p>
		</div>
		<div style="width: 85%; margin: auto; text-align: right;">
			<button type="button" id="updateBtn" class="btn btn-warning" onclick="location.href='boardupdateform.action?board_code=${view.board_code }&board_writer=${view.board_writer }'">수정</button>
			<button type="button" id="deleteBtn" class="btn btn-danger">삭제</button>
			<button type="button" id="listBtn" class="btn btn-success"  onclick="location.href='boardlist.action'">목록으로</button>
		</div>
	</form>
</div>

</body>
</html>