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
<title>DiaryTimeLine.jsp</title>

<!-- jQuery JS -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-ui.js"></script>
<!-- jQuery-UI CSS -->
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/jquery-ui.css">

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



.timeLineUl, .timeLineLi
{
  list-style: none;
  padding: 0;
}


.timeLineLi:before {
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

.timeContainer{
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 0 1rem;
  /* background: linear-gradient(45deg, #209cff, #68e0cf); */
  
  padding: 3rem 0;
}
.timeWrapper{
  background: #eaf6ff;
  padding: 2rem;
  border-radius: 15px;
  width: 500px;
}

#h1Time{
  font-size: 1.1rem;
  font-family: sans-serif;
}

.sessions{
  margin-top: 2rem;
  border-radius: 12px;
  position: relative;
}
li.timeLineLi{
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



.out
{
	width:100%;
	text-align: center;
}

.in
{
	display:inline-block;
}

</style>


</head>
<body>
	<!-----------------------------
  DiaryTimeLine.jsp
  - 반려견 다이어리 하단 타임라인 페이지
------------------------------->

	<div class="out">
		<!-- 메뉴영역 -->
		<div class="in">
			<%-- <c:import url="상단메뉴.jsp"></c:import> --%>
		</div>

		<!-- content 영역 -->
		<div>
			<div class="container timeContainer">
				<div class="wrapper timeWrapper">
					<h1 style="text-align: center;" id="h1Time">2021.06.29</h1>
					<ul class="sessions timeLineUl">
						<li class="timeLineLi">
							<div class="time">09:00 AM</div>
							<span>산책</span><br>
							<span>날씨 : 좋음</span><br>
							<span class="memo">산책하다가 귀여운 강아지 만남!</span>
						</li>
						<li class="timeLineLi">
							<div class="time">09:30 AM</div>
							<span>관리명</span><br>
							<span>관리내용</span><br>
							<span class="memo">메모</span>
						</li>
						<li class="timeLineLi">
							<div class="time">09:30 AM</div>
							<span>관리명</span><br>
							<span>관리내용</span><br>
							<span class="memo">메모</span>
						</li>
						<li class="timeLineLi">
							<div class="time">09:30 AM</div>
							<span>관리명</span><br>
							<span>관리내용</span><br>
							<span class="memo">메모</span>
						</li>
						<li class="timeLineLi"></li>
					</ul>
				</div>
			</div><!-- div.container -->
		</div>

	</div>

</body>
</html>