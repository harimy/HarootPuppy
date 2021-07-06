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
<title>AdminAskReadList.jsp</title>

<!-- jQuery JS -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-ui.js"></script>
<!-- jQuery-UI CSS -->
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/jquery-ui.css">

<!--  부트스트랩 JS -->
<script type="text/javascript" src="<%=cp%>/js/bootstrap.js"></script>
<!-- 부트스트랩 CSS -->
<link rel="stylesheet" href="<%=cp%>/css/bootstrap.css">

<style type="text/css">

#AdminAskRead
{
	margin: 10px auto;
	width: 900px; /* 900px 고정 */

}

#reply
{
	width: 863px;
	height: auto;
	resize: none;
}

</style>

</head>
<body>

<!-----------------------------
  Sample.jsp
  - 페이지 설명
------------------------------->
	<div>
		<!-- 메뉴영역 -->
		<div id="harootHeader">
			<c:import url="AdminMain.jsp"></c:import>
		</div>

		<!-- content 영역 -->
		<div id="AdminAskRead">
			<form>
				<div>
					<h1>강아지 정보를 수정하고싶으면 어떻게 하죠?</h1>
					<h4>뚜냐사랑</h4>
				</div>

				<div>
					<table>
						<tr>
							<td>21.06.26 13:34&nbsp;&nbsp;</td>
							<td>조회수 45&nbsp;&nbsp;</td>
						</tr>
					</table>
				</div>

				<div>
					<textarea rows="30" cols="120" readonly="readonly" style="resize: none;">내용 불러오기</textarea>
				</div>
				<br>

				<div>
					<table>
						<tr>
							<th>댓글</th>
						</tr>
					</table>
				</div>
				<div>
					<textarea rows="10" cols="120" readonly="readonly" id="reply">댓글 내용 불러와야됨</textarea>
					<button type="button" id="updateBtn" class="listbtn">수정</button>
					<button type="button" id="deleteBtn" class="listbtn">삭제</button>
				</div>
				<br>
				<div>
					<textarea rows="3" cols="112" style="float: left; resize:none;">댓글을 입력해주세요.</textarea>
					<input type="button" value="등록" id="submitBtn" class="submitbtn">
				</div>

				<div class="bbsArticle_bottomLine" style="width: 700px;">
					<br>
					<p>
						<a href="">이전글 : </a>
					</p>
					<hr>
				</div>
				<div class="bbsArticle_noLine" style="width: 700px;">
					<p>
						<a href="">다음글 : </a>
					</p>
				</div>
				<div>
					<button type="button" id="updateBtn" class="listbtn">수정</button>
					<button type="button" id="deleteBtn" class="listbtn">삭제</button>
					<button type="button" id="listBtn" class="listbtn"
					onclick="location.href='AdminAskList.jsp'">목록으로</button>
				</div>
			</form>
		</div>
		
		
	</div>

	<!-- 하단 회사 설명 영역 -->
	<div id="harootFooter">
		<c:import url="MainFooter.jsp"></c:import>
	</div>


</body>

</html>