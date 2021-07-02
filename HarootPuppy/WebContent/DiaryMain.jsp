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
<title>DiaryMain.jsp</title>

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

h1
{
   text-align: center !important;
}

h1>span
{   
   margin: 0px auto !important;
   text-align: center !important;
   font-size: 25pt !important;
}

</style>

</head>
<body>
   <!-----------------------------
  DiaryMain.jsp
  - 페이지 설명
------------------------------->

   <div>
      <!-- 메뉴영역 -->
      <div id="harootHeader">
			<c:import url="Main.jsp"></c:import>
      </div>

      <!-- content 영역 -->
      <div>
         <!-- 반려견 이름 출력 -->
         <div>
         <h1 class="badge-parent">
         <br><br>
           <span class="badge badge-pill badge-warning">재롱이</span>
         </h1>
         <br>
         </div>
         <!-- 정보보기 버튼 -->
         <div style="text-align: right; margin-right: 500px;">
         <button type="button" class="btn btn-success">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lightbulb" viewBox="0 0 16 16">
              <path d="M2 6a6 6 0 1 1 10.174 4.31c-.203.196-.359.4-.453.619l-.762 1.769A.5.5 0 0 1 10.5 13a.5.5 0 0 1 0 1 .5.5 0 0 1 0 1l-.224.447a1 1 0 0 1-.894.553H6.618a1 1 0 0 1-.894-.553L5.5 15a.5.5 0 0 1 0-1 .5.5 0 0 1 0-1 .5.5 0 0 1-.46-.302l-.761-1.77a1.964 1.964 0 0 0-.453-.618A5.984 5.984 0 0 1 2 6zm6-5a5 5 0 0 0-3.479 8.592c.263.254.514.564.676.941L5.83 12h4.342l.632-1.467c.162-.377.413-.687.676-.941A5 5 0 0 0 8 1z"/>
            </svg>
                정보 보기
              </button>
         </div>
            <br>
         
         <!-- 달력영역 -->
         <div style="background-color: pink; height: 500px;">달력영역</div>
         
         <!-- 기본관리 / 특별관리 탭 영역-->
         <div>
            <!-- 메뉴 구성(기본관리/특별관리) -->
            <div>
            <c:import url="DiaryBasicMenu.jsp"></c:import>
            </div>
            <div>
            <!-- 타임라인 -->
            <c:import url="DiaryTimeLine.jsp"></c:import>
            </div>
         
      
         </div><!-- 기본관리 / 특별관리 탭 영역 끝 -->
            
      
      </div>

      <!-- 하단 회사 설명 영역 -->
      <div>
			<c:import url="MainFooter.jsp"></c:import>
      </div>
   </div>

</body>
</html>