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
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/list.css">

</head>
<body>

<div id="bbsList">
	<div style="text-align : left; width: 300px; float:right;">
      	<div id="gotohotboard">
			<h1>HOT 게시판 >> </h1>
			<hr>
		</div>
		<div>
			강아지 우비 입혀본 후기<br>
			강아지 우비 입혀본 후기<br>
			강아지 우비 입혀본 후기<br>
		</div>
	</div>
	 <br><br><br><br><br><br><br><br><br><br>
	 <div>
	   <div style="text-align: center;">
	   	<h1>전체게시판</h1>
	   </div>
	   <br>
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
	    </div>
	    <br>
   </div>
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
	            </select>
	            <input type="text" name="searchValue" class="textField">
	            <input type="button" value="검색" class="btn2" onclick="sendIt()"> 
	         </form>
	      </div><!-- #leftHeader -->
      
	      <div id="rightHeader">
	         <input type="button" value="글쓰기" class="btn2"
	         onclick="javascript:location.href='<%=cp%>/Created.jsp'">         
	      </div>
      
   </div><!-- #bbsList_header -->
      <br><br>
      <div id="footer_number" style="text-align: center;">
         <p>1 Prev 21 22 23 24 25 26 27 28 29 30 Next 63</p>
         
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
      
   </div><!-- #bbsList_list -->
   

</body>
</html>