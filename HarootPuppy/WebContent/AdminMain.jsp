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
<title>Insert title here</title>
<script type="text/javascript"
   src="http://code.jquery.com/jquery.min.js"></script>
<style>
    ul, ol, li { list-style:none; margin:0; padding:0; width: 100%}
   
    ul.myMenu {text-align: center;}
    ul.myMenu > li { display:inline-block; width:25%; padding:5px 10px; background:rgb(244,188,23); border:1px solid #eee; text-align:center; position:relative; }
    ul.myMenu > li:hover { background:#fff; }
    ul.myMenu > li ul.submenu { display:none; position:absolute; top:30px; left:0; }
    ul.myMenu > li:hover ul.submenu { display:block; }
    ul.myMenu > li ul.submenu > li { display:inline-block; width:200px; padding:5px 10px; background:#eee; border:1px solid #eee; text-align:center; }
    ul.myMenu > li ul.submenu > li:hover { background:#fff; }
    
    a.container:link, a.container:visited
	{
		display: block;
		font-weight: bold;
		color: #ffffff;
		background-color: rgb(244,188,23);
		text-align: center;
		padding: 4px;
		text-decoration: none;
		text-transform: uppercase;
		height: 30px;
		font-size: 14pt;
	}

	a.container:hover, a.container:active
	{
		background-color: rgb(244,188,23);
		color: #000000;
		border: 2px solid #000000;
		border-radius: 5px;
		height: 26px;
	}
</style>

</head>
<body>


<div id="container">
<ul class="myMenu">
	<li class="menu1">
        회원관리
        <ul class="menu1_s submenu">
            <li>전체회원 정보 조회</li>
            <li>탈퇴회원 정보 조회</li>
            <li>관리자 정보 조회</li>
        </ul>   
    </li>
    <li class="menu2">
    	게시물 관리
    	<ul class="menu2_s submenu">
            <li>게시판 공지 작성</li>
        </ul> 	
    </li>
    <li class="menu3">
        신고 관리
        <ul class="menu3_s submenu">
            <li>게시판 신고</li>
            <li>산책메이트 온라인 신고</li>
            <li>산책메이트 오프라인 신고</li>
        </ul>   
    </li>
    <li class="menu4">
    	고객지원
    	<ul class="menu4_s submenu">
            <li>고객문의 게시판</li>
        </ul> 	
    </li>

</ul>
</div>
<jsp:include page="MainFooter.jsp" />
</body>
</html>