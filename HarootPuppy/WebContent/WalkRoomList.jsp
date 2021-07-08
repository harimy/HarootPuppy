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
<%-- <link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css"> --%>
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
	th
	{
		text-align: center;
	}
	
	.walkroom_title
	{
		font-weight: bold;
	}

</style>

</head>
<body>
<div>
	<input type="button" value="방 만들기" style="float: right;" onclick="location.href='walkroominsertform.action'">
</div>
<br><br>

<div>
	<table id="bbsList_list" class="table">
		<tr id="title">
			<th style="width: 10%;">번호</th>
			<th colspan="2" style="width: 35%;">소개</th>
			<th style="width: 15%;">산책 인원</th>
			<th style="width: 30%;">산책 시간</th>
			<th style="width: 10%;">개설자</th>
		</tr>

		<!-- 
		<tr > 
			<td class="num">1</td>
			<td class="roomInfo">저녁 산책 하GO 건강 챙기GO</td>
			<td class="memNum">저쩌구</td>
			<td class="time">1/4</td>
			<td class="host">뚜또맘</td> 
		</tr>
		-->

		<c:forEach var="walkroom" items="${list }">
		<tr id="lists" onclick="openChild()">
			<td style="vertical-align: middle;">${walkroom.walkroom_code }</td>
			<td style="vertical-align: middle;">
				<img style="border-radius: 100px;" src="images/jaerong.jpg" width=80 height=80></img>
			</td>
			<td style="text-align: left; width: 30%;" >
				<div style="text-align: left; display:inline-block;">
					<p class="walkroom_title">[${walkroom.walkroom_title }]<br>
					"${walkroom.walkroom_words }"<br>
					</p>
					<p>${walkroom.walkroom_place }<br>
					산책 스타일 : ${walkroom.style_content}<br>
					원하는 산책메이트 특징<br>
					✅입질 여부 : ${walkroom.bite_content }<br>
					✅중성화 여부 : ${walkroom.desex_content }<br>
					✅보호자 성별 : ${walkroom.samesex_content }<br>
					</p>
				</div>
			</td>
			<td style="vertical-align: middle;">
				( ${walkroom.parti_count} / ${walkroom.walkroom_max } )<br>
				최소 인원 ${walkroom.walkroom_min } 명<br>
			</td>
			<td style="vertical-align: middle;">${walkroom.walkroom_start }<br> ~ <br>${walkroom.walkroom_end }</td>
			<td style="vertical-align: middle;">${walkroom.mem_nickname }</td>
		</tr>
		</c:forEach>
		 
	</table>
</div>

</body>
</html>