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
<title>AskInsertForm.jsp</title>
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
<script type="text/javascript">
	$(function()
	{
		$("#update").click(function()
		{
			var now = new Date();
			var sysdate = now.getFullYear() + "-" + (parseInt(now.getMonth())+1) + "-" + now.getDate() + " "
		 	+ now.getHours() + ":" + now.getMinutes() + ":" + now.getSeconds();
		 	$("#ask_date").val(sysdate);
		 	
			//alert($("#ask_date").val());
		 	if($("#ask_title").val()=="" || $("#ask_content").val()=="")
			{
				$("#err").html("필수 입력 항목이 누락되었습니다.");
				$("#err").css("display", "inline");
				return;		// submit 액션 처리 중단
			}
		 	
			
		 	$(askForm).submit();
		});
	});
</script>
</head>
<body>

<!-- 메뉴영역 -->
<div id="harootHeader">
	<c:import url="Main.jsp"></c:import>
</div>
 <br><br><br>
<div style="width:85%; margin: auto;">
	<h1>[1:1 질문 글 수정하기]</h1>
</div>

 <br><br><br>

<div style="width:85%; margin: auto;">
 <form role="form" action="askupdate.action" method="post" name="askForm">
      <table class="table table-bordered" id="tblAdd">
         <tr>
            <td>제목</td>
            <td>
            	<input type="hidden" id="ask_code" name="ask_code" value="${ask_code }">
            	<input type="hidden" id="ask_date" name="ask_date" value="">
            	<input type="hidden" id="sid_code" name="sid_code" value="${search.sid_code }">
            	<input type="hidden" id="ask_state_code" name="ask_state_code" value="${search.ask_state_code }"> 
               <input type="text" id="ask_title" name="ask_title" class="form-control" value="${search.ask_title }">
            </td>
         </tr>
         <tr>
            <td>카테고리 선택</td>
            <td>
               <select id="ask_cate_code" name="ask_cate_code" class="form-control">
                  <option value="1" ${"1"== search.ask_cate_code ? "selected='selected'"  : "" }>산책메이트</option>
                  <option value="2" ${"2"== search.ask_cate_code ? "selected='selected'"  : "" }>다이어리</option>
                  <option value="3" ${"3"== search.ask_cate_code ? "selected='selected'"  : "" }>게시판</option>
                  <option value="4" ${"4"== search.ask_cate_code ? "selected='selected'"  : "" }>계정</option>
                  <option value="5" ${"5"== search.ask_cate_code ? "selected='selected'"  : "" }>기타</option>
               </select>
            </td>
         </tr>
         <tr>
            <td>첨부파일</td>
            <td>
              <input type="file" id="ask_photo" name="ask_photo" class="form-control" value="${search.ask_photo }">
            </td>
         </tr>
     </table>
     <br>
    <textarea rows=20 class="form-control" id="ask_content" name="ask_content">${search.ask_content }</textarea><br>
 </form>
 </div>
 
 <div style="width:85%; margin: auto; text-align: right;">
	  <button type="button" id="cancel" class="btn btn-danger" onclick="location.href='asklist.action'">취소</button>
	  <button type="submit" id="update"  class="btn btn-primary">글 수정</button>
	  <span id="err" style="color: red; font-weight: bold; display: none;"></span>
 </div>
 
 <br><br><br>
<!-- 하단 회사 설명 영역 -->
<div id="harootFooter">
	<c:import url="MainFooter.jsp"></c:import>
</div>

</body>
</html>