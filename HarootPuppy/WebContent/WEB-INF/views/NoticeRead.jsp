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
<title>NoticeRead.jsp</title>

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

#adminNoticeRead
{
   margin: 10px auto;
   width: 900px; /* 800px 고정 */

}


#harootContent
{
   width: 863px;
   height: auto;
   resize: none;	
}

</style>

</head>
<body>

<!-----------------------------
  NoticeRead.jsp
  - 관리자 공지 글 하나 읽어보기
------------------------------->
<div>
	<!-- 메뉴영역 -->
	<div id="harootHeader">
		<c:import url="AdminMenu.jsp"></c:import>
	</div>

	<!-- content 영역 -->
	<div id="adminNoticeRead">
			<form>
				<div>
					<h1>리뷰에 관한 건</h1>
					<h4>관리자001</h4>
				</div>

				<div>
					<table>
						<tr>
							<td>21.07.03 13:34&nbsp;&nbsp;</td>
							<td>조회수 15&nbsp;&nbsp;</td>
							<td>좋아요 8&nbsp;&nbsp;</td>
							<td style="float: right;"><img alt=""
								src="images/like2.png" width="35" height="35" border="0"
								id="like"> <img alt="" src="images/report2.png"
								width="35" height="35" border="0" id="report"></td>
						</tr>
					</table>
				</div>

				<div>
					 <textarea rows="30" cols="120" 
					 readonly="readonly" style="resize: none;">내용 불러오기</textarea>
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
					<textarea rows="10" cols="120" 
					readonly="readonly" id="reply">댓글 내용 불러와야됨</textarea>
				</div>
				<br>
				<div>
					<textarea rows="3" cols="112" style="float: left; resize:none;">댓글을 입력해주세요.</textarea>
					<input type="button" value="등록" id="submitBtn" class="submitbtn">
				</div>
				<br><br><br>

				<div class="bbsArticle_bottomLine" style="width: 850px;">
					<p>
						<a href="">이전글 : </a>
					</p>
					<hr>
				</div>
				<div class="bbsArticle_noLine" style="width: 850px;">
					<p>
						<a href="">다음글 : </a>
					</p>
				</div>
				<div>
					<button type="button" id="updateBtn" class="listbtn">수정</button>
					<button type="button" id="deleteBtn" class="listbtn">삭제</button>
					<button type="button" id="listBtn" class="listbtn">목록으로</button>
				</div>
				<br><br>
				
			</form>
	</div>

	<!-- 하단 회사 설명 영역 -->
	<div id="harootFooter">
		<c:import url="MainFooter.jsp"></c:import>
	</div>
</div>


</body>
</html>