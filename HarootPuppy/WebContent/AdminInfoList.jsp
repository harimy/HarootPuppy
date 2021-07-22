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
<title>AllUserInfoList.jsp</title>
<link rel="stylesheet" href="css/bootstrap.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css">



<style type="text/css">

.btn { font-size: 9pt;}

body
{
	font-size: 14px !important;
}

</style>

<script type="text/javascript">

	var openWin;
	
	function insertAdmin()
	{
		var _width = '570';
	    var _height = '400';
	    
	    
	    // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
	    var _left = Math.ceil(( window.screen.width - _width )/2);
	    var _top = Math.ceil(( window.screen.height - _height )/2); 
		
	    // window.name = "부모창 이름"; 
	    window.name = "parentForm2";
	    // window.open("open할 window", "자식창 이름", "팝업창 옵션");
	    /* openWin = window.open("memberdetailinfo.action?sid_code=",
	            "childForm", "width=570, height=600, resizable = no");   */ 
	    openWin = window.open("admininsertform.action", "childForm3", 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top +', resizable=no');   
	    
	}


	$(function()
	{
		$(".btnDelete").click(
				function()
				{

					if (confirm("정말 삭제하시겠습니까?"))
					{
						//alert($(this).val());

						$(location).attr("href", "admindelete.action?admin_code=" + $(this).val());
					}

				});
	});

	$(document).ready(function()
	{

		$('#example').dataTable(
		{
			
		});
	});
	
</script>
</head>
<body>
	<div>
		<div id="harootHeader">
			<c:import url="AdminMenu.jsp"></c:import>
		</div>

		<br>
		<br>

		<div id="harootContent">
			<div style="width: 100%; text-align: center;">
				<h1>관리자 정보 조회</h1>
			</div>

			<br>
			<br>
	
			<div style="width: 1200px; margin: 0px auto;">
				<button type="button" class="btnUpdate btn btn-warning" id="update" value="" onclick="insertAdmin()">관리자 추가</button><br><br>
			
			</div>
	
			<div style="width: 1200px; margin: 0px auto;">
				<!-- 부트스트랩 적용전 -->
				<table class="table table-striped table-condensed table-hover table-bordered" id="example" style="text-align: center;">  
					<thead>
						<tr>
							<th>관리자번호</th>
							<th>아이디</th>
							<th>이름</th>
							<th>등록일자</th>
							<th>정보 삭제</th>
						</tr>	
					</thead>

					<tbody>
						<c:forEach var="admin" items="${adminList}">
							<tr>
								<!-- 관리자번호 -->
								<td>${admin.admin_code } <input type="hidden" name="admin_code"
									value="${admin.admin_code }">
								</td>
								<!-- 아이디 -->
								<td>${admin.admin_id }</td>
								<!-- 이름 -->
								<td>${admin.admin_name }</td>
								<!-- 등록일자 -->
								<td>${admin.admin_regdate }</td>
								
								<!-- 
								<td>
									<button type="button" class="btnUpdate btn btn-warning" id="update" value=""
										onclick="openUpdateChild()">수정</button>
								</td>
								 -->
								<td>
								<button type="button" class="btnDelete btn btn-danger" value="${admin.admin_code }" id="delete" onclick="">삭제</button>
								</td>
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