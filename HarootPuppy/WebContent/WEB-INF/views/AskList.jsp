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
<title>AskList.jsp</title>

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
	 body
	 {
	 	/* margin: 30px;  */
	 }

	 .askList
	 {
	 	font-size: 25pt;
	 	float: center;
	 }

</style>
</head>
<body>

<!-- 메뉴영역 -->
<div id="harootHeader">
	<c:import url="Main.jsp"></c:import>
</div>


<div style="text-align: center;">
	<h1>1:1 문의</h1>
	<hr>
</div>
<br>
<div style="margin: 100px;">
	<div>
	  <form action="" name="categoryForm" method="post">
	     <select name="categoryKey" class="selectField">
	        <option value="walk">산책</option>
	        <option value="diary">다이어리</option>
	        <option value="board">게시판</option>
	        <option value="account">계정</option>
	        <option value="etc">기타</option>
	     </select>
	  </form>
	</div>
	<br><br>
	<div>
		<table>
		<c:forEach var="ask" items="${askList }">
		<tr>
			<th style="border-bottom: 1px solid gray;"><a href="">Q.&nbsp;${ask.ask_title }</a></th>
			<td style="border-bottom: 1px solid gray; text-align: right;"><a href="">${ask.ask_state_content }</a></td>
		</tr>
		</c:forEach>
		</table>
	</div>
	
	<div style="width:100%; text-align: right;">
		<button type="button" id="insertAsk">글 등록</button>
	</div>
</div>

<br><br><br>
<!-- 하단 회사 설명 영역 -->
<div id="harootFooter">
	<c:import url="MainFooter.jsp"></c:import>
</div>

</body>
</html>