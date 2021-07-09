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
<title>Sample.jsp</title>

<!-- 제이쿼리 -->
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<!-- jQuery-UI CSS -->
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/jquery-ui.css">

<!-- 부트스트랩 -->
<script type="text/javascript" src="js/bootstrap.js"></script>

<!-- 부트스트랩 CSS -->
<link rel="stylesheet" href="<%=cp%>/css/bootstrap.css">

<script type="text/javascript">
</script>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/jquery-ui.css">
<style type="text/css">
</style>
</head>
<body>

<!-----------------------------
   Sample.jsp
   - 페이지 설명
------------------------------->
	<div>
		<!-- 메뉴영역 -->
		<div id="harootHeader">
			<c:import url="Main.jsp"></c:import>
		</div>
		
		<br><br><br><br>
		
		<!-- content 영역 -->
		<div id="harootContent">
		<!-- <c:import url="UserMyPage.jsp"></c:import> -->
		</div>

		<br><br><br><br>

		<!-- 하단 회사 설명 영역 -->
		<div id="harootFooter">
			<c:import url="MainFooter.jsp"></c:import>
		</div>
	</div>


</body>

</html>