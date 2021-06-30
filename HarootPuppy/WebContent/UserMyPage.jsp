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
<title>UserMyPage.jsp</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javaScript">
	$(function()
	{
		$('.tabContent > div').hide();
		$('.tabNav a').click(function()
		{
			$('.tabContent > div').hide().filter(this.hash).fadeIn();
			$('.tabNav a').removeClass('active');
			$(this).addClass('active');
			return false;
		}).filter(':eq(0)').click();
	});

	$(document).ready(function(){
	    $("#tab01").load("UserMyPageBoard.jsp");
	    $("#tab02").load("UserMyPageBlock.jsp");
	    $("#tab03").load("UserMyPageReported.jsp");
	    // $("#tab04").load("내정보수.jsp"); 
	    $("#tab05").load("UserMyPageOut.jsp");
	});


	/* 	.hide() : 선택한 요소 즉시 사라지게 한다.
	 .filter() : find()와 비슷. find()가 전체에서 검색을 하고
	 filter()  자기 자신 레벨에서 검색한다. 
	 this.hash는 href의 this 속성을 ​​읽고 #로 시작하는 URL 부분을 가져옵니다.
	
	 :eq(index)
	 인자로전달된 index에 해당하는 요소를 가져온다. ( first index : 0 )
	
	 this : 내가 선택한 무언가..
	
	 removeClass~ 일단 전체 다 active 제거하고 내가 선택한 애(this)한테
	 addClass 하고 return 을 반환...
	 그리고 다시 맨처음 탭이 선택되게 하도록..!
	 */
</script>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/MyPageTab.css">
</head>
<body>
	<div class="nameArea">
		<img src="images/user.jpg" width=200px /> <br> 이름(닉네임)<br>
		아이디@test.com<br>
	</div>
	<div class="tab">
		<div class="tabNav">
			<ul>
				<li><a href="#tab01">내 게시글/댓글</a></li>
				<li><a href="#tab02">차단 회원 관리</a></li>
				<li><a href="#tab03">나의 신고 관리</a></li>
				<li><a href="#tab04">내 정보 수정</a></li>
				<li><a href="#tab05">회원 탈퇴</a></li>
			</ul>
		</div>
		<div class="tabContent">
			<div id="tab01"></div>
			<div id="tab02"></div>
			<div id="tab03"></div>
			<div id="tab04"></div>
			<div id="tab05"></div>
	</div>
	</div>
	<!-- 회사 소개 및 어플리케이션 소개 영역 -->
	<div id="footer"></div>
	<!--tab-->

</body>
</html>