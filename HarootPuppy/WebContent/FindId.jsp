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
<title>FindId.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/jquery-ui.css">


<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-ui.js"></script>
<script type="text/javascript">
	
</script>


<style type="text/css">

	.textBox
	{
		width: 250px;
	}
</style>


</head>
<body>
<!-----------------------------
  FindId.jsp
  - 아이디 찾기 페이지
------------------------------->

<div>
	<!-- 메뉴영역 -->
	<div>
		<%-- <c:import url="EmployeeMenu.jsp"></c:import> --%>
	</div>
	
	<div>
		<h2>ID 찾기</h2>
	</div>
	<div id="content">
			<input type="text" id="id" name="id" class="textBox" placeholder="이름을 입력해주세요">
			<br><br>
			<input type="text" id="birthday" name="birthday" class="textBox" placeholder="생년월일을 입력해주세요(YYYYMMDD)">
			<br><br>
			<button type="submit">ID 찾기</button>
			<button type="button" onclick="">PW 재설정</button>
	</div>
	
	<!-- 회사 소개 및 어플리케이션 소개 영역 -->
	<div id="footer">
	
	</div>
</div>

</body>
</html>