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
<title>ReportedReplyList.jsp</title>
<link rel="stylesheet" href="css/bootstrap.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<style type="text/css">
	/*테이블 기본 서식*/
	
	#reportedBoardList th, td
	{
		text-align: center !important;
	}
	
	#harootContent
	{
		margin: 30px;
	}
	
</style>
<script type="text/javascript">

	$(document).ready(function()
	{
		
		$("#allCheck").click(function()
		{
			$("td").children().prop("checked", this.checked);
		});
	});

</script>
</head>
<body>
<div>
	
	<div id="harootContent">
		
		<br><br>
		
		<div style="float: right;">
			<select>
				<option>미처리</option>
				<option>신고해제</option>
				<option>신고확정</option>
			</select>
			<input type="button" value="확인"> 
		</div>
		
		<br><br>
		
		<div>
			<table class="table table-striped table-condensed table-hover" style="text-align: center;" id="reportedBoardList"> 
				<tr>
					<th>
						<input type="checkbox" id="allCheck">
					</th>
					<th>처리 상태</th>
					<th>신고 유형</th>
					<th>제목</th>
					<th>신고 접수자</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>읽음</th>
				</tr>	
				<tr>
					<td>
						<input type="checkbox" class="processReport">
					</td>
					<td>미처리</td>
					<td>욕설/비방</td>
					<td>똥멍청이들아xxxxx</td>
					<td>윈터</td>
					<td>카리나</td>
					<td>34</td>
					<td>Ｏ</td>
				</tr>	
			</table>
		</div>
	</div>
	
	<div id="footer" style="text-align: center;">
		<p>1 Prev 21 22 23 24 25 26 27 28 29 30 Next 63</p>
	</div>
	
	<br><br><br><br>
	
</div>
</body>
</html>