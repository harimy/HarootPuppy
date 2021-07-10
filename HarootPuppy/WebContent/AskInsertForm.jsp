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
	 	margin: 30px;
	 }
</style>
<script type="text/javascript">
	function cancel()
	{
		location.href = '/WEB-INF/views/AskList.jsp';
	}
</script>
</head>
<body>

<!-- 메뉴영역 -->
<div id="harootHeader">
	<c:import url="Main.jsp"></c:import>
</div>

 <br><br><br>

<div>
 <form>
      <table class="table table-bordered" id="tblAdd">
         <tr>
            <td>제목</td>
            <td>
            	<input type="hidden" id="ask_code" name="ask_code" value="${nextNum }">
               <input type="text" id="name" class="form-control">
            </td>
         </tr>
         <tr>
            <td>카테고리 선택</td>
            <td>
               <select id="selectcate" class="form-control">
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
              <input type="file" name="upload" class="form-control">
            </td>
         </tr>
     </table>
     <br>
    <textarea style="width: 100%;" rows=20 placeholder="내용을 입력하세요" class="form-control"></textarea><br>
 </form>
 </div>
 
 <div style="width:100%; text-align: right;">
	  <button type="button" id="cancel" class="btn" onclick="cancel()">취소</button>
	  <button type="submit" id="register" class="btn">글 등록</button>
 </div>
 
 <br><br><br>
<!-- 하단 회사 설명 영역 -->
<div id="harootFooter">
	<c:import url="MainFooter.jsp"></c:import>
</div>

</body>
</html>