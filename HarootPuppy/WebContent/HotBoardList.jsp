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
<title>HotBoardList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">


<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-ui.js"></script>

<link rel="stylesheet" type="text/css" href="<%=cp%>/css/HarootMain.css">
</head>
<body>

	<div class="tab">
		
		<div class="tabContent">
			<div id="tab01">
				<div id="bbsList">
					<div id="bbsList_title" style="text-align: center;">
						<h1>HOT 게시판</h1>
					</div>
					<div>
					      <form action="" name="categoryForm" method="post">
					         <select name="categoryKey" class="selectField">
					            <option value="notic">공지</option>
					            <option value="event">행사/할인정보</option>
					            <option value="review">리뷰</option>
					            <option value="talk">수다</option>
					            <option value="used">중고장터</option>
					         </select>
					      </form>
					</div><br>
					<table id="bbsList_list" class="table" style="text-align: center;">
						<tr id="title">
							<th class="cate">카테고리</th>
							<th class="num">번호</th>
							<th class="subject">제목</th>
							<th class="name">작성자</th>
							<th class="created">작성일</th>
							<th class="hitCount">조회수</th>
							<th class="like">좋아요</th>
						</tr>
						<tr id="lists"> 
							<td class="cate">리뷰</td>
							<td class="num">리뷰</td>
							<td class="subject">리뷰</td>
							<td class="name">리뷰</td>
							<td class="created">리뷰</td>
							<td class="hitCount">리뷰</td> 
							<td class="like">리뷰</td>						
						</tr>
					</table>
					
					<div id="footer_number" style="text-align: center;">
						<p>1 Prev 21 22 23 24 25 26 27 28 29 30 Next 63</p>
					</div>

				</div>
			</div>
		</div>

	</div>
	</div>
	<!— 회사 소개 및 어플리케이션 소개 영역 —>
	<div id="footer"></div>
	<!—tab—>

</body>
</html>