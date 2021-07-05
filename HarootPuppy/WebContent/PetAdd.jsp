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
<title>PetAdd.jsp</title>

<!-- 제이쿼리 -->
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<!-- jQuery-UI CSS -->
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/jquery-ui.css">


<!-- 부트스트랩 -->
<script type="text/javascript" src="js/bootstrap.js"></script>

<!-- 부트스트랩 CSS -->
<link rel="stylesheet" href="<%=cp%>/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/jquery-ui.css">

<style type="text/css">

.petTable
{
	margin-left: 100px;
	width : 400px;
	text-align: center;
	/* border : 1px solid; */
}

.inIn
{
	display : inline-block;
}

.allIn
{
	text-align: center;	
	width:100%;
}



.cardImage {
	border: 5px solid #ffc107;
	-webkit-border-radius: 50px;
	max-width: 200px;
	height: 200px;
	margin: 0px auto;
	cursor:pointer;
}


/* star rating CSS */
@import
	url('https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap')
	;

.stars {
	display: inline;
	text-align: left;
}

.stars input {
	display: none;
}

.stars label {
	float: right;
	font-size: 25px;
	color: lightgrey;
	margin: 0 5px;
	text-shadow: 1px 1px #bbb;
}

.stars label:before {
	content: '★';
}

.stars input:checked ~ label {
	color: gold;
	text-shadow: 1px 1px #c60;
}

.stars:not (:checked ) >label:hover, .stars:not (:checked ) >label:hover 
	~ label {
	color: gold;
}

.stars input:checked>label:hover, .stars input:checked>label:hover ~
	label {
	color: gold;
	text-shadow: 1px 1px goldenrod;
}

.stars .result:before {
	position: absolute;
	content: "";
	width: 100%;
	left: 50%;
	transform: translateX(-47%);
	bottom: -30px;
	font-size: 30px;
	font-weight: 500;
	color: gold;
	font-family: 'Poppins', sans-serif;
	display: none;
}

.stars input:checked ~ .result:before {
	display: block;
}

.stars #five:checked ~ .result:before {
	content: "I love it ";
}

.stars #four:checked ~ .result:before {
	content: "I like it ";
}

.stars #three:checked ~ .result:before {
	content: "It's good ";
}

.stars #two:checked ~ .result:before {
	content: "I don't like it ";
}

.stars #one:checked ~ .result:before {
	content: "I hate it ";
}

</style>


<script type="text/javascript">

$(function()
		{
			var checkNum1=0;
			var checkNum2=0;
			var checkNum3=0;
			
			// js 폴더, css 폴더 파일 확인 
			// jQuery-UI 캘린더를 불러오는 함수 처리 (datepicker())
			$("#birthday").datepicker(
			{
				dateFormat: "yy-mm-dd"
				, changeMonth: true
				, changeYear: true
			});
		});

</script>

</head>
<body>

<!-----------------------------
   PetAdd.jsp
   - 반려견 추가 페이지
------------------------------->
	<div>
		<!-- 메뉴영역 -->
		<div id="harootHeader">
			<c:import url="MainTest.jsp"></c:import>
		</div>
		
		<br><br><br><br>
		
		<!-- content 영역 -->
		<div class="allIn" id="harootContent">
		<div class="inIn">
			<div class="" style="font-weight: bold; text-align: center;">
				<h1>반려견 등록</h1>
			</div>
			
			<div class="petPhoto">
				<img class="cardImage" src="<%=cp%>/images/puppy1.png">
			</div>	
			<br><br>
			
			
			<div class="petTable">
				<table>
					<tr>
						<td style="width: 20%;">이름</td>
						<td>
						<input type="text" placeholder="내용을 입력해주세요"  style="width:80%;"></td>
					</tr>
					<tr>
						<td>성별</td>
						<td>
	                	<input type="radio" name="gender" id="woman" value="여">
	                	<label for="woman">여</label>
	               		<input type="radio" name="gender" id="man" value="남">
	               		<label for="man">남</label>
	               		</td>
					</tr>
					<tr>
						<td>생년월일</td>
						<td><input type="text" id="birthday" name="birthday" placeholder="생년월일" /></td>
					</tr>
				</table>
			</div>
			
			<div class="petTable">
				<table>
					<tr>
						<td>중성화 여부</td>
						<td>
	                	<input type="radio" name="y/n" id="yes" value="예">
	                	<label for="yes">예</label>
	               		<input type="radio" name="y/n" id="no" value="아니요">
	               		<label for="no">아니요</label>
	               		</td>
					</tr>
					<tr>
						<td>예방 접종 여부</td>
						<td>
							<label><input type="checkbox" name="in" value="광견병">광견병</label>
							<label><input type="checkbox" name="in" value="종합백신">종합백신</label>
							<label><input type="checkbox" name="in" value="켄넬코프">켄넬코프</label>
							<label><input type="checkbox" name="in" value="코로나">코로나</label>
							<label><input type="checkbox" name="in" value="인플루엔자">인플루엔자</label>
						</td>
					</tr>
					<tr>
						<td>품종</td>
						<td></td>
						<td><select name="type_no">
							<option value="mix">믹스</option>
						</select></td>
					</tr>
					<tr>
						<td>크기</td>
					</tr>
					<tr>
						<td>반려견 주소</td>
					</tr>
					<tr>
						<td>자주가는 산책 장소</td>
					</tr>
				</table>
			</div>			
			
			<br><br>
			<div class="smalltext" 
			style="font-size:13px; text-align: center;">
				선택 입력 사항
			</div>	
			
			<div class="petTable">
				<table>
					<tr>
						<td>반려견 등록번호</td>
						<td><input type="text" value="petNum" name="petNum"></td>
					</tr>
					<tr>
						<td>기저 질환</td>
						<td>
							<label><input type="checkbox" name="dis" value="슬개골탈구">슬개골탈구</label>
							<label><input type="checkbox" name="dis" value="알러지">알러지</label>
							<label><input type="checkbox" name="dis" value="방광염">방광염</label>
							<label><input type="checkbox" name="dis" value="피부염">피부염</label>
							<label><input type="checkbox" name="dis" value="치매">치매</label>
						</td>
					</tr>
					<tr>
						<td>관심 사료 (간식)</td>
						<td>
							<label><input type="checkbox" name="meal" value="피부개선">피부개선</label>
							<label><input type="checkbox" name="meal" value="치석">치석</label>
							<label><input type="checkbox" name="meal" value="방광염">방광염</label>
							<label><input type="checkbox" name="meal" value="다이어트">다이어트</label>
							<label><input type="checkbox" name="meal" value="호흡기">호흡기</label>
						</td>
					</tr>
				</table>
			</div>	
			
			<br><br>
			<div class="smalltext" 
			style="font-size:13px; text-align: center;">
				산책메이트 정보 (산책 메이트 서비스 이용 시 필수 입력)
			</div>	
			
			<div class="form-group petTable">
				<table>
					<tr>
						<td>사회성정도</td>

							<td><div class="form-group starsDiv">
								<label for="focusedInput"> <span
									class="input-group-text" id="">기호도</span>
								</label>
								<div class="stars">
									<input type="radio" id="five" name="rate" value="5"> <label
										for="five"></label> <input type="radio" id="four" name="rate"
										value="4"> <label for="four"></label> <input
										type="radio" id="three" name="rate" value="3"> <label
										for="three"></label> <input type="radio" id="two" name="rate"
										value="2"> <label for="two"></label> <input
										type="radio" id="one" name="rate" value="1"> <label
										for="one"></label> <span class="result"></span>
								</div>
							</div>
							</td>



							<td>성격</td>
						</tr>
						<tr>
							<td>입질 여부</td>
						</tr>
				</table>
			</div>	
			
			<div class="center-table btn">
			<input type="button" class="btn" value="등록">	
			<input type="button" class="btn" value="취소">
			<span id="errForm">필수 입력 항목을 입력하세요.</span>			
			</div>
		
		</div>
		</div>

		<br><br><br><br>

		<!-- 하단 회사 설명 영역 -->
		<div id="harootFooter">
			<c:import url="MainFooter.jsp"></c:import>
		</div>
	</div>


</body>

</html>