<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
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


<script type="text/javascript" src="js/bootstrap.js"></script>

<!-- <link rel="stylesheet" href="<%=cp%>/css/bootstrap.css">  -->

<link rel="stylesheet" type="text/css" href="<%=cp%>/css/jquery-ui.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-ui.js"></script>
<script type="text/javascript">

	$(document).ready(function()
	{
		if( $("#pet_type_name").val=="치와와" )	
			$("#pet_type_size").val="소형견";
		else if( $("#pet_type_name").val=="비글" )
			$("#pet_type_size".val="중형견");
	    else if( $("#pet_type_name").val=="사모예드" )
	   		$("#pet_type_size".val="대형견");
	});
	

	$(function()
	{
		var checkNum1=0;
		var checkNum2=0;
		var checkNum3=0;
		
		// js 폴더, css 폴더 파일 확인 
		// jQuery-UI 캘린더를 불러오는 함수 처리 (datepicker())
		$("#pet_birth").datepicker(
		{
			dateFormat: "yy-mm-dd"
			, changeMonth: true
			, changeYear: true
		});
		
		/*
		$("#add").click(function()
		{
			alert($("#pet_photo").val());
		});            
		*/
		
	});

	
	  
	 function openAddressChild() 
	  {
		    var _width = '650';
		    var _height = '380';
		 
		    // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
		    var _left = Math.ceil(( window.screen.width - _width )/2);
		    var _top = Math.ceil(( window.screen.height - _height )/2); 
		 
		    var open = window.open('PetAddrSelect.jsp', 'popup-test', 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );	 		
	 		
	  }
	 
	 function openAddressChild1() 
	  {
		    var _width = '650';
		    var _height = '380';
		 
		    // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
		    var _left = Math.ceil(( window.screen.width - _width )/2);
		    var _top = Math.ceil(( window.screen.height - _height )/2); 
		 
		    var open = window.open('WalkPlaceSelect.jsp', 'popup-test', 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );	 		
	 		
	  }
	 
	 function openSelectTypeChild() 
	  {
		    var _width = '650';
		    var _height = '380';
		 
		    // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
		    var _left = Math.ceil(( window.screen.width - _width )/2);
		    var _top = Math.ceil(( window.screen.height - _height )/2); 
		 
		    var open = window.open('PetTypeSelect.jsp', 'popup-test', 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );	 		
	 		
	  }
	 
	 
	 
	 

</script>

<style type="text/css">
#errMsg
{
	color: red;
	font-size: small;
	display: none;
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
	url('https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap');

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

#harootContent
{
	width: 100%;
	text-align: center;
}

.petRegisterForm
{
	display: inline-block;
	width: 80%;
	text-align: left;
	font-size: 20px;
}

.petRegisterTable
{
	width: 80%;
	height: 900px;
	display: inline-block;

}

.petRegisterTable tr
{
	text-align: center;
}

.petRegisterTable th
{
	width: 40%;
}

.petRegisterTable td
{
	width: 60%;
	vertical-align: middle;
	text-align: left;
}

</style>

</head>
<body>

<!-----------------------------
   PetAdd.jsp
   - 반려견 추가 페이지
------------------------------->
<!-- 메뉴영역 -->
<div id="harootHeader">
	<c:import url="Main.jsp"></c:import>
</div>
		
<br><br><br><br>
		
<!-- content 영역 -->
<div id="harootContent">
	<form method="post" action="addpet.action">
		<input type="hidden" name="sid_code" value="${sid_code }">
		<div>
			<h1>반려견 등록</h1>
		</div>
	
		<table class="petRegisterTable">
			<tr>
				<th>반려견 사진 선택</th>
				<td>
					<div class="petPhoto">
						<input type="file" value="파일 선택" name="pet_photo" id="pet_photo"/>
					 	<div class="select_img"><img id="img"/></div>					 
					 </div>
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="pet_name" placeholder="내용을 입력해주세요" style="width:80%;">
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
		       		<input type="radio" name="pet_sex" id="woman" value="F">
		       		<label for="woman">여</label>
		      		<input type="radio" name="pet_sex" id="man" value="M">
		      		<label for="man">남</label>
		      	</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input type="text" id="pet_birth" name="pet_birth" placeholder="생년월일" /></td>
			</tr>
			<tr>
				<th>중성화 여부</th>
				<td>
	        		<input type="radio" name="desex_content" id="yes" value="Y">
	        		<label for="yes">예</label>
	       			<input type="radio" name="desex_content" id="no" value="N">
	       			<label for="no">아니요</label>
	       		</td>
			</tr>
			<tr>
				<th>예방 접종 여부</th>
				<td>
					<label><input type="checkbox" name="inject_type_name" value="광견병">광견병</label>
					<label><input type="checkbox" name="inject_type_name" value="종합백신">종합백신</label>
					<label><input type="checkbox" name="inject_type_name" value="켄넬코프">켄넬코프</label>
					<label><input type="checkbox" name="inject_type_name" value="코로나">코로나</label>
					<label><input type="checkbox" name="inject_type_name" value="인플루엔자">인플루엔자</label>
				</td>
			</tr>
			<tr>
				<th>품종</th>
				<td>
					<select id="type" id="pet_type_name" name="pet_type_name">
						<option value="치와와">치와와</option>
						<option value="비글">비글</option>
						<option value="사모예드">사모예드</option>
						<option value="믹스">믹스</option>
					</select>
					<input type="hidden" value="" name="pet_type_size">
				</td>
			</tr>
			<tr>
				<th>크기</th>
			</tr>
			<tr>
				<th>반려견 주소</th>
				<td>
					<input type="text" name="pet_addr" id="pet_addr" placeholder="반려견 주소를 입력하세요">
					<input type="button" onclick="openAddressChild()" value="주소 검색"><br>
					<div id="addrMap" style="width:300px; height:300px; margin-top:10px; display:none"></div>
					<input type="hidden" id="pet_addr_lat" name="pet_addr_lat" value="">
					<input type="hidden" id="pet_addr_lng" name="pet_addr_lng" value="">				</td>
			</tr>
			<tr>
				<th>자주가는 산책 장소</th>
				<td>
					<input type="text" name="pet_fav_place" id="pet_fav_place" placeholder="자주가는 산책 주소를 입력하세요">
					<input type="button" onclick="openAddressChild1()" value="주소 검색"><br>
					<div id="addrMap" style="width:300px; height:300px; margin-top:10px; display:none"></div>
					<input type="hidden" id="pet_fav_lat" name="pet_addr_lat" value="">
					<input type="hidden" id="pet_fav_lng" name="pet_addr_lng" value="">
				</td>
			</tr>				
		
			<tr>
				<th colspan="2" style="text-align: center; font-size: 20px;">
					<br><br>[선택 입력 사항]
				</th>
			</tr>
	
			<tr>
				<th>반려견 등록번호</th>
				<td>
					<input type="text" name="pet_regnum" placeholder="등록번호를 입력하세요">
				</td>
			</tr>
			<tr>
				<th>기저 질환</th>
				<td>
					<label><input type="checkbox" name="disease_content" value="슬개골탈구">슬개골탈구</label>
					<label><input type="checkbox" name="disease_content" value="알러지">알러지</label>
					<label><input type="checkbox" name="disease_content" value="방광염">방광염</label>
					<label><input type="checkbox" name="disease_content" value="피부염">피부염</label>
					<label><input type="checkbox" name="disease_content" value="치매">치매</label>
				</td>
			</tr>
			<tr>
				<th>관심 사료 (간식)</th>
				<td>
					<label><input type="checkbox" name="fav_food_content" value="피부개선">피부개선</label>
					<label><input type="checkbox" name="fav_food_content" value="치석">치석</label>
					<label><input type="checkbox" name="fav_food_content" value="방광염">방광염</label>
					<label><input type="checkbox" name="fav_food_content" value="다이어트">다이어트</label>
					<label><input type="checkbox" name="fav_food_content" value="호흡기">호흡기</label>
				</td>
			</tr>
		
			<tr>
				<th colspan="2" style="text-align: center; font-size: 20px;">
					<br><br>[산책메이트 정보]
				</th>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center; font-size: 20px;">
					(산책 메이트 서비스 이용시 필수 입력)
				</td>
			</tr>
		
			<tr>
				<th>사회성정보</th>
				<td style="text-align: left;">
					<div class="stars" style="display: inline-block;">
						<input type="radio" id="five" name="pet_social" value="5">
						<label for="five"></label> 
						<input type="radio" id="four" name="pet_social" value="4"> 
						<label for="four"></label> 
						<input type="radio" id="three" name="pet_social" value="3">
						<label for="three"></label> 
						<input type="radio" id="two" name="pet_social" value="2"> 
						<label for="two"></label> 
						<input type="radio" id="one" name="pet_social" value="1"> 
						<label for="one"></label> 
						<span class="result"></span>
					</div>
				</td>
			</tr>
			<tr>
				<th>성격</th>
				<td>1. 
	              	<input type="radio" name="pet_char1_content" id="c1" value="활발해요">
	              	<label for="c1">활발해요</label>
	             	<input type="radio" name="pet_char1_content	" id="c2" value="얌전해요">
	             	<label for="c2">얌전해요</label>
	             	<br>
	             		
	             	2. 
	             	<input type="radio" name="pet_char2_content" id="c3" value="겁이 많아요">
	              	<label for="c3">겁이많아요</label>
	             	<input type="radio" name="pet_char2_content" id="c4" value="대범해요">
	             	<label for="c4">아니요</label>
	             	<br>
	             		
	             	3.
	             	<input type="radio" name="pet_char3_content" id="c5" value="말이 많아요">
	              	<label for="c5">말이 많아요</label>
	             	<input type="radio" name="pet_char3_content" id="c6" value="조용해요">
	             	<label for="c6">조용해요</label>
	             	<br>
	             		
	             	4.
	             	<input type="radio" name="pet_char4_content" id="c7" value="주인바라기">
	              	<label for="c7">주인바라기</label>
	             	<input type="radio" name="pet_char4_content" id="c8" value="사람이면 다 좋아요">
	             	<label for="c8">사람이면 다 좋아요</label>
	             </td>  		
			</tr>						
			<tr>
				<th>입질 여부</th>
				<td>
	              	<input type="radio" name="bite_content" id="no" value="입질 없음">
	              	<label for="no">안물어요</label>
	             	<input type="radio" name="bite_content" id="yes" value="입질 있음">
	             	<label for="yes">물어요</label>
		        </td>
			</tr>     
		</table>
		
		<br>
		<div style="float: right;">
		<input type="button" class="btn" value="취소">
		<button type="submit" class="btn" name="add" id="add" value="등록">등록</button>
		
		<span id="errMsg">필수 입력 항목을 입력하세요.</span>			
		</div>

	</form>
</div>

<br><br><br><br>

<!--  하단 회사 설명 영역-->
<div id="harootFooter">
	<c:import url="MainFooter.jsp"></c:import>
</div>


</body>

</html>