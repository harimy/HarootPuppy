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
<title>WalkApplyDone.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/list.css">
<style type="text/css">
	
	.table th, .lists td, .listTd
	{
		text-align: center;
	}
	
	.table td
	{
		vertical-align: middle;
		/* 수직 정렬을 inline 으로 주면 적용이 되는데 외부스타일로 주면 적용이 안됨. */
	}
	
</style>

<script type="text/javascript">
var openWin;

function openChild(walkroom_code, relation_code)
{
    // window.name = "부모창 이름"; 
    window.name = "parent";
    
    //alert(walkroom_code);
    //alert(relation_code);
    
    // window.open("open할 window", "자식창 이름", "팝업창 옵션");
    openWin = window.open("walkroomentercheck.action?num=" + walkroom_code 
    		+ "&rel=" + relation_code + "&state=apply"
            ,"childForm", "width=570, height=350, resizable = no, scrollbars = no");
}
</script>
</head>
<body>
	<div id="bbsList">
		<table id="bbsList_list" class="table">
			<tr id="title">
				<th style="width: 10%;">글번호</th>
				<th colspan="2" style="width: 35%;">소개</th>
				<th style="width: 15%;">산책 인원</th>
				<th style="width: 30%;">산책 일시</th>
				<th style="width: 10%;">개설자</th>
			</tr>
	
			<c:forEach var="walkroom" items="${applyList }">
			<tr class="lists" onclick="openChild('${walkroom.walkroom_code}', '${walkroom.relation_code }')">
				<td style="vertical-align: middle;">
					${walkroom.walkroom_code }
					<input type="hidden" name="walkroom_code" value="${walkroom.walkroom_code }">
					<input type="hidden" name="sid_code" value="${sid_code }">
				</td>
				<td style="vertical-align: middle;">
					<img style="border-radius: 100px;" src="images/jaerong.jpg" width=80 height=80></img>
				</td>
				<td style="text-align: left; width: 30%;" >
					<div style="text-align: left; display:inline-block;">
						<p class="walkroom_title">[${walkroom.walkroom_title }]<br>
						"${walkroom.walkroom_words }"<br>
						</p>
						<p>산책 장소 : ${walkroom.walkroom_place }<br>
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
				<td style="vertical-align: middle;">
					${walkroom.leader_nickname }
				</td>
			</tr>
			</c:forEach>
		</table>

		<br>
		<div id="bbsList_header">
			<br>
			<div id="leftHeader">
				<form action="" name="searchForm" method="post">
					<select name="searchKey" class="selectField">
						<option value="subject">제목</option>
						<option value="name">작성자</option>
					</select> <input type="text" name="searchValue" class="textField"> <input
						type="button" value="검색" class="btn2" onclick="sendIt()">
				</form>
			</div>
			<!-- #leftHeader -->

		</div>
		<!-- #bbsList_header -->
		<br>
		<br>
		<div id="footer_number" style="text-align: center;">
			<p>1 Prev 21 22 23 24 25 26 27 28 29 30 Next 63</p>

			<!-- 나중에 동적처리할 때 참고용 코드 -->
			<%--    <p>
         <%
         if(dataCount != 0)
         {
         %>
         	<%=pageIndexList %>
         <%
         }
         else
         {
         %>
         	등록된 게시물이 존재하지 않습니다.
         <%
         }
         %>
         </p> --%>

		</div>

	</div>
	<!-- #bbsList_list -->


</body>
</html>