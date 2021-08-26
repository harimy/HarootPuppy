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
<title>WalkMain.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/menuStyle.css">
<%-- <link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css"> --%>

<!-- jQuery JS -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="/HarootPuppy/js/jquery-ui.js"></script>
<!-- jQuery-UI CSS -->
<link rel="stylesheet" type="text/css"
	href="/HarootPuppy/css/jquery-ui.css">

<!--  부트스트랩 JS -->
<script type="text/javascript" src="/HarootPuppy/js/bootstrap.js"></script>
<!-- 부트스트랩 CSS -->
<link rel="stylesheet" href="/HarootPuppy/css/bootstrap.css">

<style type="text/css">

#harootContent
{
	width: 100%;
  	text-align: center;
  	margin-top: 50px;
}

.walkUserInfo
{
	width: 60%;
	display: inline-block;
}

.walkHotPlace
{
	float: left;
}

.walkPet
{
	float: right;
}

.walkOptionArea
{
	width: 70%;
	height: 200px;
	display: inline-block;
	margin-top: 50px;
}

.walkRoomListArea
{
	display: inline-block;
	width: 70%;
}

.cardImage 
{
	border: 5px solid #ffc107;
	-webkit-border-radius: 50px;
	max-width: 200px;
	height: 200px;
	margin: 0px auto;
}

.cardImage:hover 
{
	color: #212529;
	background-color: #e0a800;
	border-color: #d39e00;
}

.petImage 
{
	width: 300px;
	height: 300px;
	float: center;
}


.table 
{
	margin: 0px auto !important;
}



</style>

<script type="text/javascript">
  /*
  function openAddressChild() 
  {
	    var _width = '650';
	    var _height = '380';
	 
	    // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
	    var _left = Math.ceil(( window.screen.width - _width )/2);
	    var _top = Math.ceil(( window.screen.height - _height )/2); 
	 
	    window.open('WalkPlaceSelect.jsp', 'popup-test', 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );
   }*/
</script>


</head>
<body>

<!------------------------------------
   WalkMain.jsp
   - 산책메이트 메뉴에서 반려견 선택 후 화면 
   - 산책방 리스트 출력
------------------------------------->

<!-- 메뉴영역 -->
<div id="harootHeader">
	<c:import url="Main.jsp"></c:import>
</div>

<!-- content 영역 -->
<div id="harootContent">
<!-- 	<div id="mapAndPet"> -->
		<div class="walkUserInfo">
			<div class="walkHotPlace">
				<div>내 주변 산책 핫플레이스
					<input type="button" value="위치 재설정" onclick="sample5_execDaumPostcode()">
				</div>
				<div id="map" style="width:300px; height:300px; margin:10px; display:block"></div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c980959de9d6957591bdf2f69c03ce68&libraries=services"></script>
<script>
    var mapContainer = document.getElementById("map"), // 지도를 표시할 div
    mapOption = 
    {
        center: new daum.maps.LatLng(${pet.pet_addr_lat}, ${pet.pet_addr_lng}), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };
    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker(
    {
        position: new daum.maps.LatLng(${pet.pet_addr_lat}, ${pet.pet_addr_lng}),
        map: map
    });
    function sample5_execDaumPostcode() 
    {
        new daum.Postcode(
        {
            oncomplete: function(data) 
            {
                var addr = data.address; // 최종 주소 변수
                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").innerHTML = '설정한 주소지 : ' + addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) 
                {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) 
                    {     
                        var result = results[0]; //첫번째 결과의 값을 활용
                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        
                        // alert(result.y);
                        // alert(result.x);
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                        
                    }
                });
            }
        }).open();
    }
    
    
</script>
<span id="sample5_address">반려견 주소지 : ${pet.pet_addr}</span>
			</div>
			<div class="walkPet">
				<div>산책할 반려견
					<input type="button" value="수정" onclick="location.href='walkroomselect.action'">
				</div>
				<div><img style="margin: 10px;" class="petImage" src="/HarootPuppy/images/jaerong.jpg"></div>
				<div>${pet.pet_name }</div>
			</div>
		</div>

		<br><br>

		<div class="walkOptionArea">
			<table border="1" style="text-align: center; width:100%; height:100%;">
				<tr height=20%>
					<th>반경</th>
					<td>
						<form action="" name="radiusForm" method="post">
							<select name="radiusSelect" class="selectField">
								<option value="0.5">500m</option>
								<option value="1">1Km</option>
								<option value="2">2Km</option>
								<option value="3">3Km</option>
							</select>
						</form>
					</td>
				</tr>
				<tr height=20%>
					<th>산책 출발 시간</th>
					<td>
						<form action="" name="timeForm" method="post">
							<select name="timeSelect" class="selectField">
								<option value="1h">1시간 이내</option>
								<option value="2h">2시간 이내</option>
								<option value="3h">3시간 이내</option>
								<option value="4h">4시간 이내</option>
								<option value="etc">상관없음</option>
							</select>
						</form>
					</td>
				</tr>
				<tr height=20%>
					<th>중성화 여부</th>
					<td><label for="necc"> <input type="radio"
							name="necc" id="necc" value="necc">&nbsp;필수
					</label> <label for="neccdontcare"> <input type="radio"
							name="necc" id="neccdontcare" value="neccdontcare">&nbsp;상관없음
					</label></td>
				</tr>
				<tr height=20%>
					<th>입질 여부</th>
					<td><label for="noBite"> <input type="radio"
							name="bite" id="noBite" value="no">&nbsp;입질 없는 반려견만
					</label> <label for="bitedontcare"> <input type="radio"
							name="bite" id="bitedontcare" value="bitedontcare">&nbsp;상관없음
					</label></td>
				</tr>
				<tr height=20%>
					<th>양육자 성별</th>
					<td>
						<label for="sameSex">
						<input type="radio" name="sex" id="sameSex" value="same">
						동일 성별만</label> 
						<label for="sexdontcare">
						<input type="radio" name="sex" id="sexdontcare" value="sexdontcare">
						상관없음</label>
					</td>
				</tr>
			</table>
			<br>
			<div style="float: right;">
		 		<input type="checkBox" name="able" id="onlyAble" value="onlyAble">
		 		<label for="onlyAble">참여가능한 방만 보기</label>
		 		<input type="button" value="검색">
			</div>
		</div>
		<br>
	
		<br><br><br><br>
		
		<div class="walkRoomListArea">
			<jsp:include page="walkroomlist.action" />
		</div>
		
		<br><br>

	</div>      
	

<!-- 하단 회사 설명 영역-->
<div id="harootFooter">
	<c:import url="MainFooter.jsp"></c:import>
</div>

</body>
</html>