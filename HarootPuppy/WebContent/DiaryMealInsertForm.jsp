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
<title>DiaryMealInsertForm.jsp</title>

<!-- jQuery JS -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-ui.js"></script>
<!-- jQuery-UI CSS -->
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/jquery-ui.css">

<!--  부트스트랩 JS -->
<script type="text/javascript" src="<%=cp%>/js/bootstrap.js"></script>
<!-- 부트스트랩 CSS -->
<link rel="stylesheet" href="<%=cp%>/css/bootstrap.css">

<!-- 반려견다이어리 CSS / JS -->
<link rel="stylesheet" href="<%=cp%>/css/diary.css">
<script type="text/javascript" src="<%=cp%>/js/diary.js"></script>

<style type="text/css">


.form-control, #focusedInput
{
	display: inline !important;
	
}

#focusedInput
{
	width: 80px !important;
}

.form-group 
{
    margin: 0px auto;
}

.starsDiv
{
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
    align-content: space-between;

}

/* star rating CSS */
@import url('https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap');

.stars
{
	display: inline;
	text-align: left;
}

.stars input{
  display: none;
}
.stars label{
  float: right;
  font-size: 25px;
  color: lightgrey;
  margin: 0 5px;
  text-shadow: 1px 1px #bbb;
}
.stars label:before{
  content: '★';
}
.stars input:checked ~ label{
  color: gold;
  text-shadow: 1px 1px #c60;
}
.stars:not(:checked) > label:hover,
.stars:not(:checked) > label:hover ~ label{
  color: gold;
}
.stars input:checked > label:hover,
.stars input:checked > label:hover ~ label{
  color: gold;
  text-shadow: 1px 1px goldenrod;
}
.stars .result:before{
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
.stars input:checked ~ .result:before{
  display: block;
}
.stars #five:checked ~ .result:before{
  content: "I love it ";
}
.stars #four:checked ~ .result:before{
  content: "I like it ";
}
.stars #three:checked ~ .result:before{
  content: "It's good ";
}
.stars #two:checked ~ .result:before{
  content: "I don't like it ";
}
.stars #one:checked ~ .result:before{
  content: "I hate it ";
}

</style>


</head>
<body>
	<!-----------------------------
  DiaryMealInsertForm.jsp
  - 페이지 설명
------------------------------->

	

		<!-- form 영역 -->
		
		<div>
		  <form action="" id="">
		  	
		  	<!-- 즐겨찾기 영역 -->
		  	
		  	<!-- input meal (음수량) -->
		    <div class="form-group">
		      <label for="focusedInput">
		      	<span class="input-group-text" id="basic-addon1">음수량</span>
		      	</label>
		      <input class="form-control" id="focusedInput" type="text" placeholder="">ml
		    </div>
		    
		    
		  <!-- input meal (기호도) -->
		    <div class="form-group starsDiv">
		      <label for="focusedInput">
		      	<span class="input-group-text" id="basic-addon1">기호도</span>
		      </label>
			      <div class="stars">
			        <input type="radio" id="five" name="rate" value="5">
			        <label for="five"></label>
			        <input type="radio" id="four" name="rate" value="4">
			        <label for="four"></label>
			        <input type="radio" id="three" name="rate" value="3">
			        <label for="three"></label>
			        <input type="radio" id="two" name="rate" value="2">
			        <label for="two"></label>
			        <input type="radio" id="one" name="rate" value="1">
			        <label for="one"></label>
			        <span class="result"></span>
			      </div>
		    </div>  

		    <!-- 공통항목 (메모) -->
		    <div style="display: block !important;">
			    <div>
				  <label for="floatingTextarea"></label>
				  <textarea class="form-control" placeholder="특이사항(메모)" id="floatingTextarea" style="width: 300px; height: 100px;"></textarea>
					<br>
				</div>
		    </div>
		    
		    <!-- 공통항목 (사진 첨부) -->
		    <input type="file" name="profile_pt" id="profile_pt" onchange="previewImage(this,'View_area')">
			<!-- 사진 미리보기 -->
			<div id="View_area"></div>
		    
		    <!-- 사진첨부시 미리보기 출력영역 -->
		   
		    <br><br><br>
		    <input type="reset" value="취소" class="btn btn-outline-secondary">
		    <input type="button" value="저장" class="btn btn-secondary" onclick="">
		    
		  </form>
		</div>


</body>
</html>