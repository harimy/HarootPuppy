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
<script type="text/javascript">

</script>
</head>
<body>

<div>
<form>
	<table>
		<tr>
			<th>방 제목</th>
			<td>
				<input type="text" value="내용을 입력해주세요." id="roomTitle" name="roomTitle">
			</td>
		<tr>
		<tr>
			<th>산책 장소</th>
			<td>
				<input type="text" value="내용을 입력해주세요." id="walkPlace" name="walkPlace">
			</td>
		<tr>
	</table>
	<br>
		<div id="map" style="width:300px;height:200px;"></div>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c980959de9d6957591bdf2f69c03ce68"></script>
		<script>
			var container = document.getElementById('map');
			var options = 
			{
				center: new kakao.maps.LatLng(37.383431730893726, 126.96076431156959),
				level: 3
			};
		
			var map = new kakao.maps.Map(container, options);
		</script>
		<br><br>
	<table>
		<tr>
			<th>산책 시간</th>
			<td>
				<select class="form-control input-sm" id="startHour" name="startHour">
				    <c:forEach var="i"  begin="00" end="23">
				        <option value="${i}">${i>9?i:'0'}${i>9?'':i}</option>
				    </c:forEach>
				</select>: 
				<select id="startMinute" name="startMinute">
					<option value="00">00</option>
					<option value="30">30</option>
				</select> ~ 
				<select class="form-control input-sm" id="endHour" name="endHour">
				    <c:forEach var="i"  begin="00" end="23">
				        <option value="${i}">${i>9?i:'0'}${i>9?'':i}</option>
				    </c:forEach>
				</select> : 
				<select id="endMinute" name="endMinute">
					<option value="00">00</option>
					<option value="30">30</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>산책 인원<br>(방장 포함)</th>
			<td>
				<table>
					<tr>
						<td>최소</td>
						<td>
							<select id="minMem" name="minMem">
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
							</select>
						</td>
						<td>최대</td>
						<td>
							<select id="maxMem" name="maxMem">
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
							</select>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<th>산책 스타일</th>
			<td>
				<select id="walkStyle" name="walkStyle">
					<option value="near">가까운 주변을 구석구석 산책해요</option>
					<option value="excite">활기차게 뛰어다녀요</option>
					<option value="slow">느긋하게 쉬어가며 산책해요</option>
				</select>
			</td>
		</tr>
	</table>
	<h3>[ 원하는 산책메이트 특징 ]</h3>
	<table>
		<tr>
			<th>반려견 크기</th>
			<td>
				<input type="checkBox" name="sizeGroup" id="bigSize">
			</td>
			<td><label for="bigSize">대형견</label></td>
			<td>
				<input type="checkBox" name="sizeGroup" id="midSize">
			</td>
			<td><label for="midSize">중형견</label></td>
			<td>
				<input type="checkBox" name="sizeGroup" id="smallSize">
			</td>
			<td><label for="smallSize">소형견</label></td>
		</tr>
		<tr>
			<th>중성화 여부</th>
			<td>
				<input type="radio" name="desexGroup" id="necessary">
			</td>
			<td><label for="necessary">필수</label></td>
			<td>
				<input type="radio" name="desexGroup" id="desex_dontcare">
			</td>
			<td><label for="desex_dontcare">필수</label></td>
		</tr>
		<tr>
			<th>입질하는 반려견</th>
			<td>
				<input type="radio" name="biteGroup" id="ban">
			</td>
			<td><label for="ban">금지</label></td>
			<td>
				<input type="radio" name="biteGroup" id="bite_dontcare">
			</td>
			<td><label for="bite_dontcare">상관없음</label></td>
		</tr>
		<tr>
			<th>양육자 성별</th>
			<td>
				<input type="radio" name="genderGroup" id="same">
			</td>
			<td><label for="same">동일 성별만</label></td>
			<td>
				<input type="radio" name="genderGroup" id="gender_dontcare">
			</td>
			<td><label for="gender_dontcare">상관없음</label></td>
		</tr>
		<tr>
			<th>자동 확정 옵션</th>
			<td>
				<input type="radio" name="autoGroup" id="on">
			</td>
			<td><label for="on">ON</label></td>
			<td>
				<input type="radio" name="autoGroup" id="off">
			</td>
			<td><label for="off">OFF</label></td>
		</tr>
		<tr>
			<th>한 줄 코멘트</th>
		</tr>
	</table>
	<textarea style="width: 700px; height: 100px;" placeholder="내용을 입력하세요"></textarea>
</form>		
</div>

</body>
</html>