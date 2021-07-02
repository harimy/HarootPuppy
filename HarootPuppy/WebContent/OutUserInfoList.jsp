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
<title>OutUserInfoList.jsp</title>

<!-- jQuery JS -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-ui.js"></script>
<!-- jQuery-UI CSS -->
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/jquery-ui.css">

<!--  부트스트랩 JS -->
<script type="text/javascript" src="<%=cp%>/js/bootstrap.js"></script>
<!-- 부트스트랩 CSS -->
<link rel="stylesheet" href="<%=cp%>/css/bootstrap.css">

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

	<!-- content 영역 -->
	<div id="harootContent">
		<div style="text-align: center;">
			<h1>탈퇴회원 정보 조회</h1>
		</div>
		
		<br><br>
		
		<div>
			<select>
				<option>회원번호</option>
				<option>아이디</option>
			</select>
			<input type="text" name="searchValue" class="textField">
			<input type="button" value="검색" class="btn2" onclick="sendIt()"> 
		</div>
		
		<br><br>
		
		<div>
			<table class="table table-striped table-condensed table-hover table table-bordered" style="text-align: center;"> 
				<tr>
					<th>회원번호</th>
					<th>아이디</th>
					<th>탈퇴날짜</th>
					<th>탈퇴유형</th>
				</tr>	
				<tr>
					<td>10000</td>
					<td>aa@naver.com</td>
					<td>2021.05.05</td>
					<td>자진탈퇴</td>
				</tr>	
			</table>
		</div>
	</div>

	<!-- 하단 회사 설명 영역 -->
	<div id="harootFooter">
		<c:import url="MainFooter.jsp"></c:import>
	</div>
</div>


</body>
</html>