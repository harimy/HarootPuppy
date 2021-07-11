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
<title>ReportedBoardRead.jsp</title>
<!-- 부트스트랩 css -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 제이쿼리 script -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<!-- 부트스트랩 script -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- 부트스트랩 테마 css -->
<script src="<%=cp %>/js/bootstrap.min.js"></script>
<style type="text/css">

#boardReadDiv
{
	width: 917px; 
	margin: 100px auto;
}
 
.boardTh
{
	padding: 4px;
}

</style>

<script type="text/javascript">


	$(function()
	{
		$("#reportBtn").click(function()
		{
			var board_code = $("#reportBtn").val();
			//alert(board_code);
			//--==>> 3 (board_code)
			
			var rep_state_code = $("#rep_state_code").val();
			
			//alert(rep_state_code);
			//--==>> 1, 2, 3 (미처리, 신고해제, 신고확정)
			 
			$(location).attr("href", "adminreportboardhandle.action?board_code=" 
					+ board_code + "&rep_state_code=" + rep_state_code);
			
			
		});
	});

	
</script>



</head>
<body>
<div>
	<!-- 메뉴영역 -->
	<div id="harootHeader">
		<c:import url="AdminMenu.jsp"></c:import>
	</div>
	<div id="boardReadDiv">
	<form action="" id="" name="">
		<div>
			<%-- 
			<h5>카테고리</h5>
			<!-- <h1>글제목</h1> -->
			<h1>${search.board_title }</h1>
			<h4>작성자</h4>
			 --%>
			 <table style="width: 100%;">
			 	<tr>
			 		<th style="width: 20%;" class="boardTh">글제목</th>
			 		<th style="width: 80%;" class="boardTh">${search.board_title }</th>
			 	</tr>
			 	<tr>
			 		<th class="boardTh">신고자</th>
			 		<th class="boardTh">${search.reporter_nickname }</th>
			 	</tr>
			 	<tr>
			 		<th class="boardTh">작성자</th>
			 		<th class="boardTh">${search.board_writer }</th>
			 	</tr>
			 	<tr>
			 		<th class="boardTh">신고접수날짜</th>
			 		<th class="boardTh">${search.rep_log_date }</th>
			 	</tr>
			 	<tr>
			 		<th class="boardTh">신고처리</th>
			 		<th class="boardTh">${search.rep_state_content }</th>
			 	</tr>
			 </table>
		</div>
		
		<div>
			<textarea rows="25" cols="127" readonly="readonly" >
				<%-- ${search.board_content } --%>
				<%-- 줄바꿈 처리 --%>
				<c:out value="${search.board_content }" />
			</textarea>
		</div><br>
		
		<br>
		
		<!-- 
		미처리 1
		신고해제 2
		신고확정 3 
		-->
		
	
		<div style="float: right;">
			<select name="rep_state_code" id="rep_state_code" style="height: 32px; width: 122px;">
				<option value="1">미처리</option>
				<option value="2">신고해제</option>
				<option value="3">신고확정</option>
			</select>
			<button type="button" name="reportBtn" id="reportBtn"
				 class="btn btn-dark" value="${search.board_code }" onclick="">확인</button>
		</div>
		
		<br><br><br>
		<div class="bbsArticle_bottomLine">
			<p><a href="">이전글 : 이전글입니다. </a></p>
			<hr>
		</div>
		<div class="bbsArticle_noLine">
			<p><a href="">다음글 : 다음글입니다. </a></p>
		</div>
		<br><br>
		<div>
			<button type="button" id="listBtn" class="listbtn btn btn-secondary" onclick="location.href='adminreportboardlist.action'">
				목록으로
			</button>
		</div>
	</form>
	</div>
	<!-- 하단 회사 설명 영역 -->
	<div id="harootFooter">
		<c:import url="MainFooter.jsp"></c:import>
	</div>
	
</div>	

</body>
</html>