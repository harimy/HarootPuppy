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
<title>HarootMain.jsp</title>
<style type="text/css">
	/* body
	{
		width: 100%;
	} */
	
	#header
	{
		background-color: rgb(236,181,73);
	}
	#menu
	{
		background-color: rgb(236,181,73);
	}
	#footer
	{
		background-color: rgb(236,181,73);
	}
	
</style>
</head>
<body>
<jsp:include page="Main.jsp" />
<div>
	<!-- 메뉴영역 -->
	<div id="harootHeader">
		<c:import url="Main.jsp"></c:import>
	</div>

	<!-- content 영역 -->
	<div id="harootContent">
		<c:import url="BoardList.jsp"></c:import>
	</div>

	<!-- 하단 회사 설명 영역 -->
	<div id="harootFooter">
		<c:import url="MainFooter.jsp"></c:import>
	</div>
</div>

</body>
</html>