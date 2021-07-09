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
<title>AskRead1.jsp</title>
<style type="text/css">
	body
	{
		/* margin: 30px; */
	}
</style>

</head>
<body>

<div id="harootFooter">
	<c:import url="Main.jsp"></c:import>
</div>
<br>
<div>
<form>
	<div style="text-align: center;">
		<h1>Q. 강아지 정보를 수정하고 싶으면 어떻게 해야 하나요?</h1>
		<hr>
	</div>
	<br>
	<div style="text-align: center;">
		[나의 반려견] 메뉴의 메인 페이지로 이동하여 자신이 등록한 반려견 사진 하단의 수정 버튼을 통해 수정하실 수 있습니다.
	</div>
	<br>
	<div style="text-align: center;">
		<button type="button" onclick="location.href='FaqList.jsp'">목록으로</button>
	</div>
	</form>
</div>
<br>
<div id="harootFooter">
	<c:import url="MainFooter.jsp"></c:import>
</div>

</body>
</html>