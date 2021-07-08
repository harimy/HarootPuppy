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
<title>WalkRoomInsertForm.jsp</title>

<link rel="stylesheet" type="text/css" href="<%=cp %>/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/list.css">
<!-- 부트스트랩 css -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 제이쿼리 script -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<!-- 부트스트랩 script -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- 부트스트랩 테마 css -->
<script src="<%=cp %>/js/bootstrap.min.js"></script>

<style type="text/css">
	#harootContent
	{
		width: 100%;
	  	text-align: center;
	  	margin-top: 50px;
	}
	
	.walkroomInfo
	{
		display: inline-block;
		width: 90%;
		text-align: left;
	}
	
	table
	{
		height: 900px;
	}
	
	th
	{
		width: 20;
	}
	
	td
	{
		width: 80%;
	}
	
	.btn-right
	{
		float: right;
		margin: 10px;
	}
	
</style>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c980959de9d6957591bdf2f69c03ce68"></script>

<script type="text/javascript">


/* 산책방 수정할 때 이 함수 사용하면 될 듯 */
/*  $(function ()
    {
       $(".btnDelete").click(function()
       {
          if (confirm("현재 데이터를 정말 삭제하시겠습니까?"))
          {
             $(location).attr("href", "memberdelete.action?mid=" + $(this).val());
          }
       });
      
      
       $(".btnUpdate").click(function()
	    {
	    	$("#title").html("회원 정보 수정").css({"color":"red", "font-weight":"bold"});
	    	
	    	
	    	var mid = $(this).parents("tr").find("td:eq(0)").text();
	    	// btnUpdate의 부모 tr 에서 찾아라 0번째td를 (=mid)
	    	var name = $(this).parents("tr").find("td:eq(1)").text();
	    	var telephone = $(this).parents("tr").find("td:eq(2)").text();
	    	
	    	$("#mid").val(mid);
	    	$("#name").val(name);
	    	$("#telephone").val(telephone);
	    	// insertform 안에 값을 채우기 
	    	// mid 는 hidden
	    	
	    	$("form").attr("action", "memberupdate.action");
	    	// form 속성들 중에 action (=memberinsert.action) 을 바꾸겠다 → "memberupdate.action"
	    	// form 엘리먼트선택자 잡은거 (role의 form)
	    	// role  = 어떤 역할 하는지 이야기
	    });
      
      
       $(".btnCancel").click(function()
 	  	  {
     	  		$("#title").html("회원 정보 입력").css({"color":"black", "font-weight":"normal"});
    	  		
     	  		$("form").attr("action", "memberinsert.action");
 	 	  });
    }); */

   	$(function()
	{
		$("#makeRoom").click(function()
		{
			/*
			// 산책방 제목 유효성 검사
			if( $.trim($("#roomTitle").val()) == "" )
			{
				alert("방 제목을 입력하세요.");
				$("#roomTitle").focus();
				return;
			}
			
			// 산책 장소 유효성 검사
			if ( $.trim($("#walkPlace").val()) == "" )
			{
				alert("산책 장소를 입력하세요.");
				$("#walkPlace").focus();
				return;
			}
			
			// 산책 시간 유효성 검사 필요
			// 현재시간 받아와야함
			// 시작시간은 현재시간보다 .. n시간 이후
			// 종료시간은 시작시간보다 30분 이후부터 가능
			
			// 산책 인원 유효성 검사
			
			if( $("#minMem").val() == null || $("#maxMem").val() == null )
			{
				alert("산책 최소인원과 최대인원을 선택해주세요.");
				return;
			}
			else if( parseInt($("#minMem").val()) >= parseInt($("#maxMem").val()) )
			{
				alert("산책 최소인원은 산책 최대인원보다 작아야 합니다.");
				return;
			}
			
			// 산책스타일
			if ( $("#walkStyle").val() == null )
			{
				alert("산책 스타일을 선택해주세요.");
				return;
			}
			*/
			
			/*
			if ( $("input:radio[name='desexGroup']").val() == "undefined" )
			{
				alert("중성화 여부를 선택해주세요.");
				return;
			}
			*/
			alert($("input:radio[name='desexGroup']").val());
			
			//if ($('input[name="gender"]:checked').val() == 'undefined' )
			
			alert("클릭");

		});
	});
   
   
	function initialize()
	{
		var container = document.getElementById("map");
		var options = 
		{
			center: new kakao.maps.LatLng(37.383431730893726, 126.96076431156959),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
		
		mapTypeControl = new kakao.maps.MapTypeControl();
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
		zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	}
   
	function zoomIn()
	{
		map.setLevel(map.getLevel()-1);
	}
	
	function zoomOut()
	{
		map.setLevel(map.getLevel()+1);
	}
	
	/* 
	function formCheck()
	{
		if(!$.trim($("#roomTitle")))
		{
			alert("방 제목을 입력하세요.");
			$("#roomTitle").focus();
			return false;
		}
		
		if(!$.trim($("#walkPlace")))
		{
			alert("산책 장소를 입력하세요.")
			$("#walkPlace").focus();
			return false;
		}
		
		return true;
	}
 */
</script>


<script>

</script>
</head>

<body onload="initialize()">

<!-------------------------------------------------------------
   WalkRoomInsertForm.jsp
   - 산책방 리스트에서 글쓰기 버튼 클릭시 뜨는 페이지
   - 정보 입력 후 등록 버튼을 누르면 TBL_WALKROOM 에 insert 기능 수행
-------------------------------------------------------------->
<!-- 메뉴영역 -->
<div id="harootHeader">
	<c:import url="Main.jsp"></c:import>
</div>

<div id="harootContent">
<form role="form" action="walkroominsert.action" method="post" name="walkroomForm">
	
	<div class="walkroomInfo">
	<h1>산책방 등록하기</h1>
	<table style="width:100%;">
		<tr><td colspan="2" style="font-size: 20px; font-weight: bold;"><hr style=""> [ 산책방 정보 입력 ] </td></tr>
		<tr>
			<th>방 제목</th>
			<td>
				<input type="text" placeholder="산책방 제목을 입력해주세요." id="roomTitle" name="roomTitle"
				style="width: 30%;">
			</td>
		<tr>
		<tr>
			<th>산책 장소</th>
			<td>
				<input type="text" placeholder="산책 장소를 입력해주세요." id="walkPlace" name="walkPlace"
				style="width: 30%;"><br>
				<br><div id="map" style="width:300px; height:200px;"></div>
			</td>
		</tr>
		<tr>
			<th>산책 시간</th>
			<td>
				<select class=" input-sm" id="startHour" name="startHour">
				    <c:forEach var="i"  begin="00" end="23">
				        <option value="${i}">${i>9?i:'0'}${i>9?'':i}</option>
				    </c:forEach>
				</select> : 
				<select class=" input-sm" id="startMinute" name="startMinute">
					<option value="00">00</option>
					<option value="30">30</option>
				</select> ~ 
				<select class=" input-sm" id="endHour" name="endHour">
				    <c:forEach var="i"  begin="00" end="23">
				        <option value="${i}">${i>9?i:'0'}${i>9?'':i}</option>
				    </c:forEach>
				</select> : 
				<select class=" input-sm" id="endMinute" name="endMinute">
					<option value="00">00</option>
					<option value="30">30</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>산책 인원<br>(방장 포함)</th>
			<td>
				<div style="margin: 5px;"> 
				최소
				<select id="minMem" name="minMem">
					<option value="" selected disabled>=선택=</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
				</select> 명   
				</div>
				<div style="margin: 5px;"> 
				최대
				<select id="maxMem" name="maxMem">
					<option value="" selected disabled>=선택=</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
				</select> 명
				</div>
			</td>
		</tr>
		<tr>
			<th>산책 스타일</th>
			<td>
				<select id="walkStyle" name="walkStyle">
					<option value="" selected disabled>====산책 스타일 선택====</option>
					<option value="1">가까운 주변을 구석구석 산책해요</option>
					<option value="2">활기차게 뛰어다녀요</option>
					<option value="3">느긋하게 쉬어가며 산책해요</option>
				</select>
			</td>
		</tr>
		<tr><td colspan="2" style="font-size: 20px; font-weight: bold;"><hr> [ 원하는 산책메이트 특징 ] </td></tr>
		<tr>
			<th>중성화 여부</th>
			<td>
				<input type="radio" name="desexGroup" id="desex_dontcare" value="0">
				<label for="desex_dontcare">상관없음</label>
				<input type="radio" name="desexGroup" id="desex_neccessay" value="1">
				<label for="desex_neccessay">필수</label>
			</td>
		</tr>
		<tr>
			<th>입질하는 반려견</th>
			<td>
				<input type="radio" name="biteGroup" id="bite_dontcare" value="0">
				<label for="bite_dontcare">상관없음</label>
				<input type="radio" name="biteGroup" id="bite_ban" value="1">
				<label for="ban">금지</label>
			</td>
		</tr>
		<tr>
			<th>양육자 성별</th>
			<td>
				<input type="radio" name="genderGroup" id="gender_dontcare" value="0">
				<label for="gender_dontcare">상관없음</label>
				<input type="radio" name="genderGroup" id="gender_same" value="1">
				<label for="same">동일 성별만</label>
			</td>
		</tr>
		<tr>
			<th>자동 확정 옵션</th>
			<td>
				<input type="radio" name="autoGroup" id="off" value="0">
				<label for="off">OFF</label>
				<input type="radio" name="autoGroup" id="on" value="1">
				<label for="on">ON</label>
			</td>
		</tr>
		<tr>
			<th>한 줄 코멘트</th>
			<td>
				<textarea style="width: 700px; height: 100px; resize: none;" placeholder="내용을 입력하세요"></textarea>
			</td>
		</tr>
	</table>
	<br>
	
	<button type="button" class="btn btn-primary btn-xs btnCancel btn-right" id="makeRoom">등록</button>
	<button type="button" class="btn btn-danger btn-xs btnRegister btn-right" id="goToMain"
	onclick="location.href='walkroommain.action'">취소</button>
	</div>
</form>		
</div>

<!-- 하단 회사 설명 영역 -->
<div id="harootFooter">
	<c:import url="MainFooter.jsp"></c:import>
</div>

</body>
</html>