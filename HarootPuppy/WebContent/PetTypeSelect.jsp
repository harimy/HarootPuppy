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
<title>반려견 종류 검색</title>
<link rel="stylesheet" href="<%=cp%>/css/main.css">
<style type="text/css">

	#search
	{
		width: 500px;
	}
	#list
	{
		border: 1px solid gray;
		width: 500px;
		
		position: absolute;
		left: 70px;
		top: 134px;
		
		display: none;
	}
	#list.item
	{
		padding: 3px;
	}
	#list #footer
	{
		background-color: #DDD;
		text-align: right;
		padding: 5px;
		font-size: small;
	}
</style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="<%=cp%>/js/ajax.js"></script>
<script type="text/javascript">
$(function () {	//화면 로딩후 시작
	$("#searchInput").autocomplete({  //오토 컴플릿트 시작
		source: List,	// source는 data.js파일 내부의 List 배열
		focus : function(event, ui) { // 방향키로 자동완성단어 선택 가능하게 만들어줌	
			return false;
		},
		minLength: 1,// 최소 글자수
		delay: 100,	//autocomplete 딜레이 시간(ms)
		//disabled: true, //자동완성 기능 끄기
	});
}
</script>
</head>
<body>
	<h3>반려견 종류 검색하기</h3>
	<div>
		검색 <input id="searchInput" style="margin-left: 20px; width: 400px;">
	</div>
</body>
</html>