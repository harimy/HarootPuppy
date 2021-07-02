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
<title>BoardList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/list.css">
</head>
<body>
<jsp:include page="Main.jsp" />
	<div id="bbsList">

		<div id="bbsList_title" style="text-align: center;">내 게시글 보기</div>

		<div>
			<div style="text-align: right;">
				<div>
					강아지 우비 입혀본 후기<br> 강아지 우비 입혀본 후기<br> 강아지 우비 입혀본 후기<br>
				</div>
			</div>
			<div>
				<form action="" name="categoryForm" method="post">
					<select name="categoryKey" class="selectField">
						<option value="board">게시글</option>
						<option value="reply">댓글</option>
					</select>
				</form>
			</div>
			<br>
		</div>

		<div id="bbsList_list">
			<div id="title">
				<dl>
					<dt class="cate">카테고리</dt>
					<dt class="num">번호</dt>
					<dt class="subject">제목</dt>
					<dt class="name">작성자</dt>
					<dt class="created">작성일</dt>
					<dt class="hitCount">조회수</dt>
					<dt class="like">좋아요</dt>
				</dl>
			</div>
			<!-- #title -->

			<div id="lists">
				<dl>
					<dd class="cate">리뷰</dd>
					<dd class="num">1</dd>
					<dd class="subject">안녕하세요</dd>
					<dd class="name">사공혜연</dd>
					<dd class="created">2021-06-21</dd>
					<dd class="hitCount">0</dd>
					<dd class="like">45</dd>
				</dl>

				<%-- <%
         for (BoardDTO dto : lists)
         {
         %>
         <dl>
         	<dd class="num"><%=dto.getNum() %></dd>
            <dd class="subject">
            	<a href="<%=articleUrl %>&num=<%=dto.getNum() %>">		<!-- 825번 게시물 선택했을 때 링크 : Article.jsp?pageNum=1&num=825 -->
            	<%=dto.getSubject() %>
            	</a>
            </dd>
            <dd class="name"><%=dto.getName() %></dd>
            <dd class="created"><%=dto.getCreated() %></dd>
            <dd class="hitCount"><%=dto.getHitCount() %></dd>
         </dl>
         <%
         }
         %> --%>

			</div>

			<div id="bbsList_header">
				<br>
				<div id="leftHeader">
					<form action="" name="searchForm" method="post">
						<select name="searchKey" class="selectField">
							<option value="subject">제목</option>
							<option value="name">작성자</option>
						</select> <input type="text" name="searchValue" class="textField">
						<input type="button" value="검색" class="btn2" onclick="sendIt()">
					</form>
				</div>
				<!-- #leftHeader -->

				<div id="rightHeader">
					<input type="button" value="글쓰기" class="btn2"
						onclick="javascript:location.href='<%=cp%>/Created.jsp'">
				</div>

			</div>

			<div id="footer">
				<p>1 Prev 21 22 23 24 25 26 27 28 29 30 Next 63</p>
			</div>

		</div>
	</div>
</body>
</html>