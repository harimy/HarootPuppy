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
<title>AdminAskList.jsp</title>

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

	/* 가운데 정렬 */
	#userTable th, td
	{
		text-align: center !important;
	}
	
	#askList
	{
		height: 700px;
	}

	
	
</style>


</head>
<body>

<!-----------------------------
  AdminAskList.jsp
  - 관리자가 보는 1:1 고객문의 게시판
------------------------------->
	<div>
		<!-- 메뉴영역 -->
		<div id="harootHeader">
			<c:import url="AdminMain.jsp"></c:import>
		</div>

		<!-- content 영역 -->
		<div id="askList">
		<div style="width: 100%; text-align: center;">
			<h1>1:1 문의 게시판</h1>
		</div>
		
		<br><br>
		
		<div>
			<select name="askTag" id="askTag">
				<option>산책메이트</option>
				<option>다이어리</option>
				<option>게시판</option>
				<option>계정</option>
				<option>기타</option>
			</select>
			<p style="float: right;">문의글 수 : 30</p>
		</div>
		
		<br><br>
		
		<div>
			<table class="table table-striped table-condensed table-hover" id="userTable" style="text-align: center;"> 
				<tr>
					<th>카테고리</th>
					<th>글제목</th>
					<th>닉네임</th>
					<th>작성일자</th>
					<th>읽음상태</th>
					<th>답변상태</th>
				</tr>	
				<tr>
					<td>다이어리</td>
					<td><a href="AdminAskReadList.jsp">강아지 정보를 수정하고싶으면 어떻게 하죠?</a></td>
					<td>뚜냐사랑</td>
					<td>2021-07-03</td>
					<td>안읽음</td>
					<td>답변대기</td>
				</tr>	
				<tr>
					<td>산책</td>
					<td>산책점수를 높이러면 어떻게 해야 하나요?</td>
					<td>콩이엄마</td>
					<td>2021-07-02</td>
					<td>읽음</td>
					<td>답변대기</td>
				</tr>	
			</table>
		</div>
	</div>

		<!-- 하단 회사 설명 영역 -->
		<div id="harootFooter">
			<c:import url="MainFooter.jsp"></c:import>
		</div>
	</div>


</body>

</html>