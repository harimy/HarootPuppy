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
<title>ResetPw.jsp</title>
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
<jsp:include page="Main.jsp" />

<!-----------------------------
  ResetPw.jsp
  - 새 비밀번호 입력 페이지
------------------------------->

<div>
	<!-- 메뉴영역 -->
	<div>
		<%-- <c:import url="EmployeeMenu.jsp"></c:import> --%>
	</div>
	
	<div>
		<h2>비밀번호 재설정</h2>
	</div>
	<div id="content">
			<input type="text" id="newPw" name="newPw" class="textBox" placeholder="변경하실 PW를 입력해주세요">
			<br><br>
			<input type="text" id="birthday" name="birthday" class="textBox" placeholder="변경하실 PW를 확인해주세요">
			<br><br>
			<button type="submit" id="subBtn">비밀번호 재설정</button>
	</div>
	
	<!-- 회사 소개 및 어플리케이션 소개 영역 -->
	<div id="footer">
	
	</div>
</div>

</body>
</html>