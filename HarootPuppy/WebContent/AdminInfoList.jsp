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
<title>AdminInfoList.jsp</title>
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
</style>
<script type="text/javascript">
    
	var openWin;
	
	function openUpdateChild()
	{
	    // window.name = "부모창 이름"; 
	    window.name = "parentForm";
	    // window.open("open할 window", "자식창 이름", "팝업창 옵션");
	    openWin = window.open("AdminUpdateForm.jsp",
	            "childForm", "width=570, height=350, resizable = no");    
	}

</script>
</head>
<body>

<div>
	<!-- 메뉴영역 -->
	<div id="harootHeader">
		<c:import url="AdminMain.jsp"></c:import>
	</div>

	<!-- content 영역 -->
	<div id="harootContent">
		<div style="width: 100%; text-align: center;">
			<h1>관리자 정보 조회</h1>
		</div>
		
		<br><br>
		
		<div>
			<input type="button" value="관리자 추가" id="insertAdmin" class="btn2"  onclick="location.href='AdminInsertForm.jsp' "> 
		</div>
		
		<br><br>
		
		<div>
			<table class="table table-striped table-condensed table-hover" style="text-align: center;"> 
				<tr>
					<th>관리자번호</th>
					<th>이름</th>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>생년월일</th>
					<th>성별</th>
					<th>핸대폰번호</th>
					<th>주소</th>
					<th>등록일자</th>
					<th>정보수정</th>
					<th>정보삭제</th>
				</tr>	
				<tr>
					<td>3030</td>
					<td>부르스리</td>
					<td>tt@naver.com</td>
					<td>9999****</td>
					<td>1995.11.02</td>
					<td>여성</td>
					<td>010-2222-2222</td>
					<td>서울시 서초구</td>
					<td>2019.07.03</td>
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

	<!-- 하단 회사 설명 영역 -->
	<div id="harootFooter">
		<c:import url="MainFooter.jsp"></c:import>
	</div>
</div>

</body>
</html>