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
<title>AskRead2.jsp</title>
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
		<h1>Q. 산책점수를 높이려면 어떻게 해야 하나요?</h1>
		<hr>
	</div>
	<br>
	<div style="text-align: center;">
				

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