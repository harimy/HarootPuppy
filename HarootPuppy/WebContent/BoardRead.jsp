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
<style type="text/css">
.submitbtn
{
	width: 50px;
	height: 50px;
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
<div>
<form>
	<div>
		<h1>강아지 우비 입혀본 후기</h1>
		<h4>내가니별이다</h4>
	</div>
	
	<div>
	<table>
		<tr>
			<td>21.06.26 13:34&nbsp;&nbsp;</td>
			<td>조회수 45&nbsp;&nbsp;</td>
			<td>좋아요 35&nbsp;&nbsp;</td>
			<td style="float: right;">
				<img alt="" src="images/like2.png" width="35" height="35" border="0" id="like">
				<img alt="" src="images/report2.png" width="35" height="35" border="0" id="report">
			</td>
		</tr>
	</table>
	</div>
	
	<div>
		<textarea rows="30" cols="120" readonly="readonly">내용 불러오기</textarea>
	</div><br>
	
	<div>
		<table>
			<tr>
				<th>댓글</th>
			</tr>
		</table>
	</div>
	<div>
		<textarea rows="10" cols="120" readonly="readonly">댓글 내용 불러와야됨</textarea>
	</div>
	<br>
	<div>
		<textarea rows="3" cols="112" style="float: left;">댓글을 입력해주세요.</textarea>
		<input type="button" value="등록" id="submitBtn" class="submitbtn">
	</div>
	
	<div class="bbsArticle_bottomLine" style="width: 850px;">
		<p><a href="">이전글 : </a></p>
		<hr>
	</div>
	<div class="bbsArticle_noLine" style="width: 850px;">
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