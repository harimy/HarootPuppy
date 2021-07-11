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
<title>ReportedBoardRead.jsp</title>
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
<div style="text-align: center;">
<form>
	<div>
		<h5>카테고리</h5>
		<h1>글제목</h1>
		<h4>작성자</h4>
	</div>
	<div style="display: inline-block;">
			<div style="float: left">2021.12.11&nbsp;&nbsp;</div>
			<%-- 
			<div style="display: inline-block;">조회수 ${viewnum }&nbsp;&nbsp;</div>
			<div style="display: inline-block;">좋아요 ${likenum }&nbsp;&nbsp;</div>
			 --%>
	</div>
	
	<div>
		<textarea rows="30" cols="120" readonly="readonly" style="padding: 30px;">
			글내용
		</textarea>
	</div><br>
	
	<!-- 
	<div style="display: inline-block;">
		<textarea rows="3" cols="112" style="float: left; width: 807px;">댓글을 입력해주세요.</textarea>
		<input type="button" value="등록" id="submitBtn" class="submitbtn">
	</div>
	 -->
	<br>
	
	<div class="bbsArticle_bottomLine" style="width: 80%;">
		<p><a href="">이전글 : </a></p>
		<hr>
	</div>
	<div class="bbsArticle_noLine" style="width: 80%;">
		<p><a href="">다음글 : </a></p>
	</div>
	<div>
		<button type="button" id="updateBtn" class="listbtn">수정</button>
		<button type="button" id="deleteBtn" class="listbtn">삭제</button>
		<button type="button" id="listBtn" class="listbtn">목록으로</button>
	</div>
</form>
</div>

</body>
</html>