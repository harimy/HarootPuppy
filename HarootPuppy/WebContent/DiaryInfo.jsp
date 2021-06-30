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
<title>DiaryInfo.jsp</title>

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


<style type="text/css">
@mixin tablet-and-up {
    @media screen and (min-width: 769px) { @content; }
}
@mixin mobile-and-up {
    @media screen and (min-width: 601px) { @content; }
}
@mixin tablet-and-down  {
    @media screen and (max-width: 768px) { @content; }
}
@mixin mobile-only {
    @media screen and (max-width: 600px) { @content; }
}



ul, li{
  list-style: none;
  padding: 0;
}


li:before {
    content: "";
    width: 15px;
    height: 15px;
    background: white;
    border: 3px solid #fed22f;
    border-radius: 50%;
    position: absolute;
    left: -10px;
    top: 0px;
}

.container{
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 0 1rem;
  /* background: linear-gradient(45deg, #209cff, #68e0cf); */
  
  padding: 3rem 0;
}
.wrapper{
  background: #eaf6ff;
  padding: 2rem;
  border-radius: 15px;
  width: 500px;
}
h1{
  font-size: 1.1rem;
  font-family: sans-serif;
}
.sessions{
  margin-top: 2rem;
  border-radius: 12px;
  position: relative;
}
li{
  border-left: 3px solid #fed22f;
  padding-bottom: 1.5rem;
  position: relative;
  padding-left: 20px;
  margin-left: 10px;
  &:last-child{
    border: 0px;
    padding-bottom: 0;
  }
  &:before{
    content: '';
    width: 15px;
    height: 15px;
    background: white;
    border: 1px solid #4e5ed3;
    box-shadow: 3px 3px 0px #bab5f8;
    box-shadow: 3px 3px 0px #bab5f8;
    border-radius: 50%;
    position: absolute;
    left: -10px;
    top: 0px;
  }
}
.time{
  color: #2a2839;
  font-family: 'Poppins', sans-serif;
  font-weight: 700;
  @include mobile-and-up{
    font-size: .9rem;
  }
  @include mobile-only{
    margin-bottom: .3rem;
    font-size: 0.85rem;
  }

}
.memo{
  color: #4f4f4f;
      font-family: sans-serif;
  line-height: 1.5;
  margin-top:0.4rem;
  @include mobile-only{
    font-size: .9rem;
  }
}

.cardImage {
	border: 5px solid #ffc107;
	-webkit-border-radius: 50px;
	max-width: 200px;
	height: 200px;
	margin: 0px auto;
}

#print
{
text-align: right;
max-width: 30px;
	height: 30px;
	cursor:pointer;
}

.table
{
	width: 50%;
	margin: 0px auto;
}
</style>


</head>
<body>
	<!-----------------------------
  DiaryInfo.jsp
  - 반려견 정보 보기 페이지
------------------------------->

	<div>
		<!-- 메뉴영역 -->
		<div>
			<%-- <c:import url="상단메뉴.jsp"></c:import> --%>
		</div>

		<!-- content 영역 -->
		<div>
			<!-- 반려견 요약 정보 -->
			<div style="text-align: center;">
				<img id="print" src="<%=cp%>/images/icons/main/print.png" onclick="window.print()"><br>
				<h2>재롱이 정보</h2>
				<img class="cardImage" src="<%=cp%>/images/puppy1.png"><br>
				<br><br>
				<table class="table table-sm">
					<tr>
      					<th scope="col">#</th>
      					<th scope="col">내용</th>
    				</tr>
					<tr>
						<td>이름</td>
						<td>재롱이</td>
					</tr>
					<tr>
						<td>생일</td>
						<td>남</td>
					</tr>
					<tr>
						<td>성별</td>
						<td>수컷</td>
					</tr>
					<tr>
						<td>성격</td>
						<td>활발해요 / 사람좋아 / ...  </td>
					</tr>
					<tr>
						<td>반려견등록번호</td>
						<td>4234234</td>
					</tr>
					<tr>
						<td>품종</td>
						<td>리트리버</td>
					</tr>
					<tr>
						<td>접종내역</td>
						<td>광견병 ...</td>
					</tr>
					<tr>
						<td>기저질환</td>
						<td>없음 </td>
					</tr>
				</table>
				
				
				
			</div>
			<!-- 타임라인 영역 -->
			<div class="container">
				<div class="wrapper">
					<h1 style="text-align: center;">2021.06.29</h1>
					<ul class="sessions">
						<li>
							<div class="time">09:00 AM</div>
							<span>산책</span><br>
							<span>날씨 : 좋음</span><br>
							<span class="memo">산책하다가 귀여운 강아지 만남!</span>
						</li>
						<li>
							<div class="time">09:30 AM</div>
							<span>관리명</span><br>
							<span>관리내용</span><br>
							<span class="memo">메모</span>
						</li>
						<li>
							<div class="time">09:30 AM</div>
							<span>관리명</span><br>
							<span>관리내용</span><br>
							<span class="memo">메모</span>
						</li>
						<li>
							<div class="time">09:30 AM</div>
							<span>관리명</span><br>
							<span>관리내용</span><br>
							<span class="memo">메모</span>
						</li>
						<li></li>
					</ul>
				</div>
			</div>
			
		</div>

		<!-- 하단 회사 설명 영역 -->
		<div>
			<%-- <c:import url="하단메뉴.jsp"></c:import> --%>
		</div>
	</div>

</body>
</html>