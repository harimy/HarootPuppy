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
<style type="text/css">
	 body
	 {
	 	margin: 30px;
	 }
	 
	 .tr
	 {
	 	width: 100%;
	 }
	 
	 #answer
	 {
	 	text-align: right;
	 }
</style>
</head>
<body>

<div style="text-align: center;">
	<h1>1:1 문의</h1>
</div>
<br><br>
<div>
  <form action="" name="categoryForm" method="post">
     <select name="categoryKey" class="selectField">
        <option value="walk">산책</option>
        <option value="diary">다이어리</option>
        <option value="board">게시판</option>
        <option value="account">계정</option>
        <option value="etc">기타</option>
     </select>
  </form>
</div>
<br><br>
<div>
	<table>
		<tr>
			<th><a href="">Q. 강아지 정보를 수정하고 싶으면 어떻게 해야 하나요?</a></th>
			<td id="answer"><a href="">답변 예정</a></td>
		</tr>
	</table>
</div>

<div style="width:100%; text-align: right;">
	<button type="button" id="insertAsk">글 등록</button>
</div>

</body>
</html>