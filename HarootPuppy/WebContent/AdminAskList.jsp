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
<title>AdminAskList.jsp</title>

<link rel="stylesheet" href="css/bootstrap.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css">


<style type="text/css">
/* 가운데 정렬 */

	body
	{
		font-size: 14px !important;
	}

#userTable th, td 
	{
		text-align: center !important;
	}

#askList 
	{
		height: 700px;
	}

</style>

<script type="text/javascript">

	$(document).ready(function()
	{

		$('#userTable').dataTable(
		{
			/* 0번째 인덱스로 내림차순으로 정렬 */
			  order: [[0, 'desc']],
			  ordering: true
			
		});
	});

</script>

</head>
<body>

	<!-----------------------------
  AdminAskList.jsp
  - 관리자가 보는 1:1 고객문의 게시판
------------------------------->
	<div>
		<!-- 메뉴영역 -->
		<div id="harootHeader">
			<c:import url="AdminMenu.jsp"></c:import>
		</div>
		
		<br>
		<br>

		<!-- content 영역 -->
		<div id="askList">
			<div style="width: 100%; text-align: center;">
				<h1>1:1 문의 게시판</h1>
			</div>

			<br>
			<br>

			
			<div style="width: 1200px; margin: 0px auto;">
			
				<span class="badge rounded-pill bg-warning text-dark" style="font-size: 12pt;">읽지않은 문의글 수 : ${askNotRead }건</span><br><br>
			
			</div>

			<br>
			<br>

			<div style="width: 1200px; margin: 0px auto;">
				<table
					class="table table-striped table-condensed table-hover table-bordered"
					id="userTable" style="text-align: center;">
					<thead>
						<tr>
							<th>글번호</th>
							<th>카테고리</th>
							<th>글제목</th>
							<th>닉네임</th>
							<th>작성일자</th>
							<th>읽음상태</th>
							<th>답변상태</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach var="ask" items="${adminAskList}">
							<tr>
								<td>${ask.ask_code }</td>
								<td>${ask.ask_cate_content }</td>
								<td>
									<a href="adminaskview.action?ask_code=${ask.ask_code }" class="link">
										${ask.ask_title }
									</a>
								
								</td>
								
								<td>${ask.mem_nickname }</td>
								<td>${ask.ask_date }</td>
								<td>
									${ask.ask_read == null ? 'Ⅹ' : '○' }
									<%-- <input type="hidden" name="ask_read" id="ask_read" value="${ask.ask_read }"> --%>
								</td>
								<td>${ask.ask_state_content }</td>
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