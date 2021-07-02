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
<title>AllUserInfoList.jsp</title>
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
	
	function openDetailChild()
	{
	    // window.name = "부모창 이름"; 
	    window.name = "parentForm";
	    // window.open("open할 window", "자식창 이름", "팝업창 옵션");
	    openWin = window.open("UserInfoRead.jsp",
	            "childForm", "width=570, height=350, resizable = no");    
	}
	
	function openUpdateChild()
	{
	    // window.name = "부모창 이름"; 
	    window.name = "parentForm";
	    // window.open("open할 window", "자식창 이름", "팝업창 옵션");
	    openWin = window.open("UserInfoUpdateForm.jsp",
	            "childForm", "width=570, height=350, resizable = no, scrollbars = no");    
	}


</script>
</head>
<body>
<div>
	<div id="harootHeader">
		<c:import url="AdminMain.jsp"></c:import>
	</div>
	<div id="harootContent">
		<div style="width: 100%; text-align: center;">
			<h1>전체 회원정보 조회</h1>
		</div>
		
		<br><br>
		
		<div>
			<select>
				<option>회원번호</option>
				<option>이름</option>
				<option>아이디</option>
				<option>계정상태</option>
			</select>
			<input type="text" name="searchValue" class="textField">
			<input type="button" value="검색" class="btn2" onclick="sendIt()"> 
			<p style="float: right;">전체 회원 수 : 23233</p>
		</div>
		
		<br><br>
		
		<div>
			<table class="table table-striped table-condensed table-hover" style="text-align: center;"> 
				<tr>
					<th>회원번호</th>
					<th>아이디</th>
					<th>이름</th>
					<th>계정상태</th>
					<th>성별</th>
					<th>핸드폰번호</th>
					<th>주소</th>
					<th>세부정보 조회</th>
					<th>회원정보 수정</th>
					<th>회원정보 삭제</th>
				</tr>	
				<tr>
					<td>10000</td>
					<td>aa@naver.com</td>
					<td>박진수</td>
					<td>정상</td>
					<td>남</td>
					<td>010-1111-1111</td>
					<td>서울 마포구</td>
					<td>
						<button type = "button" id="detail" onclick="openDetailChild()">보기</button>
					</td>
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