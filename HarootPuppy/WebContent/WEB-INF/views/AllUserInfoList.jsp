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
<style type="text/css">
	
	/* 가운데 정렬 */
	#userTable th, td
	{
		text-align: center !important; 
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
		$(".btnDelete").click(function()
		{
			
			if (confirm("정말 삭제하시겠습니까?")) 
			{
				// alert($(this).val());
				 
				$(location).attr("href", "adminmemberdelete.action?mem_code=" + $(this).val());
				//$(location).attr("href", "https://loomio.kr");
			}
			
		});
	});

</script>
</head>
<body>
<div>
	<div id="harootHeader">
		<c:import url="AdminMenu.jsp"></c:import>
	</div>
	
	<br><br>
	
	<div id="harootContent">
		<div style="width: 100%; text-align: center;">
			<h1>전체 회원정보 조회</h1>
		</div>
		
		<br><br>
		
		<div>
			<select>
				<option>회원번호</option>
				<option>이름</option>
				<option>아이디</option>
				<option>계정상태</option>
			</select>
			<input type="text" name="searchValue" class="textField">
			<input type="button" value="검색" class="btn2" onclick="sendIt()"> 
			<p style="float: right;">전체 회원 수 : 23233</p>
		</div>
		
		<br><br>
		
		<div>
			<table class="table table-striped table-condensed table-hover" id="userTable" style="text-align: center;"> 

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
				<!-- normalList -->
				<!-- 
				<tr>
					<td>34324</td>
					<td>aa@naver.com</td>
					<td>박진수</td>
					<td>정상</td>
					<td>남</td>
					<td>010-1111-1111</td>
					<td>서울 마포구</td>
					<td>
						<button type = "button" id="detail" onclick="openDetailChild()">보기</button>
					</td>
					<td>
						<button type = "button" id="update" onclick="openUpdateChild()">수정</button>
					</td>
					<td>
						<button type = "button" id="delete">삭제</button>
					</td>
				</tr>	
				 -->
				 <c:forEach var="mem" items="${normalList}">
		 	 	<tr>
		 	 		<!-- 회원번호 -->
		 	 		<td>
		 	 			${mem.sid_code }
		 	 			<input type="hidden" name="mem_code" value="${mem.mem_code }">
		 	 		</td>
		 	 		<!-- 아이디 -->
		 	 		<td>${mem.mem_id }</td>
		 	 		<!-- 이름 -->
		 	 		<td>${mem.mem_name }</td>
		 	 		<!-- 닉네임 -->
		 	 		<td>${mem.mem_nickname }</td>
		 	 		<!-- 성별 -->
		 	 		<td>${mem.mem_gender }</td>
		 	 		<!-- 핸드폰번호 -->
		 	 		<td>${mem.mem_tel }</td>
		 	 		<!-- 주소 -->
		 	 		<td>${mem.mem_addr }</td>
		 	 		<td>
						<button type="button" id="detail" class="detail" value="" onclick="openDetailChild('${mem.sid_code}')">
							보기
						</button>
						
					</td>
					<td>
						<button type="button" class="btnUpdate" id="update" value="" onclick="openUpdateChild('${mem.sid_code}')">
							수정
						</button>
					</td>
					<td>
						<%-- <button type="button" class="btnDelete" value="${mem.sid_code }" 
						id="delete" onclick="location.href='adminmemberdelete.action?sid_code=${mem.sid_code }'"> --%>
						<button type="button" class="btnDelete" value="${mem.mem_code }" id="delete" onclick="">
							삭제
						</button>
					</td>
		 	 	</tr>
		 	 </c:forEach>
				 
			</table>
		</div>
	</div>
	<div id="harootFooter">
		<c:import url="MainFooter.jsp"></c:import>
	</div>
</div>
</body>
</html>