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
	 	font-size: 20pt;
	 	float: center;
	 }
	 
	table {
    width: 80% !important; 
    margin: auto;
    height: 100px !important;
	}
	
	table, td, th {
	    font-size: 13pt;
	};
	
	.td
	{
		text-align: right !important;
	}


</style>
<script type="text/javascript">
	
	$(document).ready(function() {
		$("span:contains('답변완료')").css({color:"orange"});
	});


</script>
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
<div style="margin: 100px;">
	<div style="width: 80%; margin: auto;">
	<div style="float: left;">
	  <form action="" name="categoryForm" method="post">
	    카테고리 선택&nbsp; <select name="categoryKey" class="selectField">
	        <option value="1">산책</option>
	        <option value="2">다이어리</option>
	        <option value="3">게시판</option>
	        <option value="4">계정</option>
	        <option value="5">기타</option>
	     </select>                          
	  </form>
	  </div>
	  <div style="float: right;">
	  <span>총 게시글 : ${count }</span>
	  </div>
	</div>
	<br><br><br>
	<div>
		<table class="table table-striped table-condensed table-hover" id="userTable" style="text-align: center;">
		<c:forEach var="ask" items="${askList }">
		<tr>
			<th><a href="askread.action?ask_code=${ask.ask_code }">Q.&nbsp;${ask.ask_title }</a></th>
			<td id="state" style="text-align: right;">
				<a href="askcomplete.action"><span>${ask.ask_state_content }</span></a>
			</td>
		</tr>
		</c:forEach>
		</table>
	</div>
	<br><br>
	<div style="width: 80%; margin: auto; text-align: right;">
		<button class="btn btn-primary btn-sm" type="button" id="insertAsk" onclick="location.href='askinsertform.action'">글 등록</button>
	</div>
</div>

<br><br><br>
<!-- 하단 회사 설명 영역 -->
<div id="harootFooter">
	<c:import url="MainFooter.jsp"></c:import>
</div>

</body>
</html>