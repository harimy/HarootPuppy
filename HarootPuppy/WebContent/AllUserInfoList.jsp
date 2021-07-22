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
	
	function openDetailChild(sid_code)
	{
		var _width = '570';
	    var _height = '600';
	    
	    //alert(sid_code);
	    //--==>> SID001
	    
	    // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
	    var _left = Math.ceil(( window.screen.width - _width )/2);
	    var _top = Math.ceil(( window.screen.height - _height )/2); 
		
	    // window.name = "부모창 이름"; 
	    window.name = "parentForm";
	    // window.open("open할 window", "자식창 이름", "팝업창 옵션");
	    /* openWin = window.open("memberdetailinfo.action?sid_code=",
	            "childForm", "width=570, height=600, resizable = no");   */ 
	    openWin = window.open("memberdetailinfo.action?sid_code=" + sid_code
	   		 , "childForm1", 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top +', resizable=no');   
	    
	}
	
	function openUpdateChild(sid_code)
	{
		//alert(sid_code);
		//--==>> SID001
		var _width = '570';
	    var _height = '600';
	    
	 	// 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
	    var _left = Math.ceil(( window.screen.width - _width )/2);
	    var _top = Math.ceil(( window.screen.height - _height )/2); 
		
	    // window.name = "부모창 이름"; 
	   	window.name = "parentForm";
	   	
	   	
	    // window.open("open할 window", "자식창 이름", "팝업창 옵션");
	    /* openWin = window.open("UserInfoUpdateForm.jsp",
	            "childForm", "width=570, height=600, resizable = no, scrollbars = no"); */   
	    openWin = window.open("adminmemberupdateform.action?sid_code=" + sid_code
	   		 , "childForm2", 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top +', resizable=no');   
	    
	}
	

	$(function()
	{
		$(".btnDelete").click(
				function()
				{

					if (confirm("정말 삭제하시겠습니까?"))
					{
						// alert($(this).val());

						$(location).attr("href",
								"adminmemberdelete.action?mem_code=" + $(this).val());
						//$(location).attr("href", "https://loomio.kr");
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
		<!-- 메뉴 영역 -->
		<div id="harootHeader">
			<c:import url="AdminMenu.jsp"></c:import>
		</div>

		<br>
		<br>

		<div id="harootContent">
			<div style="width: 100%; text-align: center;">
				<h1>전체 회원정보 조회</h1>
			</div>

			<br>
			<br>
	
			<div style="width: 1200px; margin: 0px auto;">
			
				<span class="badge rounded-pill bg-warning text-dark" style="font-size: 12pt;">전체 회원 수: ${normalCount}명</span><br><br>
			
			</div>
	
			<div style="width: 1200px; margin: 0px auto;">
				<table class="table table-striped table-condensed table-hover table-bordered" id="example" style="text-align: center;">  
					<thead>
						<tr>
							<th>회원번호</th>
							<th>아이디</th>
							<th>이름</th>
							<th>닉네임</th>
							<th>성별</th>
							<th>핸드폰번호</th>
							<th>주소</th>
							<th>상세정보 조회</th>
							<th>회원정보 수정</th>
							<th>회원정보 삭제</th>
						</tr>	
					</thead>

					<tbody>
						<c:forEach var="mem" items="${normalList}">
							<tr>
								<!-- 회원번호 -->
								<td>${mem.sid_code } <input type="hidden" name="mem_code"
									value="${mem.mem_code }">
								</td>
								<!-- 아이디 -->
								<td>${mem.mem_id }</td>
								<!-- 이름 -->
								<td>${mem.mem_name }</td>
								<!-- 닉네임 -->
								<td>${mem.mem_nickname }</td>
								<!-- 성별 -->
								<%-- <td>${mem.mem_gender } </td> --%>
								<td>${mem.mem_gender == "F" ? '여성'  : '남성' } </td>
								<!-- 핸드폰번호 -->
								<td>${mem.mem_tel }</td>
								<!-- 주소 -->
								<td>${mem.mem_addr }</td>
								<td>
									<button type="button" id="detail" class="detail btn btn-success" 
										onclick="openDetailChild('${mem.sid_code}')">보기</button>

								</td>
								<td>
									<button type="button" class="btnUpdate btn btn-warning" id="update" value=""
										onclick="openUpdateChild('${mem.sid_code}')">수정</button>
								</td>
								<td>
								<button type="button" class="btnDelete btn btn-danger" value="${mem.mem_code }" id="delete" onclick="">삭제</button>
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