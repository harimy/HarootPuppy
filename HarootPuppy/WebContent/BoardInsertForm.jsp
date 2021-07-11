<%@page import="java.io.File"%>
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
<title>BoardInsertForm.jsp</title>
<!-- jQuery JS -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-ui.js"></script>
<!-- jQuery-UI CSS -->
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/jquery-ui.css">

<!--  부트스트랩 JS -->
<script type="text/javascript" src="<%=cp%>/js/bootstrap.js"></script>
<!-- 부트스트랩 CSS -->
<link rel="stylesheet" href="<%=cp%>/css/bootstrap.css"><script type="text/javascript">
	$(function()
	{
		$("#register").click(function()
		{
			var now = new Date();
			var sysdate = now.getFullYear  () + "-" + (parseInt(now.getMonth())+1) + "-" + now.getDate() + " "
		 	+ now.getHours() + ":" + now.getMinutes() + ":" + now.getSeconds();
		 	$("board_date").val(sysdate);
		 	
		 	// 공백 확인 
		 	if($("#board_title").val()=="" || $("#board_content").val()=="")
			{
				$("#err").html("필수 입력 항목이 누락되었습니다.");
				$("#err").css("display", "inline");
				return;		// submit 액션 처리 중단
			}
		 	
		 	$(boardForm).submit();
		});
	});
</script>
</head>
<body>
<jsp:include page="Main.jsp" />
 <br><br><br>
 
<div style="width:85%; margin: auto;">
	<h1>[자유게시판 글 등록하기]</h1>
</div>

 <br><br><br>
<div style="width:85%; margin: auto;">
 <form role="form" action="boardinsert.action" method="post" enctype="multipart/form-data" name="boardForm">
      <table class="table table-bordered" id="tblAdd">
         <tr>
            <td>제목</td>
            <td>
            	<input type="hidden" id="board_code" name="board_code" value="${nextNum }">
            	<input type="hidden" id="board_date" name="board_date"> 
                <input type="text" id="board_title" name="board_title" class="form-control" placeholder="제목을 입력하세요">
            </td>
         </tr>
         <tr>
            <td>카테고리 선택</td>
            <td>
               <select id="board_cate_code" name="board_cate_code" class="form-control">
                  <option value="1" selected="selected">행사/할인정보</option>
                  <option value="2">리뷰</option>
                  <option value="3">수다</option>
                  <option value="4">중고장터</option>
               </select>
            </td>
         </tr>
         <tr>
            <td>첨부파일</td>
            <td>
              <input type="file" id="board_photo" name="board_photo" class="form-control">
            </td>
         </tr>
     </table>
     <br>
    <textarea rows=20 placeholder="내용을 입력하세요" id="board_content" name="board_content" class="form-control"></textarea><br>
 </form>
 
 <div style="margin: auto; text-align: right;">
	  <button type="button" id="cancel" class="btn btn-danger" onclick="location.href='boardlist.action'">취소</button>
	  <button type="submit" id="register" class="btn btn-primary">글 등록</button>
	  <span id="err" style="color: red; font-weight: bold; display: none;"></span>
 </div> 
 
 </div>
 
  <br><br><br>
<!-- 하단 회사 설명 영역 -->
<div id="harootFooter">
	<c:import url="MainFooter.jsp"></c:import>
</div>

</body>
</html>