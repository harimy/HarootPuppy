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
<title>AdminAskRead.jsp</title>

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

#AdminAskReadDiv
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

	<div>
		<!-- 메뉴영역 -->
		<div id="harootHeader">
			<c:import url="AdminMenu.jsp"></c:import>
		</div>
		
		<br /><br />
		
		
		<!-- content 영역 -->
		<div id="AdminAskReadDiv">
			<div style="width: 100%; text-align: center;">
				<h1>1:1 문의 게시판</h1>
			</div>
			
			<br><br>
			<div>
			
				<table style="width: 100%;">
				 	<tr>
				 		<th style="width: 20%;" class="noticeTh">글제목</th>
				 		<th style="width: 80%;" class="noticeTh">${askView.ask_title}</th>
				 	</tr>
				 	<tr>
				 		<th class="noticeTh">작성자</th>
				 		<th class="noticeTh">${askView.mem_nickname }</th>
				 	</tr>
				 	<tr>
				 		<th class="noticeTh">작성일자</th>
				 		<th class="noticeTh">${askView.ask_date }</th>
				 	</tr>
				 	
				 	<tr>
				 		
			 			<!-- 
			 			<textarea rows="30" cols="120" readonly="readonly" style="resize: none;">
			 			${askView.ask_content }
			 			</textarea>
			 			 -->
			 			
			 			
						<td colspan="2" style="padding: 30px 10px 10px 10px; vertical-align: top; height:600px;">
						${askView.ask_content }
						</td>
						
				 			 
				 			 
				 		
				 	</tr>
				 	
				</table>
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

				
				 
				<br><br><br>
				<div class="bbsArticle_bottomLine">
					<p><a href="">이전글 : 이전글입니다. </a></p>
					<hr>
				</div>
				<div class="bbsArticle_noLine">
					<p><a href="">다음글 : 다음글입니다. </a></p>
				</div>
				<br><br>
				
				
				
				<div>
					<button type="button" id="updateBtn" class="listbtn">수정</button>
					<button type="button" id="deleteBtn" class="listbtn">삭제</button>
					<button type="button" id="listBtn" class="listbtn">목록으로</button>
				</div>
			
		</div>
		
		
	</div>



</body>

</html>