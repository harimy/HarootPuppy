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
<title>OutUserInfoList.jsp</title>
<link rel="stylesheet" href="css/bootstrap.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<style type="text/css">
	/*테이블 기본 서식*/
	#table
	{
		width: 500px;
		border: 1px solid black;
		border-collapse: collapse;
	}
	
	#table td
	{
		border: 1px solid black;
	}
	
	#outUserTable th, td
	{
		text-align: center !important;
	}
	
	#harootContent
	{
		margin: 30px;
	}
	
</style>
<script type="text/javascript">
	function openUpdateChild()
	{
	    // window.name = "부모창 이름"; 
	    window.name = "parentForm";
	    // window.open("open할 window", "자식창 이름", "팝업창 옵션");
	    openWin = window.open("AdminUpdateForm.jsp",
	            "childForm", "width=570, height=350, resizable = no, scrollbars = no");    
	}
</script>
</head>
<body>
<div>
	<div id="harootHeader">
		<c:import url="AdminMain.jsp"></c:import>
	</div>
	
	<br><br><br><br>
	
	<div id="harootContent">
		<div style="width: 100%; text-align: center;">
			<h1>탈퇴 회원 정보 조회</h1>
		</div>
		
		<br><br>
		
		<button type="button" id="insertAdmin">관리자 추가</button>
		
		<br><br>
		
		<div>
			<table class="table table-striped table-condensed table-hover" style="text-align: center;" id="outUserTable"> 
				<tr>
					<th>관리자번호</th>
					<th>아이디</th>
					<th>이름</th>
					<th>등록 일자</th>
					<th>정보 수정</th>
					<th>정보 삭제</th>
				</tr>	
				<tr>
					<td>10000</td>
					<td>aa@naver.com</td>
					<td>박진수</td>
					<td>2020.08.07</td>
					<td>
						<button type = "button" id="update" onclick="openUpdateChild()">수정</button>
					</td>
					<td>
						<button type = "button" id="delete">삭제</button>
					</td>
				</tr>	
			</table>
		</div>
	</div>
	<div id="harootFooter">
		<c:import url="MainFooter.jsp"></c:import>
	</div>
</div>
</body>
</html>