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
<title>AskRead.jsp</title>
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
		/* margin: 30px; */
	}


</style>

</head>
<body>

<!-- 메뉴영역 -->
<div id="harootHeader">
	<c:import url="Main.jsp"></c:import>
</div>

<div id="content" style="width: 85%; margin: auto;">
	<form >
	<input type="hidden" id="ask_code" name="ask_code" value="${read.ask_code }">
	<div style="width: 85%; margin: auto;">
		<div>
			<h1>${read.ask_title }</h1>
		</div>
		<div style="display: inline-block;">
			<div style="float: left; font-weight: bold;">${read.mem_nickname }&nbsp;&nbsp;</div>
			<div style="display: inline-block;">${read.ask_date }&nbsp;&nbsp;</div>
			<div style="display: inline-block; color: green;">${read.ask_state_content }&nbsp;&nbsp;</div>
		</div>
		<br>
		<div>
			<div style="float: left; font-weight: bold;">카테고리 &nbsp;&nbsp;</div>
			<div style="display: inline-block;">${read.ask_cate_content}</div>
		</div>
		<div>
			<div style="float: left; font-weight: bold;">첨부파일 &nbsp;&nbsp;</div>
			<div style="display: inline-block;">${read.ask_photo}</div>
		</div>
	</div>
		<br>
		<div style="width: 85%; margin: auto;">
		<textarea rows=20 class="form-control" id="ask_content" name="ask_content" disabled="disabled">${read.ask_content }</textarea>
		</div><br>
		
		<div style="width: 85%; margin: auto; text-align: right;">
			<button type="button" class="btn btn-warning" value="" onclick="location.href='askupdateform.action?ask_code=${read.ask_code }'">수정</button>
			<button type="button" class="btn btn-danger" value="" onclick="location.href='askdelete.action?ask_code=${read.ask_code }'">삭제</button>
			<button type="button" class="btn btn-success" value="" onclick="location.href='asklist.action'">목록으로</button>
		</div>
	</form>
</div>

<br><br><br>
<!-- 하단 회사 설명 영역 -->
<div id="harootFooter">
	<c:import url="MainFooter.jsp"></c:import>
</div>

</body>
</html>