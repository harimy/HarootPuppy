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
<!-- 부트스트랩 css -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 제이쿼리 script -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<!-- 부트스트랩 script -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- 부트스트랩 테마 css -->
<script src="<%=cp %>/js/bootstrap.min.js"></script>
<script type="text/javascript">

	$(function ()
	{
		$("#list").css({"color":"red", "font-weight":"bold"});
	});
	

</script>
</head>
<body>
<jsp:include page="Main.jsp" />
<br><br><br><br>
<div id="bbsList">
   <div style="text-align : left; width: 300px; float:right;">
         <div id="gotohotboard">
         <h2>HOT 게시판 >> </h2>
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
               <option value="notice">공지</option>
               <option value="event">행사/할인정보</option>
               <option value="review">리뷰</option>
               <option value="talk">수다</option>
               <option value="used">중고장터</option>
            </select>
         </form>
       </div>
       <br>
   </div>
   <table id="bbsList_list" class="table" style="text-align: center; width: 100%;">
      <tr id="title">
         <th class="cate">카테고리</th>
         <th class="num">번호</th>
         <th class="subject">제목</th>
         <th class="name">작성자</th>
         <th class="created">작성일</th>
         <th class="hitCount">조회수</th>
         <th class="like">좋아요</th>
      </tr>
     <c:forEach var="list" items="${list }">
        <tr id="list">
           <td>${list.cate_content }</td>
           <td>${list.num }</td>
           <td>
			<a href="boardview.action?num=${list.num }">${list.title }</a>
		   </td>
           <td>${list.nickname }</td>
           <td>${list.content_date }</td>
           <td>${list.viewNum }</td>
           <td>${list.likeNum }</td>
    	</tr>
    </c:forEach>
   </table>
         
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
            onclick="javascript:location.href='boardinsertform.action'">         
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
   
<%-- <jsp:include page="MainFooter.jsp" /> --%>
</body>
</html>