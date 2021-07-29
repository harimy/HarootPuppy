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
<title>ReportedBoardList.jsp</title>
<!-- 
<link rel="stylesheet" href="css/bootstrap.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css">
 -->
 
<link rel="stylesheet" href="css/bootstrap.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css">




<style type="text/css">

	body
	{
		font-size: 14px !important;
	}	
	
	#reportTable th, td
	{
		text-align: center !important;
	}
	
	#harootContent
	{
		margin: 30px;
	}
	
	a.link { text-decoration: none; color: black; }
    a.link:visited { text-decoration: none; }
    a.link:hover { text-decoration: none; font-weight: bold; }
    a.link:focus { text-decoration: none; }
    a.link:hover, a:active { text-decoration: none; }
    
	
</style>

<script type="text/javascript">

	// 전체 체크 처리 
	$(document).ready(function()
	{
		/* 
		$("#allCheck").click(function()
		{
			$("td").children().prop("checked", this.checked);
		});
		 */
		
		// 데이터테이블 활성화
		$('#reportTable').dataTable(
		{
			
		});
		
		
	});
	

	
</script>
</head>
<body>
<div>
	
	<div id="harootContent">
		
		<br><br>
		<!-- 
		<div style="float: right;">
			<select style="height: 32px; width: 122px;">
				<option>미처리</option>
				<option>신고해제</option>
				<option>신고확정</option>
			</select>
			<button type="button" class="btn btn-dark">확인</button>
		</div>
		 -->
		<br><br>
		
		<div>
			<table id="reportTable" class="table table-striped table-condensed table-hover" style="text-align: center;" > 
				<thead>
					<tr>
						<th style="width: 100px;">신고내역코드</th>
						<th style="width: 100px;">처리 상태</th>
						<th>글 번호</th>
						<th style="width: 270px;">제목</th>
						<th>신고 접수자</th>
						<th>작성자</th>
						<th>신고접수날짜</th>
						<th>읽음</th>
					</tr>	
				</thead>	
				
				<tbody>
					<!-- 게시판 > 게시물 리스트 출력 -->
					<c:forEach var="a" items="${adBoardReportList }">
						<tr>
							<!-- 체크박스로 신고처리 보류 -->
							<!-- 
							<td>
								<input type="checkbox" class="processReport">
							</td>
							 -->
							<td>${a.rep_log_code }</td>
							<td>${a.rep_state_content }</td>
							<td>${a.board_code }</td>
							<td>
								<!-- href: action 에 처리 -->
								<a href="adminreportboardview.action?rep_log_code=${a.rep_log_code }" class="link">
									<span class="spanSt1">${a.board_title}</span>
								</a>
							</td>
							<td>${a.reporter_nickname }</td>
							<td>${a.board_writer }</td>
							<td>${a.rep_log_date }</td>
							<td>${a.log_read_state }</td>
						</tr> 		
					</c:forEach>
				</tbody>
			</table>
			
		</div>
	</div>
	
</div>

	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.25/js/dataTables.bootstrap4.min.js"></script>



</body>
</html>