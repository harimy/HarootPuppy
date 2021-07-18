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
<script type="text/javascript" src="<%=cp%>/js/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/jquery-ui.css">
<!-- 부트스트랩 script -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- 부트스트랩 테마 css -->
<script src="<%=cp %>/js/bootstrap.min.js"></script>

<!-- 타임피커 사용을 위한 리소스들 -->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">

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
	
	#errRoomTitle, #errWalkPlace, #errWalkStyle, #errDesex, #errBite, #errGender, #errAutoOption, #errDate
	{
		color: red;
		font-size: small;
		display: none;
	}
	
	#errMemCount
	{
		color: red;
		font-size: small;
		display: none;
		margin-top: 18px;
	}

	
</style>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c980959de9d6957591bdf2f69c03ce68"></script>
<script type="text/javascript">
    
    // 페이지 로드될 때 불려지는 jquery 함수
	$(document).ready(function()
	{
		if("${walkroom.walkroom_code}" != null && "${walkroom.walkroom_code}" != "")
		{
			// 산책방 글쓰기일 경우 walkroom_code == null
			// 산책방 수정일 경우 walkroom_code 값을 가지기 때문에 이 if 문에 걸리게 됨
			$(document).attr("title", "WalkRoomUpdateForm.jsp");
			$("#pageTitle").html("산책방 정보 수정");
			$("#makeRoom").html("수정");
			$("#walkroom_code").val("${walkroom.walkroom_code}");
			$(".genDate_td").css("display", "inline");
			$("#goToMain").attr("onclick", "location.href='walkroomenter.action?num=${walkroom.walkroom_code}'");
			$("form").attr("action", "walkroomupdate.action?num=${walkroom.walkroom_code}");	
			$("#harootHeader").css("display", "none");
		}
		else
		{
			$("#walkroom_code").val("${nextNum}");
			//alert($("#walkroom_code").val());
		}
	});

	// 유효성 검사용 jquery 함수
   	$(function()
	{
   	    $('.timepicker').timepicker({
   	        timeFormat: 'HH:mm',
   	        interval: 30,
   	        minTime: '00:00',
   	        maxTime: '23:30',
   	        startTime: '00:00',
   	        dynamic: false,
   	        dropdown: true,
   	        scrollbar: true
   	    });
   	    
   		
		$("#makeRoom").click(function()
		{
			$("#errRoomTitle").css("display", "none");
			$("#errWalkPlace").css("display", "none");
			$("#errWalkStyle").css("display", "none");
			$("#errMemCount").css("display", "none");
			$("#errDesex").css("display", "none");
			$("#errBite").css("display", "none");
			$("#errGender").css("display", "none");
			$("#errAutoOption").css("display", "none");
			$("#errDate").css("display", "none");

			
			// 산책방 제목 유효성 검사
			if( $.trim($("#walkroom_title").val()) == "" )
			{
				$("#errRoomTitle").css("display", "inline");
				$("#walkroom_title").focus();
				return;
			}
			
			// 산책 장소 유효성 검사
			if ( $.trim($("#walkroom_place").val()) == "" )
			{
				$("#errWalkPlace").css("display", "inline");
				$("#walkroom_place").focus();
				return;
			}
		
			// 산책 시간 유효성 검사 필요
			//-- 시작시간은 현재시간보다 1시간 이후 and 24시간 이내
			//   종료시간은 시작시간보다 30분 이후 and 4시간 이내로 종료 해야함
			
			//-- 산책방 수정 시 시작시간은 개설시간 기준으로 1시간 이후 and 24시간 이내로만 수정 가능
			//   종료시간은 개설때와 같이 시작시간 기준 30분 이후 and 4시간 이내.
			
			// 현재시간 받아오기
			var now = new Date();
			var sysdate = now.getFullYear() + "-" + (parseInt(now.getMonth())+1) + "-" + now.getDate() + " "
			 	+ now.getHours() + ":" + now.getMinutes() + ":" + now.getSeconds();
			$("#walkroom_gendate").val(sysdate);
			//alert(sysdate);
			
			//now.getFullYear(); 		// 년도
			//now.getMonth(); 		// 월  // 월 단위의 경우 0부터 시작되기 때문에 +1 을 해줘야 됩니다.
			//now.getDate(); 			// 일
			//now.getHours(); 		// 시
			//now.getMinutes(); 		// 분
			//now.getSeconds(); 		// 초
			
			
			//alert("현재 날짜 및 시간 : " + (parseInt(now.getMonth())+1) + "월" + now.getDate() + "일" 
			//		+ now.getHours() + "시" + now.getMinutes() + "분");
			
			var startDate = $("#startDate").val();		// 사용자가 선택한 산책 출발 날짜 값 받아서 변수에 담음
			var startDateArr = startDate.split('-');	// -를 기준으로 잘라내어 배열로 저장 => 2021-07-06 → 2021 07 06
			var canStart1 = new Date(now.getFullYear(), now.getMonth(), now.getDate()
					, parseInt(now.getHours()) + 1, now.getMinutes(), now.getSeconds());				// 현재시간 + 1시간 
			
			var canStart2 = new Date(now.getFullYear(), now.getMonth(), now.getDate()
					, parseInt(now.getHours()) + 24, now.getMinutes(), now.getSeconds());			// 현재시간 + 24시간

			var startTime = $("#startTime").val();		// 사용자가 선택한 산책 출발 시간 값 받아서 변수에 담음
			var startTimeArr = startTime.split(':');	// :를 기준으로 잘라내어 배열로 저장 => 03:00 → 03 00
			
			//alert(startDateArr[0] + " " + startDateArr[1] + " " + startDateArr[2]);
			//alert(startTimeArr[0] + " " + startTimeArr[1]);
			
			var endDate = $("#endDate").val();		// 사용자가 선택한 산책 종료 날짜 값 받아서 변수에 담음
			var endDateArr = endDate.split('-');	// -를 기준으로 잘라내어 배열로 저장 => 2021-07-06 → 2021 07 06
			
			var endTime = $("#endTime").val();		// 사용자가 선택한 산책 종료 시간 값 받아서 변수에 담음
			var endTimeArr = endTime.split(':');	// :를 기준으로 잘라내어 배열로 저장 => 03:00 → 03 00
			
			//alert(endDateArr[0] + " " + endDateArr[1] + " " + endDateArr[2]);
			//alert(endTimeArr[0] + " " + endTimeArr[1]);
			
			var walkStart = new Date(startDateArr[0], parseInt(startDateArr[1])-1, startDateArr[2], startTimeArr[0], startTimeArr[1]);
			var sendWalkStart = startDateArr[0] + "-" + startDateArr[1] + "-" + startDateArr[2] + " " + startTimeArr[0] + ":" + startTimeArr[1];
			//alert("선택한 시작날짜 및 시간 : " + (parseInt(walkStart.getMonth())+1) + "월" + walkStart.getDate() + "일" + walkStart.getHours() + "시" + walkStart.getMinutes() + "분");
			
			var walkEnd = new Date(endDateArr[0], parseInt(endDateArr[1])-1, endDateArr[2], endTimeArr[0], endTimeArr[1]);
			var sendWalkEnd = endDateArr[0] + "-" + endDateArr[1] + "-" + endDateArr[2] + " " + endTimeArr[0] + ":" + endTimeArr[1];
			//alert("선택한 종료날짜 및 시간 : " + (parseInt(walkEnd.getMonth())+1) + "월" + walkEnd.getDate() + "일" + walkEnd.getHours() + "시" + walkEnd.getMinutes() + "분");
			
			var canEnd1 = new Date(walkStart.getFullYear(), walkStart.getMonth(), walkStart.getDate()
					, walkStart.getHours(), parseInt(walkStart.getMinutes())+30, walkStart.getSeconds());	// 산책 종료 시간 최소값
			var canEnd2 = new Date(walkStart.getFullYear(), walkStart.getMonth(), walkStart.getDate()
					, parseInt(walkStart.getHours())+4, walkStart.getMinutes(), walkStart.getSeconds());	// 산책 종료 시간 최대값
	
			//alert("canEnd1: " + canEnd1);
			//alert("canEnd2: " + canEnd2);
			
			if("${walkroom.walkroom_code}" != null && "${walkroom.walkroom_code}" != "") // 산책방 수정인 경우 개설시간을 기준으로 유효성 체크 
			{
				var gen = "${walkroom.walkroom_gendate }"; 	// 산책방 개설시간 받아와서 변수에 저장 (ex. 2021-06-27 19:02:38)
				//var gendate = new Date(gen.substr(0, 4), gen.substr(5, 2)-1, gen.substr(8, 2), gen.substr(11,2), gen.substr(14,2), gen.substr(17,2));
				
				//alert(gen);
				var gen_canStart1 = new Date(gen.substr(0, 4), gen.substr(5, 2)-1, gen.substr(8, 2)
						, parseInt(gen.substr(11,2)) + 1, gen.substr(14,2), gen.substr(17,2));				// 산책 시작시간 최소값				
				var gen_canStart2 = new Date(gen.substr(0, 4), gen.substr(5, 2)-1, gen.substr(8, 2)
						, parseInt(gen.substr(11,2)) + 24, gen.substr(14,2), gen.substr(17,2));				// 산책 시작시간 최대값
						
				//alert("gen_canStart1 : " + gen_canStart1);
				//alert("gen_canStart2 : " + gen_canStart2);
				
				if( $("#startDate").val() == "" || $("#startTime").val() == "" || $("#endDate").val() == "" || $("#endTime").val() == "" )
				{
					$("#errDate").css("display" ,"inline");
					return;
				}
				else if( walkStart < gen_canStart1 )	// 산책 시작시간이 기존 개설 시간으로부터 1시간이내인 경우 산책방 개설 불가
				{
					$("#errDate").html("산책 시작시간은 개설시간 기준 1시간 이후부터 설정할 수 있습니다.");
					$("#errDate").css("display", "inline");
					return;
				}
				else if( walkStart > gen_canStart2 )	// 산책 시작시간이 기존 개설 시간으로부터 24시간 이후인 경우 산책방 개설 불가
				{
					$("#errDate").html("산책 시작시간은 개설시간 기준 24시간 이내로만 설정할 수 있습니다.");
					$("#errDate").css("display", "inline");
					return;
				}
			}
			else	// 산책방 등록인 경우 현재시간을 기준으로 유효성 체크
			{
				if( $("#startDate").val() == "" || $("#startTime").val() == "" || $("#endDate").val() == "" || $("#endTime").val() == "" )
				{
					$("#errDate").css("display" ,"inline");
					return;
				}
				
				if( walkStart < canStart1 )	// 산책 시작시간이 현재시간으로부터 1시간이내인 경우 산책방 개설 불가
				{
					$("#errDate").html("산책 시작시간은 1시간 이후부터 설정할 수 있습니다.");
					$("#errDate").css("display", "inline");
					return;
				}
				
				if( walkStart > canStart2 )	// 산책 시작시간이 24시간 이후인 경우 산책방 개설 불가
				{
					$("#errDate").html("산책 시작시간은 24시간 이내로만 설정할 수 있습니다.");
					$("#errDate").css("display", "inline");
					return;
				}
			}
			
			
			if( walkEnd < canEnd1 )	// 최소 30분 이상은 산책해야함
			{
				$("#errDate").html("최소 산책시간은 30분 입니다.");
				$("#errDate").css("display", "inline");
				return;
			}
			
			if( walkEnd > canEnd2 )	// 최소 30분 이상은 산책해야함
			{
				$("#errDate").html("최대 산책시간은 4시간 입니다.");
				$("#errDate").css("display", "inline");
				return;
			}
			// 산책 시작시간, 산책 종료시간 값으로 전달
			
			$("#walkroom_start").val(sendWalkStart);
			$("#walkroom_end").val(sendWalkEnd);
			
			
			// 산책 인원 유효성 검사
			if( $("#walkroom_min").val() == null )
			{
				$("#errMemCount").html("산책 최소인원을 선택해주세요.");
				$("#errMemCount").css("display", "inline");
				return;
			}
			else if( $("#walkroom_max").val() == null )
			{
				$("#errMemCount").html("산책 최대인원을 선택해주세요.");
				$("#errMemCount").css("display", "inline");
				return;
			}
			else if( parseInt($("#walkroom_min").val()) > parseInt($("#walkroom_max").val()) )
			{
				$("#errMemCount").html("산책 최소인원은 산책 최대인원보다 작아야 합니다.");
				$("#errMemCount").css("display", "inline");
				return;
			}
			
			// 산책스타일
			if ( $("#style_code").val() == null )
			{
				$("#errWalkStyle").css("display", "inline");
				return;
			}

			// 중성화 여부
			if ($('input[name="desex_code"]:checked').val() == undefined )
			{
				$("#errDesex").css("display" ,"inline");
				return;
			}
			
			// 입질 여부
			if ($('input[name="bite_code"]:checked').val() == undefined )
			{
				$("#errBite").css("display" ,"inline");
				return;
			}
			
			// 양육자 성별
			if ($('input[name="samesex_code"]:checked').val() == undefined )
			{
				$("#errGender").css("display" ,"inline");
				return;
			}
			
			// 자동확정 옵션
			if ($('input[name="auto_code"]:checked').val() == undefined )
			{
				$("#errAutoOption").css("display" ,"inline");
				return;
			}
			
			$(walkroomForm).submit();
			
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
	<h1 id="pageTitle">산책방 등록하기</h1>
	<table style="width:100%;">
		<tr><td colspan="2" style="font-size: 20px; font-weight: bold;"><hr style="width: 80%;"> [ 산책방 정보 입력 ] </td></tr>
		<tr>
			<th>방 제목</th>
			<td>
				<input type="hidden" id="walkroom_code" name="walkroom_code" value="">
				<input type="hidden" id="walkroom_gendate" name="walkroom_gendate" value=""> <!-- 현재시간 담아 보내도록 ajax 처리 -->
				<input type="text" placeholder="산책방 제목을 입력해주세요." id="walkroom_title" name="walkroom_title"
				style="width: 30%;" value="${walkroom.walkroom_title }">
				<span id="errRoomTitle">산책방 제목을 입력해주세요.</span>
			</td>
		<tr>
		<tr>
			<th>산책 장소</th>
			<td>
				<input type="text" placeholder="산책 장소를 입력해주세요." id="walkroom_place" name="walkroom_place"
				style="width: 30%;" value="${walkroom.walkroom_place }">
				<span id="errWalkPlace">산책 장소를 입력해주세요.</span><br>
				<br><div id="map" style="width:300px; height:200px;"></div>
				
			</td>
		</tr>
		<tr>
			<th></th>	<!-- 산책방 수정시에만 나타나는 개설시간 -->
			<td style="display: none; color: red;" class="genDate_td">
				개설 시간 : ${walkroom.walkroom_gendate }
			</td>
		</tr>
		<tr>
			<th>산책 시간</th>
			<td>
				<input type="date" id="startDate" value="${walkroom.walkroom_startdate }" required>
				<input id='startTime' type='text' class='timepicker' value="${walkroom.walkroom_starttime }"
				 style="height: 40px;" readonly/>
				<input type="hidden" id="walkroom_start" name="walkroom_start" value="">
				~ 
				<input type="date" id="endDate" value="${walkroom.walkroom_enddate }" required>
				<input id='endTime' type='text' class='timepicker' value="${walkroom.walkroom_endtime }"
				style="height: 40px;" readonly/>
				<input type="hidden" id="walkroom_end" name="walkroom_end" value="">
				<span id="errDate">산책 날짜 및 시간을 선택해주세요.</span>
			</td>
		</tr>
		<tr>
			<th>산책 인원<br>(방장 포함)</th>
			<td>
				<div style="float: left;">
					<div style="margin: 5px;"> 
					최소
					<select id="walkroom_min" name="walkroom_min">
						<option value="" selected disabled>=선택=</option>
						<option value="2" ${walkroom.walkroom_min==2? "selected=\"selected\"" : ""}>2</option>
						<option value="3" ${walkroom.walkroom_min==3? "selected=\"selected\"" : ""}>3</option>
						<option value="4" ${walkroom.walkroom_min==4? "selected=\"selected\"" : ""}>4</option>
					</select> 명   
					</div>
					<div style="margin: 5px;"> 
					최대
					<select id="walkroom_max" name="walkroom_max">
						<option value="" selected disabled>=선택=</option>
						<option value="2" ${walkroom.walkroom_max==2? "selected=\"selected\"" : ""}>2</option>
						<option value="3" ${walkroom.walkroom_max==3? "selected=\"selected\"" : ""}>3</option>
						<option value="4" ${walkroom.walkroom_max==4? "selected=\"selected\"" : ""}>4</option>
					</select> 명
					</div>
				</div>
				<span id="errMemCount">산책 인원을 선택해주세요.</span>
			</td>
		</tr>
		<tr>
			<th>산책 스타일</th>
			<td>
				<select id="style_code" name="style_code">
					<option value="" selected disabled>====산책 스타일 선택====</option>
					<option value="1" ${walkroom.style_code==1? "selected=\"selected\"" : ""}>가까운 주변을 구석구석 산책해요</option>
					<option value="2" ${walkroom.style_code==2? "selected=\"selected\"" : ""}>활기차게 뛰어다녀요</option>
					<option value="3" ${walkroom.style_code==3? "selected=\"selected\"" : ""}>느긋하게 쉬어가며 산책해요</option>
				</select>
				<span id="errWalkStyle">산책 스타일을 선택해주세요.</span>
			</td>
		</tr>
		<tr><td colspan="2" style="font-size: 20px; font-weight: bold;"><hr style="width: 80%;"> [ 원하는 산책메이트 특징 ] </td></tr>
		<tr>
			<th>중성화 여부</th>
			<td>
				<input type="radio" name="desex_code" id="desex_dontcare" value="0"
				${walkroom.desex_code==0? "checked=\"checked\"" : ""}>
				<label for="desex_dontcare">상관없음</label>
				<input type="radio" name="desex_code" id="desex_neccessary" value="1"
				${walkroom.desex_code==1? "checked=\"checked\"" : ""}>
				<label for="desex_neccessary">필수</label>
				<span id="errDesex">중성화 여부 옵션을 선택해주세요.</span>
			</td>
		</tr>
		<tr>
			<th>입질하는 반려견</th>
			<td>
				<input type="radio" name="bite_code" id="bite_dontcare" value="0"
				${walkroom.bite_code==0? "checked=\"checked\"" : ""}>
				<label for="bite_dontcare">상관없음</label>
				<input type="radio" name="bite_code" id="bite_ban" value="1"
				${walkroom.bite_code==1? "checked=\"checked\"" : ""}>
				<label for="bite_ban">금지</label>
				<span id="errBite">입질하는 반려견 옵션을 선택해주세요.</span>
			</td>
		</tr>
		<tr>
			<th>양육자 성별</th>
			<td>
				<input type="radio" name="samesex_code" id="gender_dontcare" value="0"
				${walkroom.samesex_code==0? "checked=\"checked\"" : ""}>
				<label for="gender_dontcare">상관없음</label>
				<input type="radio" name="samesex_code" id="gender_same" value="1"
				${walkroom.samesex_code==1? "checked=\"checked\"" : ""}>
				<label for="gender_same">동일 성별만</label>
				<span id="errGender">양육자 성별 옵션을 선택해주세요.</span>
			</td>
		</tr>
		<tr>
			<th>자동 확정 옵션</th>
			<td>
				<input type="radio" name="auto_code" id="off" value="0"
				${walkroom.auto_code==0? "checked=\"checked\"" : ""}>
				<label for="off">OFF</label>
				<input type="radio" name="auto_code" id="on" value="1"
				${walkroom.auto_code==1? "checked=\"checked\"" : ""}>
				<label for="on">ON</label>
				<span id="errAutoOption">자동 확정 옵션을 선택해주세요.</span>
			</td>
		</tr>
		<tr>
			<th>한 줄 코멘트(선택)</th>
			<td>
				<textarea style="width: 70%; height: 100px; resize: none;" placeholder="내용을 입력하세요"
				 id="walkroom_words" name="walkroom_words">${walkroom.walkroom_words }</textarea>
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
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
</body>
</html>