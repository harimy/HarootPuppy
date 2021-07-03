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
<title>WalkScheduled.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/list.css">
<style type="text/css">
	
	.table th, .lists td, .listTd
	{
		text-align: center;
	}
	
	.table td
	{
		vertical-align: middle;
	}
	
</style>

</head>
<body>
	<div id="bbsList">
		<table id="bbsList_list" class="table" style="width: 100%;">
			<tr id="title">
				<th>글번호</th>
				<th colspan="2">소개</th>
				<th>산책인원</th>
				<th>반려견</th>
				<th>산책 일시</th>
				<th>개설자</th>
			</tr>
			<tr id="lists">
				<td class="listTd">1</td>
				<td class="listTd">
				<img style="border-radius: 100px;" src="images/jaerong.jpg" width=80 height=80></img>
				</td>
				<td>
				<p>[ 저녁 산책하GO, 건강챙기GO! ]<br>
				산책장소: 안양천<br>
				원하는 산책메이트 특징<br>
				- 대형견, 중형견<br>
				- 동일성별 양육자
				</p>
				</td>
				<td class="listTd">
				<p>(3/4)<br>
				최소 3명
				</p>
				</td>
				<td class="listTd">재롱이</td>
				<td class="listTd">
				<p>2021년 6월 13일<br>
				(18:30 ~ 21:00)
				</p>
				</td>
				<td class="listTd">뚜또맘</td>
			</tr>
			<tr id="lists">
				<td class="listTd">4</td>
				<td class="listTd">
				<img style="border-radius: 100px;" src="images/puppy1.png" width=80 height=80></img>
				</td>
				<td>
				<p>[ 오늘 저녁 번개산책 한판ㅋ ]<br>
				산책장소: 철산한신아파트 106동 놀이터<br>
				원하는 산책메이트 특징<br>
				- 소형견<br>
				- 동일성별 양육자<br>
				- 입질 반려견 금지
				</p>
				</td>
				<td class="listTd">
				<p>(4/4)<br>
				최소 2명
				</p>
				</td>
				<td class="listTd">코코</td>
				<td class="listTd">
				<p>2021년 7월 1일<br>
				(19:00 ~ 20:00)
				</p>
				</td>
				<td class="listTd">제갈코코</td>
			</tr>
		</table>

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


		<br>
		<div id="bbsList_header">
			<br>
			<div id="leftHeader">
				<form action="" name="searchForm" method="post">
					<select name="searchKey" class="selectField">
						<option value="subject">제목</option>
						<option value="name">작성자</option>
					</select> <input type="text" name="searchValue" class="textField"> <input
						type="button" value="검색" class="btn2" onclick="sendIt()">
				</form>
			</div>
			<!-- #leftHeader -->

		</div>
		<!-- #bbsList_header -->
		<br>
		<br>
		<div id="footer_number" style="text-align: center;">
			<p>1 Prev 21 22 23 24 25 26 27 28 29 30 Next 63</p>

			<!-- 나중에 동적처리할 때 참고용 코드 -->
			<%--    <p>
         <%
         if(dataCount != 0)
         {
         %>
         	<%=pageIndexList %>
         <%
         }
         else
         {
         %>
         	등록된 게시물이 존재하지 않습니다.
         <%
         }
         %>
         </p> --%>

		</div>

	</div>
	<!-- #bbsList_list -->


</body>
</html>