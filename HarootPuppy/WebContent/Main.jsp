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
<title>Main.jsp</title>

<script type="text/javascript"
   src="http://code.jquery.com/jquery.min.js"></script>
<style>

    /* 메뉴 수정 */
   .ab ul, ol, li { list-style:none; margin:0; padding:0; width: 100%}
   	
    ul.myMenu {text-align: center;}
    ul.myMenu > li { display:inline-block; width:300px; padding:5px 10px; background:rgb(244,188,23); text-align:center; position:relative; }
    ul.myMenu > li:hover { background:rgb(244,188,23); }
    ul.myMenu > li ul.submenu { display:none; position:absolute; top:30px; left:0; }
    ul.myMenu > li:hover ul.submenu { display:block; }
    ul.myMenu > li ul.submenu > li { display:inline-block; width:300px; padding:5px 10px; text-align:center; background-color: white;}
    ul.myMenu > li ul.submenu > li:hover { background-color: rgb(250, 223, 114);  }
    
   a.container:link, a.container:visited
	 {
		display: block;
		font-weight: bold;
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
		height: 26px;
	}
	
	a { text-decoration: none; color: black; }
    a:visited { text-decoration: none; }
    a:hover { text-decoration: none; }
    a:focus { text-decoration: none; }
    a:hover, a:active { text-decoration: none; }
</style>

</head>
<body>

<jsp:include page="MainHeader.jsp"></jsp:include>

<div id="container" class="ab" style="background-color: rgb(244,188,23);">
<ul class="myMenu">
	<li class="menu1">
        <a href="diaryselectpet.action">나의 반려견
        <input type="hidden" value="${sid_code }" name="sid_code"> 
        </a>
    </li>
    <li class="menu2">
    	<a href="WalkSelectPet.jsp">산책메이트</a>	
    	<ul class="menu3_s submenu">
            <li style="margin-top: 5px;"><a href="WalkSelectPet.jsp">산책메이트</a></li>
            <li><a href="WalkHistoryMain.jsp">히스토리</a></li>
        </ul> 
    </li>   
    <li class="menu3">
        <a href="boardlist.action">자유게시판</a>
        <ul class="menu3_s submenu">
            <li style="margin-top: 5px;"><a href="boardlist.action">자유게시판</a></li>
            <li>HOT 게시판<li>
        </ul>   
    </li>
    <li class="menu4">
    	<a href="FaqList.jsp">고객 지원</a>
    	<ul class="menu4_s submenu">
            <li style="margin-top: 5px;"><a href="FaqList.jsp">자주하는 질문</a></li>
            <li><a href="AskList.jsp">1:1 질문</a></li>
        </ul> 
    </li>

</ul>
</div>



</body>
</html>