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


</head>
<body>

<!-----------------------------------
  NoticeRead.jsp
  - 관리자가 공지 한 개 자세히 읽기
------------------------------------->
<div>
	<!-- 메뉴영역 -->
	<div id="harootHeader">
		<c:import url="AdminMain.jsp"></c:import>
	</div>

	<!-- content 영역 -->
	<div id="harootContent">
	
		<!-- 관리자 공지 게시글 쓰기 title -->
		<div class="from-group titleNotice">
			<h1 style="font-weight: bold; text-align: center">
			공지 관리</h1>
		</div>
		<br>
		
		<!-- 글쓰기 폼 -->
			<div class="form-group writeNotice">
				<div>
					<form>
						<table>
							<tr>
								<td>제목</td>
								<td><input type="text" id="name"></td>
							</tr>
							<tr>
								<td>카테고리 선택</td>
								<td><select id="selectcate">
										<option value="1" selected="selected">안내</option>
										<option value="2">필독</option>
										<option value="3">공지</option>
								</select></td>
							</tr>
							<tr>
								<td>첨부파일</td>
								<td><input type="file" name="upload" multiple></td>
							</tr>
						</table>
						<br>
						<textarea style="width: 100%;" rows=20 placeholder="내용을 입력하세요"></textarea>
						<br>
					</form>
				</div>

				<div style="width: 100%; text-align: right;">
					<button type="button" id="cancel" class="btn">취소</button>
					<button type="submit" id="register" class="btn">글 등록</button>
				</div>
			</div><!-- end writeNotice -->

		</div><!-- end harootContent -->

	<!-- 하단 회사 설명 영역 -->
	<div id="harootFooter">
		<c:import url="MainFooter.jsp"></c:import>
	</div>
</div>


</body>
</html>