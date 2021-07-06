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
<title>WalkRoomList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="/HarootPuppy/js/jquery-ui.js"></script>
<!-- jQuery-UI CSS -->
<link rel="stylesheet" type="text/css" href="/HarootPuppy/css/jquery-ui.css">

<!--  부트스트랩 JS -->
<script type="text/javascript" src="/HarootPuppy/js/bootstrap.js"></script>
<!-- 부트스트랩 CSS -->
<link rel="stylesheet" href="/HarootPuppy/css/bootstrap.css">

<script type="text/javascript">

var openWin;

function openChild()
{
    // window.name = "부모창 이름"; 
    window.name = "parentForm";
    // window.open("open할 window", "자식창 이름", "팝업창 옵션");
    openWin = window.open("WalkRoomGuestFixOption.jsp",
            "childForm", "width=570, height=350, resizable = no, scrollbars = no");    
}

function setChildText(){
    openWin.document.getElementById("cInput").value = document.getElementById("pInput").value;
}


</script>

<style type="text/css">
	th, td
	{
		text-align: center;
	}

</style>

</head>
<body>
<div>
	<input type="button" value="방 만들기" style="float: right;">
</div>
<br><br>

<div>
	<table id="bbsList_list" class="table">
		<tr id="title">
			<th class="num" style="width: 100px;">번호</th>
			<th class="roomInfo" style="width: 400px;">소개</th>
			<th class="memNum" style="width: 100px;">산책 인원</th>
			<th class="time" style="width: 150px;">산책 시간</th>
			<th class="host" style="width: 100px;">개설자</th>
		</tr>

		<tr id="lists" onclick="openChild()"> 
			<td class="num">1</td>
			<td class="roomInfo">저녁 산책 하GO 건강 챙기GO</td>
			<td class="memNum">저쩌구</td>
			<td class="time">1/4</td>
			<td class="host">뚜또맘</td> 
		</tr>

		<c:forEach var="walkroom" items="${list }">
		<tr>
			<td>${walkroom.walkroom_code }</td>
			<td>${walkroom.walkroom_title }</td>
			<td>${walkroom.walkroom_min }명~${walkroom.walkroom_max }명</td>
			<td>${walkroom.walkroom_start }~${walkroom.walkroom_end }</td>
			<td>${walkroom.mem_nickname }</td>
		</tr>
		</c:forEach>
		 
	</table>
</div>

</body>
</html>